//
//  CreateAccountView.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-10.
//

import SwiftUI

struct CreateAccountView: View {
    @State var getEmail: String = ""
    @State var getFullName: String = ""
    @State var getPassword: String = ""
    @State var getConfirmPassword: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            RequiredInformation()
            
            CreateAccountIF(getEmail: $getEmail, getFullName: $getFullName, getPassword: $getPassword, getConfirmPassword: $getConfirmPassword)

            Spacer()
        
            CreateAccountButton {
                Task {
                    await authViewModel.createAccount(
                        email: getEmail,
                        fullName: getFullName,
                        password: getPassword
                    )
                    
                    if !authViewModel.isError {
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        
                    }
                }
            }

        }
        .navigationTitle("Create your account")
        .toolbarRole(.editor)
    }
}

#Preview {
    CreateAccountView()
        .environmentObject(AuthViewModel())
}
