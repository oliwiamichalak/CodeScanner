//
//  AlertItem.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 09/02/2022.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let buttonType: Alert.Button
}
