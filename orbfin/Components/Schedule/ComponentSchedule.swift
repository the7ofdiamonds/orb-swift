//
//  ComponentSchedule.swift
//  orbfin
//
//  Created by Jamel Lyons on 8/29/24.
//

import SwiftUI

struct ComponentSchedule: View {
    @EnvironmentObject var vm: ViewModelSchedule

    @State private var selectedDate: Date = Date()
    @State private var selectedTime: Date = Date()
    
    private var formattedDate: String {
        return Format.dateFormatter.string(from: selectedDate)
    }
    
    private var formattedTime: String {
        return Format.timeFormatter.string(from: selectedTime)
    }
    
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        ComponentCardFixed {
            VStack {
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                .frame(width: 300)
                .onChange(of: selectedDate) {
                    vm.setDate(formattedDate)
                }
                
                DatePicker(
                    "Select Time",
                    selection: $selectedTime,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                .onChange(of: selectedTime) {
                    vm.setTime(formattedTime)
                }
            }
        }
        
        ComponentCardFixed {
            VStack {
                Text("Selected Date: \(formattedDate)")
                    .padding()
                
                Text("Selected Time: \(formattedTime)")
                    .padding()
                
                Button(action: {
                    action()
                    vm.setSchedule(date: formattedDate, time: formattedTime)
                }, label: {
                    Text("Request")
                })
                .fontWeight(.bold)
                .kerning(Styling.kerning)
                .padding()
                .background(Styling.color(.Button))
                .foregroundColor(Styling.color(.ButtonFont))
                .cornerRadius(Styling.cornerRadius)
                .shadow(color: Styling.shadow.color, radius: Styling.shadow.radius, x: Styling.shadow.x, y: Styling.shadow.y)
                
            }
        }
        .onAppear(){
            vm.setSchedule(date: formattedDate, time: formattedTime)
        }
    }
}

#Preview {
    ComponentSchedule {
        print("Scheduled")
    }
}
