import SwiftUI

struct WelcomeView: View {
    @State private var isOnboardingActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBlue).edgesIgnoringSafeArea(.all)
                
                Text("Ryde")
                    .font(.system(size: 66, weight: .heavy, design: .serif))
                    .foregroundColor(.white)
            }
            .onAppear {
         
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
