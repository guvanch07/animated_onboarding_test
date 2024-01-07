//
//  CardModels.swift
//  onboarding_test
//
//  Created by Guvanch Amanov on 5.01.24.
//

import Foundation
import SwiftUI

struct Card: Identifiable{
    var id = UUID().uuidString
    let cardColor: Color
    let actionText: String
    let description: String
    let asset: String
}
