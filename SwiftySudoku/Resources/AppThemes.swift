//
//  AppThemes.swift
//  SwiftySudoku
//
//  Created by Alice Wheeler on 2024-08-13.
//

import SwiftUI

enum Theme: String, Codable {
    case SkyFrost
    case EmeraldOasis
    case SunsetGlow
    case OceanBreeze

    var gradient: LinearGradient {
        switch self {
        case .SkyFrost:
            return LinearGradient(
                gradient: Gradient(colors: [Color("SkyFrostTop"), Color("SkyFrostBottom")]),
                startPoint: .top,
                endPoint: .bottom
            )
        case .EmeraldOasis:
            return LinearGradient(
                gradient: Gradient(colors: [Color("EmeraldOasisTop"), Color("EmeraldOasisBottom")]),
                startPoint: .top,
                endPoint: .bottom
            )
        case .SunsetGlow:
            return LinearGradient(
                gradient: Gradient(colors: [Color("SunsetGlowTop"), Color("SunsetGlowBottom")]),
                startPoint: .top,
                endPoint: .bottom
            )
        case .OceanBreeze:
            return LinearGradient(
                gradient: Gradient(colors: [Color("OceanBreezeTop"), Color("OceanBreezeBottom")]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
}

