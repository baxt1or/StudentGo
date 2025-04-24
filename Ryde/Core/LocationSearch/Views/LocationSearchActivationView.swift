import SwiftUI
import SwiftData

struct LocationSearchActivationView : View {
    
    var body : some View {
        
        HStack{
            
            Image(systemName: "car")
                .resizable()
                .frame(width: 20, height: 20)
                .scaledToFit()
            
            Spacer()
            
            Text("Where to?")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            
            Spacer()
            
            Image(systemName: "chevron.right.circle")
            
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
