//
//  AlertContext.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 09/02/2022.
//

import Foundation
import SwiftUI

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid device input", message: CameraError.invalidDeviceInput.rawValue, buttonType: .default(Text("OK")))
    static let invalidScannedType = AlertItem(title: "Invalid scanned input", message: CameraError.invalidScannerValue.rawValue, buttonType: .default(Text("OK")))
}
