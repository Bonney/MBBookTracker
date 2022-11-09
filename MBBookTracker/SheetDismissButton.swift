//
//  SheetDismissButton.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI


enum SheetDismissLabel: String {
    case dismiss, cancel, done
}

struct SheetDismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    var label: SheetDismissLabel

    var body: some View {
        Button(role: .cancel) {
            dismiss.callAsFunction()
        } label: {
            Text(label.rawValue.capitalized)
        }
        .disabled(!presentationMode.wrappedValue.isPresented)
    }
}

struct SheetDismissButton_Previews: PreviewProvider {

    static var previews: some View {
        List {
            SheetDismissButton(label: .done)
        }
    }
}
