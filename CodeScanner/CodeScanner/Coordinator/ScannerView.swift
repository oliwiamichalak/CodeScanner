//
//  ScannerView.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 09/02/2022.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?

    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }

    final class Coordinator: NSObject, ScannerViewControllerDelegate {
        private let scannerView: ScannerView

        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }

        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }

        func didErrorSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannerValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}
