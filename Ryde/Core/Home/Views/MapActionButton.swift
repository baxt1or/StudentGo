import SwiftUI


struct MapActionButton : View {
    
    @Binding var mapState : MapViewState
    @ObservedObject  var viewModel : LocationSearchViewModel
    
    
    var body : some View {
        
        Button {
            withAnimation(.spring()){
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
   
        
    }
    
    func actionForState(_ state : MapViewState){
        switch state {
        case .noInput:
              print("No Input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            mapState = .noInput
            viewModel.selectedStudentGoLocation = nil
          
        }
    }
    
    
    func imageNameForState(_ state : MapViewState) -> String{
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        }
    }
        
}


//#Preview {
//    MapActionButton(showLocationSearchView: .constant(.noInput))
//}
