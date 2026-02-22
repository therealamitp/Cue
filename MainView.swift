

import SwiftUI

struct MainView: View {
    @State private var currentPosition: CameraPosition = .Front
    @State private var showUpButton: Bool = false
    
    var body: some View {
        GeometryReader { geoProxy in
            ScrollViewReader { proxy in
                ZStack {
                    List {
                        Section {
                            HowToCard()
                        }
                        .id("top")
                        .onAppear {
                            showUpButton = false
                        }
                        .onDisappear {
                            showUpButton = true
                        }
                        .listRowBackground(Color.PrimaryVariant)
                        
                        Section{
                        ManagingPressureCard()
                        RespondingtoCriticismCard()
                        PresentationSkillsCard()
                    } 
                        header: {
                            Text("Lessons")
                            
                            
                        }
                            
                        
                        .id("top")
                        .onAppear {
                            showUpButton = false
                        }
                        .onDisappear {
                            showUpButton = true
                        }
                        .listRowBackground(Color.PrimaryVariant)
                        
                       
                        .listRowBackground(Color.PrimaryVariant)
                    }
                    .listStyle(.plain)
                    
                    if showUpButton {
                        ZStack(alignment: .bottomTrailing) {
                            Color.clear
                            
                            Button {
                                withAnimation {
                                    proxy.scrollTo("top", anchor: .top)
                                }
                            } label: {
                                Circle()
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .frame(width: 45, height: 45, alignment: .center)
                                    .overlay(
                                        Image(systemName: "arrow.up.to.line")
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Cue")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: -1) {
                        Button {
                            currentPosition = currentPosition == .Front ? .Back : .Front
                        } label: {
                            Image(systemName: "arrow.2.squarepath")
                                .foregroundColor(.Primary)
                        }
                        
                        Text(currentPosition.rawValue)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        DetectionView(
                            position: currentPosition == .Front ? .front : .back
                        )
                    } label: {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.Primary)
                    }
                }
            }
            .background(
                Color.PrimaryVariant
                    .ignoresSafeArea()
            )
            .colorScheme(.dark)
        }
    }
}

#Preview {
    MainView()
}
