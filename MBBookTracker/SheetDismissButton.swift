//
//  SheetDismissButton.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI


enum SheetDismissLabel: String {
    case dismiss, cancel, done, xmark
}

/// Calls `dismiss` on the current environment, meant to dismiss sheets.
struct SheetDismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    var label: SheetDismissLabel

    /// optional additional action step
    var action: (() -> Void)?

    var body: some View {
        Button(role: .cancel) {
            dismiss.callAsFunction()
            if let action {
                action()
            }
        } label: {
            buttonLabel()
        }
        .disabled(!presentationMode.wrappedValue.isPresented)
    }

    @ViewBuilder func buttonLabel() -> some View {
        switch label {
        case .xmark:
            Image(systemName: "xmark")
        case .dismiss, .cancel, .done:
            Text(label.rawValue.capitalized)
        }
    }
}

struct SheetDismissButton_Previews: PreviewProvider {

    static var previews: some View {
        List {
            SheetDismissButton(label: .done)
            SheetDismissButton(label: .cancel) {
                print("cancel called")
            }
        }
    }
}
