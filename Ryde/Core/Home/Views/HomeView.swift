import SwiftUI
import SwiftData

struct HomeView : View {
    
    @State private var showLocationSearchView = false
    @StateObject var locationViewModel =  LocationSearchViewModel()
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .top){
            
            
            RydeMapViewRepresentable(mapState: $mapState, locationViewModel: locationViewModel)
                .ignoresSafeArea()
            
           
            
            if mapState == .searchingForLocation {
                LocationSearchView(mapState : $mapState, viewModel: locationViewModel)
            } else if mapState == .noInput {
                LocationSearchActivationView()
                    .padding(.top, 62)
                    .onTapGesture {
                        withAnimation(.spring()){
                            mapState = .searchingForLocation
                        }
                    }
            }
            
          
            MapActionButton(mapState : $mapState)
                .padding(.top, 4)
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    HomeView()
}


