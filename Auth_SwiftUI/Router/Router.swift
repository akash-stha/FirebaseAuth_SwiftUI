//
//  Router.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-16.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    enum AuthFlow: Hashable, Codable {
        case login
        case createAccount
        case profile
        case forgotPassword
        case emailSent
    }
    
    func navigate(to path: AuthFlow) {
        navPath.append(path)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count - 1)
    }
    
}
