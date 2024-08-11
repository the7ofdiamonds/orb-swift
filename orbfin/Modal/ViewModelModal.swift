//
//  ViewModelModal.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/8/24.
//

import Foundation

@MainActor
class ViewModelModal: ObservableObject {
    @Published var show = true
    @Published var showModal = true

    func isVisible() -> Bool {
        return self.show
    }
    
    func toggle() {
        self.show.toggle()
    }
}
