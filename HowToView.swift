//Cue

import SwiftUI

struct HowToView: View {
    @State private var currentSection: HowToSection = .One
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            switch currentSection {
            case .One:
                LessonSectionView(
                    imageName: "emotions",
                    title: "Emotion Reader Guide",
                    description: "This short guide is to show you how to use the emotion reader feature of Cue, and why it's important.",
                    onNext: {
                        currentSection = .Two
                    },
                    proxy: proxy
                )
            case .Two:
                LessonSectionView(
                    imageName: "Boarding2",
                    title: "Why It's Important For You",
                    description: "Emotional awareness is key to your well-being! \n \n •Recognizing and understanding how you portray your emotions helps you navigate social situations better. \n •For individuals with Autism Spectrum Disorder (ASD), recognizing emotions can be challenging. \n •Multiple studies show that practicing emotional recognition can drastically improve the lives of individuals with ASD. \n •This tool bridges that gap, helping to develop emotional intelligence and improve social skills.",
                    onNext: {
                        currentSection = .Three
                    },
                    proxy: proxy
                )
            case .Three:
                LessonSectionView(
                    imageName: "to find",
                    title: "How to Find Emotion Reader in the App",
                    description: "The emotion reader can be easily found by pressing the camera icon in the top right of the main menu.\n Next to it, you can also change which camera side you use.",
                    onNext: {
                        currentSection = .Four
                    },
                    proxy: proxy
                )
            case .Four:
                LessonSectionView(
                    imageName: "ideal",
                    title: "Tips for Getting the Most Accurate Results",
                    description: "Here's how you can get the best reading: \n \n •Make sure you're in a well lit area \n •Show all of your face at all times",
                    onNext: {
                        currentSection = .Five
                    },
                    proxy: proxy
                )
            case .Five:
                LessonSectionView(
                    imageName: "star",
                    title: "🎉You're Ready to Use the Emotion Reader!",
                    description: "Ready to get started? Tap on the camera icon to begin! \n Please press the back button to exit this guide.",
                    onNext: {
                        isLoading = true
                    },
                    proxy: proxy
                )
            }
        }
        .background(
            Color.PrimaryVariant
                .ignoresSafeArea()
        )
    }
    
    private func finishLesson() {
        DispatchQueue.main.async {
            let userDefaults = UserDefaults.standard
            userDefaults.set(false, forKey: "showLesson")
        }
    }
}

#Preview {
    HowToView()
}

