//Cue

import SwiftUI

struct BoardingView: View {
    @State private var currentSection: BoardingSection = .One
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            switch currentSection {
            case .One:
                BoardingSectionView(
                    imageName: "Boarding1",
                    title: "SEL Redefined.",
                    description: "Cue is an app powered by machine learning designed to help individuals with ASD identify social cues.",
                    onNext: {
                        currentSection = .Two
                    },
                    proxy: proxy
                )
            case .Two:
                BoardingSectionView(
                    imageName: "Boarding2",
                    title: "Practice Social Scenarios",
                    description: "You can utilize Cue's lessons to understand emotional context. You can also use the camera to understand how you portray your emotions.",
                    onNext: {
                        currentSection = .Three
                    },
                    proxy: proxy
                )
            case .Three:
                BoardingSectionView(
                    imageName: "Boarding3",
                    title: "Manage Social Anxiety",
                    description: "With practice, you can manage social anxiety and communicate your thoughts more accurately!",
                    onNext: {
                        isLoading = true
                        hideBoarding()
                    },
                    isLast: true,
                    isLoading: isLoading,
                    proxy: proxy
                )
            }
        }
        .background(
            Color.PrimaryVariant
                .ignoresSafeArea()
        )
    }
    
    private func hideBoarding() {
        DispatchQueue.main.async {
            let userDefaults = UserDefaults.standard
            
            userDefaults.set(false, forKey: "showBoarding")
        }
    }
}

#Preview {
    BoardingView()
}
