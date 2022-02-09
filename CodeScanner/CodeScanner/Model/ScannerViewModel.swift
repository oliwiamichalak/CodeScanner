//
//  ScannerViewModel.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 09/02/2022.
//

import SwiftUI

final class CodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?

    var statusText: String {
        scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }

    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
