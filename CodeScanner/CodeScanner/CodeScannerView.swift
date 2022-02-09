//
//  CodeScannerView.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 08/02/2022.
//

import SwiftUI

struct CodeScannerView: View {

    @State private var scannedCode = ""

    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barecode", systemImage: "barcode.viewfinder")
                    .font(.title)

                Text(scannedCode.isEmpty ? "Not yet scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationBarTitle("Barecode Scanner")
        }
    }
}

struct CodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        CodeScannerView()
    }
}
