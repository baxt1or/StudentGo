import SwiftUI

struct LoginView : View {
    var body: some View {
        VStack(spacing: 0) {
           
            Image("login_background1")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 400)
                .clipped()
                .edgesIgnoringSafeArea(.top)
            
            
           
        
            
            VStack(spacing: 16) {
                Text("Let’s get started")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.horizontal, 20)
                
                Text("Sign up or log in to find out the best car for you")
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            
            VStack{
                Button {
                  
                } label: {
                    Text("Sign Up")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue), Color(.systemIndigo)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                        .shadow(radius: 10)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
                
                Divider()
                    .padding(.horizontal, 20)
                
                
                Button {
                 
                } label: {
                    HStack {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Log In with Google")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.white)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 18)

                
                HStack{
                    Text("Don’t have an account?")
                        .foregroundColor(Color(.systemGray))
                    Text("Log in")
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.bottom, 60)

            }
       
        }
    }
}

#Preview {
    LoginView()
}
