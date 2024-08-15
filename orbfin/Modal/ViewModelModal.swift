//
//  ViewModelModal.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import Foundation

@MainActor
class ViewModelModal: ObservableObject {
    @Published var show: Bool = true
    @Published var showModal: Bool = true
}
