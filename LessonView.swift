//Cue

import SwiftUI

struct LessonView: View {
    @State private var currentSection: LessonSection = .One
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            switch currentSection {
            case .One:
                LessonSectionView(
                    imageName: "Boarding1",
                    title: "Managing Pressure in Social Contexts",
                    description: "Welcome to Cue lessons! \n This lesson is going to focus on managing social pressure. \n We'll learn to: \n •Recognize types of social pressure \n •Stay confident in high-pressure situations \n •Set boundaries and say 'no' effectively",
                    onNext: {
                        currentSection = .Two
                    },
                    proxy: proxy
                )
            case .Two:
                LessonSectionView(
                    imageName: "?",
                    title: "What is Social Pressure?",
                    description: "According to the Oxford Dictionary, pressure is defined as: \n \n the use of persuasion, influence, or intimidation to make someone do something. \n \n Examples of pressure include: \n •Feeling like you have to agree with a group \n •Being pushed to do something risky \n •Wanting to 'fit in' even if it feels wrong",
                    onNext: {
                        currentSection = .Three
                    },
                    proxy: proxy
                )
            case .Three:
                LessonSectionView(
                    imageName: "socialpressure",
                    title: "Types of Social Pressure",
                    description: "Not all pressure is the same! \n 1. Direct Pressure - Someone explicitly tells you to do something. \n 2. Indirect Pressure - You feel pressured based on what others are doing. \n 3. Self-Imposed Pressure - You assume others expect something from you, even when they don't.",
                    onNext: {
                        currentSection = .Four
                    },
                    proxy: proxy
                )
            case .Four:
                LessonSectionView(
                    imageName: "themirror",
                    title: "Staying True to Yourself",
                    description: "Your values are your choices! \n When faced with pressure, ask yourself: \n \n 'Do I actually want to do this?' \n 'Does this align with my values?' \n 'Would I feel good about this decision tomorrow?' \n \n The strongest people know when to say 'no'!",
                    onNext: {
                        currentSection = .Five
                    },
                    proxy: proxy
                )
            case .Five:
                LessonSectionView(
                    imageName: "boundaries",
                    title: "How to Say 'No' Respectfully",
                    description: "Always remember: \n It's okay to say NO! \n Try these responses when you feel like you're under pressure. \n \n 'No thanks, that's not for me.' (Direct + Confident) \n 'I appreciate it, but I'll pass.' (Polite + Firm)",
                    onNext: {
                        currentSection = .Six
                    },
                    proxy: proxy
                )
            case .Six:
                LessonSectionView(
                    imageName: "anotherguy",
                    title: "Handling Stress in the Moment",
                    description: "Feeling overwhelmed in a social setting? Try this: \n \n 🛑 Pause - Take a breath before reacting \n 👀 Observe - What's making you feel pressured? \n 💡 Decide - Do you want to go along or set a boundary? \n \n Let's use this in the context of a social situation!",
                    onNext: {
                        currentSection = .Seven
                    },
                    proxy: proxy
                )
            case .Seven:
                LessonSectionView(
                    imageName: "xv",
                    title: "Practice Scenario",
                    description: "Situation: A friend is trying to convince you to go to a party that you aren't up for. \n How do you respond? \n \n A) 'I'm good, I don't need to go.' \n B) 'Sure, I guess...' \n C) 'I dunno, maybe later?' \n \n Answers are on the next slide!",
                    onNext: {
                        currentSection = .Eight
                    },
                    proxy: proxy
                )
            case .Eight:
                LessonSectionView(
                    imageName: "writeans",
                    title: "Answers",
                    description: "The correct answer was A. \n A clear and confident response always works best!",
                    onNext: {
                        currentSection = .Nine
                    },
                    proxy: proxy
                )
            case .Nine:
                LessonSectionView(
                    imageName: "guyone",
                    title: "Key Takeaways",
                    description: "The key takeaways from this lesson are: \n \n Recognize different types of social pressure \n Pause & Reflect before reacting \n Use clear and confident responses \n Stay true to your values \n \n Confidence = knowing when to say yes AND when to say no!",
                    onNext: {
                        currentSection = .Ten
                    },
                    proxy: proxy
                )
            case .Ten:
                LessonSectionView(
                    imageName: "star",
                    title: "You Finished this Lesson!",
                    description: "🎉Congrats! You finished lesson one. You may continue to browse lessons or continue your daily skills training. \n \n Please click the back arrow on the top left to exit.",
                    onNext: {
                        isLoading = true
                        finishLesson()
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
    LessonView()
}

