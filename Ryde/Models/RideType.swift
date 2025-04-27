//
//  RideType.swift
//  Ryde
//
//  Created by baxtiyor bekmurodov on 26/04/25.
//

import Foundation
import SwiftUI
import SwiftData

enum RideType : Int, CaseIterable, Identifiable{
    case start
    case comfort
    case business
    
    
    var id : Int {return rawValue}
    
    
    var description : String {
        switch self {
        case .start: return "Start"
        case .comfort: return "Comfort"
        case .business: return "Business"
        }
    }
    
    
    var imageName : String {
        switch self {
        case .start: return "studentgo-start"
        case .comfort: return "studentgo-comfort"
        case .business: return "studentgo-start"
        }
    }
    
    
    var baseFare : Double {
        switch self {
        case .start: return 5
        case .comfort: return 10
        case .business: return 20
        }
    }
    
    
    func computePrice(for distanceInMeters: Double) -> Double{
        
        let distanceInKm = distanceInMeters / 1600
        
        
        switch self {
        case .start: return distanceInKm * 1.5 + baseFare
        case .comfort: return distanceInKm * 1.75 + baseFare
        case .business: return distanceInKm * 2.0 + baseFare
        }
    }
}
