//Cue

import SwiftUI

struct Lesson2View: View {
    @State private var currentSection: LessonSection = .One
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            switch currentSection {
            case .One:
                LessonSectionView(
                    imageName: "presentationcartoon",
                    title: "Conquering Presentation Anxiety",
                    description: "Equip yourself with evidence-based techniques to manage and overcome the fear of public speaking.",
                    onNext: {
                        currentSection = .Two
                    },
                    proxy: proxy
                )
            case .Two:
                LessonSectionView(
                    imageName: "?",
                    title: "Did You Know?",
                    description: "According to columbia.edu, up to 85% of people experience anxiety when speaking in public.\n Fact: This fear is common and manageable with the right strategies.",
                    onNext: {
                        currentSection = .Three
                    },
                    proxy: proxy
                )
            case .Three:
                LessonSectionView(
                    imageName: "breathing",
                    title: "Breathing Techniques for Calmness",
                    description: "Tip: Deep breathing can help manage anxiety. Exercise: Follow the guided breathing exercise: \n •Inhale slowly for 4 seconds. \n •Hold your breath for 4 seconds. \n•Exhale slowly for 6 seconds. \n•Pause for 2 seconds before the next breath. \n•Practice this cycle three times.",
                    onNext: {
                        currentSection = .Four
                    },
                    proxy: proxy
                )
            case .Four:
                LessonSectionView(
                    imageName: "visualize",
                    title: "Visualization Techniques",
                    description: "Tip: Positive visualization can reduce anxiety.\n Try this exercise: Spend a minute imagining youself giving a successful presentation.",
                    onNext: {
                        currentSection = .Five
                    },
                    proxy: proxy
                )
            case .Five:
                LessonSectionView(
                    imageName: "guyone",
                    title: "Gradual Exposure",
                    description: "It's a great idea to start with smaller audiences before building up to big ones.\n You can practice with family, friends, or join a local group or club for public speaking.",
                    onNext: {
                        currentSection = .Six
                    },
                    proxy: proxy
                )
            case .Six:
                LessonSectionView(
                    imageName: "simplebrain",
                    title: "Cognitive Restructuring",
                    description: "Restructure negative thoughts. Instead of thinking you will fail, imagine success!",
                    onNext: {
                        currentSection = .Seven
                    },
                    proxy: proxy
                )
            case .Seven:
                LessonSectionView(
                    imageName: "xv",
                    title: "Embrace Imperfection",
                    description: "A part of learning in general is accepting that no one is perfect. Even experienced speakers make mistakes, and it's normal.",
                    onNext: {
                        currentSection = .Eight
                    },
                    proxy: proxy
                )
            case .Eight:
                LessonSectionView(
                    imageName: "guytwo",
                    title: "Long Term Confidence Building",
                    description: "Remember: Confidence isn't gained overnight. It takes time to build.\n Remember that every step in your journey is a step forward.",
                    onNext: {
                        currentSection = .Nine
                    },
                    proxy: proxy
                )
            case .Nine:
                LessonSectionView(
                    imageName: "mic",
                    title: "Focus on Your Audience, Not Yourself",
                    description: "When speaking to anyone, it's a good practice to focus attention on them.\n When we hyperfixate on ourselves, we tend to believe we have more problems that others can't see.",
                    onNext: {
                        currentSection = .Ten
                    },
                    proxy: proxy
                )
                
            case .Ten:
                LessonSectionView(
                    imageName: "star",
                    title: "You Finished this Lesson!",
                    description: "🎉Congrats! You finished lesson three. You may continue to browse lessons or continue your daily skills training. \n Please click the back arrow on the top left to exit.",
                    onNext: {
                        isLoading = true
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
    
    private func finishLesson() {
        DispatchQueue.main.async {
            let userDefaults = UserDefaults.standard
            userDefaults.set(false, forKey: "showLesson")
        }
    }
}

#Preview {
    Lesson2View()
}

