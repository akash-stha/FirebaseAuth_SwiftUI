//
//  CreateAccountComponents.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-10.
//

import SwiftUI

struct RequiredInformation: View {
    var body: some View {
        Text("Please complete all the information to creat an account.")
            .multilineTextAlignment(.center)
            .font(.headline)
            .fontWeight(.medium)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding(.top, 60)
            .padding(.bottom, 40)
    }
}

struct CreateAccountIF: View {
    @Binding var getEmail: String
    @Binding var getFullName: String
    @Binding var getPassword: String
    @Binding var getConfirmPassword: String
    
    var body: some View {
        VStack(spacing: 16) {
            InputView(placeholder: "Email or Phone Number", text: $getEmail)
                .keyboardType(.emailAddress)
            InputView(placeholder: "Full Name", text: $getFullName)
                .textInputAutocapitalization(.words)
            InputView(placeholder: "Password", isSecure: true, text: $getPassword)
                .textInputAutocapitalization(.never)
            
            ZStack(alignment: .trailing) {
                InputView(placeholder: "Confirm Password", isSecure: true, text: $getConfirmPassword)
                    .textInputAutocapitalization(.never)
                Spacer()
                if !getPassword.isEmpty && !getConfirmPassword.isEmpty {
                    let isValid = getPassword == getConfirmPassword
                    Image(systemName: "\(isValid ? "checkmark" : "xmark").circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(isValid ? .green : .red)
                        .padding(.trailing, 30)
                        .contentTransition(.symbolEffect)
                }
            }
            
        }
    }
}

struct CreateAccountButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Create Account")
                .font(.headline)
        }
        .buttonStyle(CapsuleButtonStyle())
    }
}
