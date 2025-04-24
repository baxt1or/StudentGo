
import SwiftUI
import SwiftData

@main
struct RydeApp: App {
    
//    @StateObject var locationViewModel =  LocationSearchViewModel()
    
 
    var body: some Scene {
        WindowGroup {
            HomeView()
//                .environmentObject(locationViewModel)
        }
    }
}
