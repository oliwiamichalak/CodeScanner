//
//  CameraError.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 09/02/2022.
//

import Foundation

enum CameraError: String {
    case invalidDeviceInput = "Check your camera. We are unable to capture the input."
    case invalidScannerValue = "The scanned value is invalid. The app scans EAN-8 and EAN-13."
}
