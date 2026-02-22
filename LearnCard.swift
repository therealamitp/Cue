
import SwiftUI

struct LearnCard: View {
    var body: some View {
        NavigationLink {
            LearningView()
        } label: {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Daily Skills Training")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Your Daily Social Scenario Practice")
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
    LearnCard()
}
