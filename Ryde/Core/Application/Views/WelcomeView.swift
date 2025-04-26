import SwiftUI

struct WelcomeView: View {
    @State private var isOnboardingActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBlue).edgesIgnoringSafeArea(.all)
                
                Text("StudentGo")
                    .font(.system(size: 54, weight: .heavy, design: .serif))
                    .italic()
                    .foregroundColor(.white)
            }
            .onAppear {
         
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isOnboardingActive = true
                }
            }
            .fullScreenCover(isPresented: $isOnboardingActive) {
                OnboardingView()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
