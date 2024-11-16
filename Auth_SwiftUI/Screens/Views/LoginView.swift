//
//  LoginView.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-09.
//

import SwiftUI

struct LoginView: View {
    
    @State var getEmail: String = ""
    @State var getPassword: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // MARK: Grettings and Icon
                    LogoView()
                    
                    // MARK: Title
                    GreetingTitleView() // test changes
                    
                    // MARK: TextFields
                    TextfieldView(email: $getEmail, password: $getPassword)
                    
                    // MARK: Forgot Button
                    ForgotView()
                    
                    // MARK: Login Button
                    LoginButton() {
                        Task {
                            await authViewModel.login(email: getEmail, password: getPassword)
                        }
                    }
                    
                    // MARK: Divider
                    DividerView()
                    
                    // MARK: Apple Login
                    LoginWithApple()
                    
                    // MARK: Google Login
                    LoginWithGoogle()
                    
                    // MARK: Footer
                    SignupButton()
                }
            }
            .alert("Something went wrong!!!", isPresented: $authViewModel.isError) {}
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
