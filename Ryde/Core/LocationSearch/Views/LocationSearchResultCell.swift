import SwiftUI

struct LocationSearchResultCell : View {
    
    let title : String
    let subtitle : String
    
    var body : some View {
        
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(subtitle)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
                
                Divider()
                
            }
            
            Spacer()
        }
        .padding(.leading, 8)
        .padding(.vertical, 8)
        
      
    }
}

#Preview {
    LocationSearchResultCell(title: "Costa Coffee", subtitle: "Tashkent, Uzbekistan")
}
