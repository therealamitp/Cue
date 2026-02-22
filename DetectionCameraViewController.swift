import UIKit
import AVFoundation
import Vision

final class DetectionCameraViewController: UIViewController {
    private var cameraView: CameraPreview { view as! CameraPreview }
    
    private let videoDataOutputQueue = DispatchQueue(
        label: "CameraFeedOutput",
        qos: .userInteractive
    )
    private var cameraFeedSession: AVCaptureSession?
    private var imageClassifier: VNCoreMLModel!
    
    var predictionHandler: (String) -> Void = { _ in }
    var errorMessageHandler: (String) -> Void = { _ in }
    var position: AVCaptureDevice.Position?
    
    override func loadView() {
        view = CameraPreview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do {
            if cameraFeedSession == nil {
                try setupAVSession(position: position)
                cameraView.previewLayer.session = cameraFeedSession
                cameraView.previewLayer.videoGravity = .resizeAspectFill
            }
            DispatchQueue.main.async {
                self.cameraFeedSession?.startRunning()
            }
        } catch {
            print("Camera setup error: \(error.localizedDescription)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cameraFeedSession?.stopRunning()
        super.viewWillDisappear(animated)
    }
    
    private func setupModel() {
        do {
            let config = MLModelConfiguration()
            let model = try HandSignReader(configuration: config).model
            imageClassifier = try VNCoreMLModel(for: model)
        } catch {
            fatalError("Failed to load Core ML model: \(error)")
        }
    }
    
    func setupAVSession(position: AVCaptureDevice.Position?) throws {
        guard let videoDevice = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: position ?? .front
        ) else {
            errorMessageHandler("Could not find a back-facing camera.")
            return
        }
        
        guard let deviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {
            errorMessageHandler("Could not create video device input.")
            return
        }
        
        let session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = .high
        
        guard session.canAddInput(deviceInput) else {
            errorMessageHandler("Could not add video input to session.")
            return
        }
        session.addInput(deviceInput)
        
        let dataOutput = AVCaptureVideoDataOutput()
        if session.canAddOutput(dataOutput) {
            session.addOutput(dataOutput)
            dataOutput.alwaysDiscardsLateVideoFrames = true
            dataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
            errorMessageHandler("Could not add video data output to session.")
        }
        
        session.commitConfiguration()
        cameraFeedSession = session
    }
}

extension DetectionCameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            print("Failed to get pixel buffer")
            return
        }
        
        let request = VNCoreMLRequest(model: imageClassifier) { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first else {
                print("No classification result")
                return
            }
            
            DispatchQueue.main.async {
                self.predictionHandler(topResult.identifier)
            }
        }
        request.imageCropAndScaleOption = .centerCrop
        
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("Core ML evaluation error: \(error.localizedDescription)")
        }
    }
}
