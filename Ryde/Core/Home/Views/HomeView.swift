import SwiftUI
import SwiftData

struct HomeView : View {
    
    @State private var showLocationSearchView = false
    @StateObject var locationViewModel =  LocationSearchViewModel()
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        
            ZStack(alignment: .bottom){
                
                ZStack(alignment: .top){
                    
                    VStack{
                        Text("StudentGo")
                            .font(.system(size: 35, weight: .heavy, design: .serif))
                            .italic()
                    }
                    
                    
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
                    
                    
                    MapActionButton(mapState : $mapState, viewModel: locationViewModel)
                        .padding(.top, 4)
                }
                .navigationBarBackButtonHidden(true)
                
                if mapState == .locationSelected {
                    RideRequestView(locationViewModel: locationViewModel)
                        .transition(.move(edge: .bottom))
                }
                
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .onReceive(LocationManager.shared.$userLocation) { location in
                
                if let location = location {
                    locationViewModel.userLocation = location
                }
          
        }
    }
}


#Preview {
    HomeView()
}


