//
//  ViewModelServices.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/11/24.
//

import Foundation

@MainActor
class ViewModelServices: ObservableObject {
    @Published var services: [Service]?
}
