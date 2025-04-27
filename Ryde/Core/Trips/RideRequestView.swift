//
//  RideRequestView.swift
//  Ryde
//
//  Created by baxtiyor bekmurodov on 24/04/25.
//





import SwiftUI

struct RideRequestView : View {
    
    @State private var selectRideType : RideType = .start
    @ObservedObject var locationViewModel : LocationSearchViewModel
    
    var body : some View {
        
        VStack{
            
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // Trip info Views
            
            HStack(spacing: 12){
                
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 8, height: 8)
                        .cornerRadius(2)
                }
                
                
                VStack(alignment: .leading, spacing: 24){
                    
                    HStack{
                        Text("Ahangrabo Residential Area, 26")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(locationViewModel.pickupTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    
                    HStack{
                        if let location = locationViewModel.selectedStudentGoLocation {
                            Text(location.title)
                                .font(.system(size: 16, weight: .bold))
                        }
                          
                        
                        Spacer()
                        
                        Text(locationViewModel.dropoffTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                   
                }
                .padding(.leading, 4)
            }
            .padding()
            
            Divider()
                .padding()
            
            
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Ride Selection View
            ScrollView(.horizontal) {
                HStack(spacing:12){
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading){
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading){
                                
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                  
                                
                                HStack(spacing:2){
                                    Text(locationViewModel.cumputeRidePrice(forType: type).toCurrency())
                                        .font(.system(size: 14, weight: .bold))
                                      
                                    
                                    Text("sum")
                                        .font(.system(size: 12, weight: .bold))
                                      
                                    
                                }
                            }
                            .padding()
                        }
                        .frame(width: 115, height: 140).foregroundColor(type == selectRideType ? .white : .black)
                        .background(Color(type == selectRideType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectRideType ? 1.2 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture{
                            withAnimation(.spring()){
                                selectRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            
            
            
            Divider()
                .padding()
            
            HStack{
                Text("Imanpay")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.gray)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding(.leading)
                
                Text("**** 8619")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
                
            }
            .frame(height: 60)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(12)
            .padding(.horizontal)
            
            
            Button {
                
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 23, height: 50)
                    .background(.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 12)
            
        }
        .padding(.bottom, 18)
        .background(.white)
        .cornerRadius(20)
    }
}

