//
//  ViewModal.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import SwiftUI

struct ViewModal<Content: View>: View {
    let modalView: Content

    var type: Status = .info
    var onDismiss: () -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    onDismiss()
                } label: {
                    HStack {
                        Text("Dismiss")
                        Image(systemName: "x.circle")
                    }
                }
            }
            .frame(maxWidth: Styling.sizeWidth(component: .card))
            
            modalView
        }
        .padding()
        .background(Styling.colorStatusBackground(type: type))
        .foregroundColor(Styling.colorStatusFont(type: type))
        .cornerRadius(Styling.cornerRadius)
        .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
        .frame(maxWidth: Styling.sizeWidth(component: .card), maxHeight: Styling.sizeHeight(component: .card))
        .fixedSize()
    }
}

struct ViewModal_Previews: PreviewProvider {
    static var previews: some View {    let sampleTransaction = Transaction(
        id: "1",
        type: "debit",
        amount: 28.34,
        date: "2023-09-28",
        currencyCode: "USD",
        description: "Dd Doordash Burgerkin",
        name: "Burger King",
        logo: "https://plaid-merchant-logos.plaid.com/doordash_1.png",
        location: TransactionLocation(
            address: "13425 Community Rd",
            city: "Poway",
            region: "CA",
            postal_code: "92064",
            country: "US",
            lat: 32.959068,
            lon: -117.037666,
            store_number: "1700"
        )
    )
        
        ViewModal(modalView: ViewManageTransactionDetails(transaction: sampleTransaction)) {
            print("Dismissed")
        }
    }
}
