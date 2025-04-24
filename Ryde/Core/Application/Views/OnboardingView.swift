import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 1
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack {
            VStack {
              
                switch currentStep {
                case 1:
                    OnboardingViewOne(currentStep: $currentStep)
                case 2:
                    OnboardingViewTwo(currentStep: $currentStep)
                case 3:
                    OnboardingViewThree(currentStep: $currentStep)
                default:
                    EmptyView()
                }
                
                if currentStep > 3 {
                  
                    Text("Welcome Student")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                navigateToHome = true
                            }
                        }
                }
            }
            .background(
                NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                    EmptyView()
                }
            )
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
