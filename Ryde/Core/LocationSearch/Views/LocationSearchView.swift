import SwiftUI

struct LocationSearchView : View {
    
    @State private var startLocationText = ""
    @Binding var mapState : MapViewState
    @ObservedObject  var viewModel : LocationSearchViewModel
    
    var body : some View {
        
        VStack{
//            Header
            
            HStack(spacing: 12){
                
                VStack(spacing:16){
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 2, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                        .cornerRadius(2)
                }
                
                
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .padding(4)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                        .cornerRadius(5)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .padding(4)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                        .cornerRadius(5)
                }
                
            }
            .padding(.horizontal, 12)
            .padding(.top, 64)
            
            Divider()
            
        
            
//            List Views
            
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(viewModel.results, id : \.self) { result in
                        
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
            .padding(.horizontal, 12)
        }
        .background(.white)
    }
}




