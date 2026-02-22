import SwiftUI

struct HowToCard: View {
    var body: some View {
        NavigationLink {
            HowToView()
        } label: {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("How to Use The Emotion Reader")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Get Started with Understanding the Context of Your Emotions")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.medium)
                }
                
                Spacer()
            }
        }
        .foregroundColor(.OnPrimary)
        .padding(32)
        .background(
            Color.Primary
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16
            )
        )
    }
}

#Preview {
    HowToCard()
}
