//
//  AccountView.swift
//  Ryde
//
//  Created by baxtiyor bekmurodov on 25/04/25.
//

import SwiftUI

struct AccountView : View {
    
    var body: some View {
        
        ZStack{
            Color(hex: "F6F8FA")
            
//            Header
            
            VStack(spacing: 24){
                
                HStack{
                    
                 
                        Text("Hello")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.black)
                        Text("Baxtiyor")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.blue)
                    
                    
                    Spacer()
                }
                .padding(.horizontal, 18)
                
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                
                VStack(spacing:12){
                    VStack(alignment: .leading){
                        Text("First name")
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(.secondary)
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .cornerRadius(12)
                        
                            
                    }
                    .padding(.horizontal, 12)
                    
                    VStack(alignment: .leading){
                        Text("Last name")
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(.secondary)
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .cornerRadius(12)
                        
                            
                    }
                    .padding(.horizontal, 12)
                    
                    VStack(alignment: .leading){
                        Text("Email")
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(.secondary)
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .cornerRadius(12)
                        
                            
                    }
                    .padding(.horizontal, 12)
                    
                    VStack(alignment: .leading){
                        Text("Phone number")
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(.secondary)
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                            .cornerRadius(12)
                        
                            
                    }
                    .padding(.horizontal, 12)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 18)
                .background(.white)
                .cornerRadius(20)
                .padding(.horizontal, 16)
                
                
                HStack{
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.blue)
                       
                    
                    Text("Sign out")
                        .font(.system(size: 18, weight: .light))
                        .foregroundColor(Color.blue)
                }
                .padding(.trailing,250)
                    
            }
            
        
        }
        .ignoresSafeArea()
        
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (F6F8FA)
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0) // fallback to yellow if format is invalid
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}


#Preview {
    AccountView()
}
