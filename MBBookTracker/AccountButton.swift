//
//  AccountButton.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI

struct AccountButton: View {
    @State private var sheet: Bool = false

    var body: some View {
        Button {
            sheet.toggle()
        } label: {
            Image(systemName: "person.circle.fill")
        }
        .sheet(isPresented: $sheet) {
            AccountView()
        }
    }
}

struct AccountButton_Previews: PreviewProvider {
    static var previews: some View {
        AccountButton()
    }
}
