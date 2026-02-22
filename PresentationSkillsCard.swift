import SwiftUI
struct PresentationSkillsCard: View {
    var body: some View {
        NavigationLink {
            Lesson2View()
        } label: {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Presentational Skills")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Lessons on General Presentation Skills")
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
    PresentationSkillsCard()
}
