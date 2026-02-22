//Cue

import SwiftUI

struct Lesson3View: View {
    @State private var currentSection: LessonSection = .One
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            switch currentSection {
            case .One:
                LessonSectionView(
                    imageName: "negate",
                    title: "Responding to Negative Ideas",
                    description: "This lesson is to help you equip ways to manage emotions that may arise when things don't go your way during social interactions.",
                    onNext: {
                        currentSection = .Two
                    },
                    proxy: proxy
                )
            case .Two:
                LessonSectionView(
                    imageName: "?",
                    title: "Start by Thinking",
                    description: "When someone says something triggering, start by taking a step back. Reacting emotionally can make situations like these harder than they need to be. \nThink: \n \"Is this helpful or just mean?\" \n \"How can I learn from this?\" \n \"What's the best way to respond?\"",
                    onNext: {
                        currentSection = .Three
                    },
                    proxy: proxy
                )
            case .Three:
                LessonSectionView(
                    imageName: "recognizer",
                    title: "Recognizing Criticism",
                    description: "🔍 Not all criticism is the same! \n 1️⃣ Constructive – Helps you improve (Ex: Your essay is great, but adding more examples would make it stronger.) \n 2️⃣ Destructive – Just meant to hurt (Ex: Your work is awful, you should quit.) \n🎯 Focus on the useful part and let go of the rest! ",
                    onNext: {
                        currentSection = .Four
                    },
                    proxy: proxy
                )
            case .Four:
                LessonSectionView(
                    imageName: "guytwo",
                    title: "Responding to Constructive Criticism",
                    description: "💬 Use Positive Responses \n Instead of feeling bad, try these responses: \n Ugh, I messed up! → ✅ Thanks for the feedback! I’ll improve it. \n I can’t do this! → ✅ That’s a good point. I’ll work on it! \n Growth mindset = progress!",
                    onNext: {
                        currentSection = .Five
                    },
                    proxy: proxy
                )
            case .Five:
                LessonSectionView(
                    imageName: "guyone",
                    title: "Responding to Destructive Criticism",
                    description: "🚫 Ignore or Redirect \n👤 You’re terrible at this! \n ✅ Option 1: Ignore and move on. \n ✅ Option 2: Respond calmly: I’m working on it, but I’d appreciate helpful feedback. \n You don’t have to engage with negativity!",
                    onNext: {
                        currentSection = .Six
                    },
                    proxy: proxy
                )
            case .Six:
                LessonSectionView(
                    imageName: "bodylang",
                    title: "Tone and Body Language",
                    description: "Your words AND how you say them matter! \n ❌ Bad Response: Whatever, I don’t care! (Crossed arms, eye roll) \n ✅ Good Response: I see what you mean, I’ll work on that. (Calm voice, eye contact) \n 💡 Tip: Keep a neutral or friendly tone.",
                    onNext: {
                        currentSection = .Seven
                    },
                    proxy: proxy
                )
            case .Seven:
                LessonSectionView(
                    imageName: "xv",
                    title: "Let's Practice!",
                    description: "Think about what the right answer should be. Answers are on the next slide. \n Situation: A friend jokes that your outfit looks weird. \n 💬 What should you say? \n A) Wow, that’s rude! \n                            B) Well, I like it, and that’s all that really matters. \nC) You're right, I don't like it either… ",
                    onNext: {
                        currentSection = .Eight
                    },
                    proxy: proxy
                )
            case .Eight:
                LessonSectionView(
                    imageName: "writeans",
                    title: "Answers",
                    description: "Answer B was correct. \n  Confidence + composure = best response!",
                    onNext: {
                        currentSection = .Nine
                    },
                    proxy: proxy
                )
            case .Nine:
                LessonSectionView(
                    imageName: "Boarding2",
                    title: "Key Takeaways",
                    description: "📝 Remember: \n ✅ Pause before reacting \n ✅ Identify if criticism is helpful or hurtful \n ✅ Respond calmly & seek improvement \n ✅ Ignore unhelpful negativity \n ✅ Use confident tone & body language",
                    onNext: {
                        currentSection = .Ten
                    },
                    proxy: proxy
                )
                
            case .Ten:
                LessonSectionView(
                    imageName: "star",
                    title: "You Finished this Lesson!",
                    description: "🎉Congrats! You finished lesson two. You may continue to browse lessons or continue your daily skills training. \n Please click the back arrow on the top left to exit.",
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
    Lesson3View()
}

