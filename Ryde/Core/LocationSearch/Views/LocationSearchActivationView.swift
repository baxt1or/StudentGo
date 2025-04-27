import SwiftUI
import SwiftData

struct LocationSearchActivationView : View {
    
    var body : some View {
        
        HStack{
            
            Image("studentgo-comfort")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Text("Where to?")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .padding(.trailing)
            
            
            Spacer()
            
            Image(systemName: "chevron.right")
            
        }
        .padding(12)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color(.white))
        .cornerRadius(12)
        .padding(.horizontal, 12)
        .shadow(radius: 12)
        
    }
}


#Preview {
    LocationSearchActivationView()
}
