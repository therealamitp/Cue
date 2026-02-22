//Cue
//Created by Amit Prakash
import SwiftUI

struct BoardingSectionView: View {
    let imageName: String
    let title: String
    let description: String
    let onNext: () -> Void
    var isLast: Bool = false
    var isLoading: Bool = false
    let proxy: GeometryProxy
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: proxy.size.width / 2
                )
            
            Spacer()
            
            Spacer()
                .frame(height: 64)
            
            VStack(alignment: .center, spacing: 0) {
                Text(title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(height: 16)
                
                Text(description)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .fontWeight(.medium)
            }
            .foregroundColor(.OnPrimary)
            .padding(32)
            .background(
                Color.Primary
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 16)
            )
            
            Spacer()
                .frame(height: 64)
            
            Button {
                onNext()
            } label: {
                if isLoading {
                    HStack {
                        Spacer()
                        
                        ProgressView()
                        
                        Spacer()
                    }
                } else {
                    Text(
                        isLast ? "Let's Start"
                        : "Next"
                    )
                    .frame(
                        maxWidth: .infinity
                    )
                }
            }
            .accentColor(.Primary)
            .foregroundColor(.OnPrimary)
            .buttonStyle(.borderedProminent)
            .cornerRadius(16)
            .disabled(isLoading)
            
            Spacer()
        }
        .padding(32)
    }
}

#Preview {
    GeometryReader { proxy in
        BoardingSectionView(
            imageName: "",
            title: "",
            description: "",
            onNext: {  },
            isLast: false,
            isLoading: false,
            proxy: proxy
        )
    }
}
