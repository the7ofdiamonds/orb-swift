//
//  Navigation.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/12/24.
//

import SwiftUI

@MainActor
class Navigation: ObservableObject {
    public static let instance = Navigation()
   
    private init(){}
    
    @Published var isView: String = "Login"
    
    func change(view: String) {
        self.isView = view
        print(view)
    }
}
