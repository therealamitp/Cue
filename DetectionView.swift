import SwiftUI
import AVFoundation
import Vision

struct DetectionView: View {
    @State private var prediction: String?
    @State private var errorMessage: String?
    let position: AVCaptureDevice.Position
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .background(Color.PrimaryVariant)
            
            DetectionCameraView(
                predictionHandler: {
                    prediction = $0
                },
                errorMessageHandler: {
                    errorMessage = $0
                },
                position: position
            )
            .background(.black)
            
            
            HStack {
                Spacer()
                
                VStack(spacing: 16) {
                    Text(prediction ?? "Unknown")
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detection")
        .navigationBarTitleDisplayMode(.inline)
        .background(
            Color.PrimaryVariant.ignoresSafeArea()
        )
    }
}

#Preview {
    DetectionView(
        position: .front
    )
}

