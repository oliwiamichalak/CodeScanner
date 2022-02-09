//
//  CodeScannerView.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 08/02/2022.
//

import SwiftUI

struct CodeScannerView: View {

    @StateObject var viewModel = CodeScannerViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barecode", systemImage: "barcode.viewfinder")
                    .font(.title)

                StatusTextView(title: viewModel.statusText, color: viewModel.statusTextColor)
            }
            .navigationBarTitle("Barecode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: Text(alertItem.title),
                    message: Text(alertItem.message),
                    dismissButton: alertItem.buttonType
                )
            }
        }
    }
}

struct CodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        CodeScannerView()
    }
}
