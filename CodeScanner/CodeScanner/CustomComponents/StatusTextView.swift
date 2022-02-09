//
//  StatusTextView.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 09/02/2022.
//

import SwiftUI

struct StatusTextView: View {
    let title: String
    let color: Color

    var body: some View {
        Text(title)
            .bold()
            .font(.largeTitle)
            .foregroundColor(color)
            .padding()
    }
}

struct StatusTextView_Previews: PreviewProvider {
    static var previews: some View {
        StatusTextView(title: "", color: .green)
    }
}
