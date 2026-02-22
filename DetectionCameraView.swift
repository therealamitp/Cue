import SwiftUI
import AVFoundation
import Vision

struct DetectionCameraView: UIViewControllerRepresentable {
    var predictionHandler: (String) -> Void
    var errorMessageHandler: (String) -> Void
    var position: AVCaptureDevice.Position
    
    func makeUIViewController(context: Context) -> DetectionCameraViewController {
        let cvc = DetectionCameraViewController()
        
        cvc.predictionHandler = predictionHandler
        cvc.errorMessageHandler = errorMessageHandler
        cvc.position = position
        
        return cvc
    }
    
    func updateUIViewController(
        _ uiViewController: DetectionCameraViewController,
        context: Context
    ) {
    }
}
