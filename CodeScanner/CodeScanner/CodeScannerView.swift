//
//  CodeScannerView.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 08/02/2022.
//

import SwiftUI

struct CodeScannerView: View {
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barecode", systemImage: "barcode.viewfinder")
                    .font(.title)

                Text("Not yet scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
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
