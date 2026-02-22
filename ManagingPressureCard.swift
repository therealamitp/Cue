

import SwiftUI

struct ManagingPressureCard: View {
    var body: some View {
        NavigationLink {
            LessonView()
        } label: {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Managing Pressure")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Social Skills for Managing Pressure in Tough Situations")
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
    ManagingPressureCard()
}
