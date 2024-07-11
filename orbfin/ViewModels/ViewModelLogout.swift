//
//  ViewModelLogout.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/11/24.
//

import SwiftUI

@MainActor
class ViewModelLogout: ObservableObject {
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    @Published var successfulLogout: Bool = false
    
    var locationManager: LocationManager

    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    func logout() {
        
        if let location = locationManager.location {
            Task {
                let authentication: Authentication = await StorageUserDefaults.instance.getAuthentication()
                
                if let accessToken = authentication.accessToken,
                   let refreshToken = authentication.refreshToken {
                    let requestLogout: RequestLogout = RequestLogout(accessToken: accessToken, refreshToken: refreshToken)
                    let logout: ResponseLogout = await Logout().user(requestLogout: requestLogout)
                    
                    await StorageUserDefaults.instance.delete("access_token")
                    await StorageUserDefaults.instance.delete("refresh_token")
                    
                    if authentication.accessToken == nil && authentication.refreshToken == nil {
                        if let successMessage = logout.successMessage {
                            self.successMessage = successMessage
                        }
                        
                        self.successfulLogout = true
                    }
                }
            }
        }
    }
}
