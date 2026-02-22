import SwiftUI

struct RespondingtoCriticismCard: View {
    var body: some View {
        NavigationLink {
            Lesson3View()
        } label: {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Responding to Criticism")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Lessons on Anger and Criticism Management")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.medium)
                }
                
                Spacer()
            }
        }
        .foregroundColor(.OnPrimary)
        .padding(25)
        .background(
            Color.Primary
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 30
            )
        )
    }
}

#Preview {
    RespondingtoCriticismCard()
}


