//
//  ViewModelSchedule.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/29/24.
//

import Foundation

@MainActor
class ViewModelSchedule: ObservableObject {
    @Published var date: String?
    @Published var time: String?
    
    func setDate(_ date: String) {
        self.date = date
        print(date)
    }
    
    func setTime(_ time: String) {
        self.time = time
        print(time)
    }
    
    func setSchedule(date: String, time: String) {
        self.date = date
        self.time = time
        print("date: \(date), time: \(time)")
    }
}
