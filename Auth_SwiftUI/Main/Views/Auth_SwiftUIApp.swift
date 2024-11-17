//
//  Auth_SwiftUIApp.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-09.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Auth_SwiftUIApp: App {
    // Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authViewModel = AuthViewModel()
    @ObservedObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                    .navigationDestination(for: Router.AuthFlow.self) { destination in
                        switch destination {
                        case .login: LoginView()
                        case .createAccount: CreateAccountView()
                        case .profile: ProfileView()
                        case .forgotPassword: ForgotPasswordView(getEmail: "")
                        case .emailSent: EmailSentView()
                        }
                    }
            }
            .environmentObject(authViewModel)
            .environmentObject(router)
            .preferredColorScheme(.light)
        }
    }
}
