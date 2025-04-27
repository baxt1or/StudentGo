import SwiftUI

struct OnboardingViewTwo: View {
    @Binding var currentStep: Int
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    
                    currentStep = 4
                }) {
                    Text("Skip")
                        .font(.system(size: 18, weight: .light))
                        .foregroundColor(.black)
                }
                .padding(.top, 20)
                .padding(.horizontal, 12)
            }
            
            Image("onboarding2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 350)
                .clipped()
                .padding(.top, 40)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("The perfect ride is just a tap away!")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.horizontal, 20)
                
                Text("Your journey begins with StudentGo. Find your ideal ride effortlessly.")
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            HStack(spacing: 8) {
                ForEach(1...3, id: \.self) { index in
                    Rectangle()
                        .fill(
                            AnyShapeStyle(
                                index == currentStep
                                ? Color.blue
                                : Color(.systemGray).opacity(0.3)
                            )
                        )
                        .frame(width: 40, height: 3)
                        .cornerRadius(12)
                }
            }
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                // Move to next step
                currentStep += 1
            } label: {
                Text("Next")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue), Color(.systemIndigo)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .background(Color.white)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
