//
//  ForgotPasswordView.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-16.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var getEmail: String
    @State private var isEmailSent: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ResetPasswordInfo()
        ForgotPassowrdTF(email: $getEmail)
        SendLinkButton {
            Task {
                await authViewModel.resetPassword(by: getEmail)
                if !authViewModel.isError {
                    isEmailSent = true
                }
            }
        }
        .navigationDestination(isPresented: $isEmailSent) {
            EmailSentView()
        }
        .onAppear() {
            getEmail = ""
        }
        Spacer()
    }
}

#Preview {
    ForgotPasswordView(getEmail: "")
        .environmentObject(AuthViewModel())
}

struct ForgotPassowrdTF: View {
    @Binding var email: String
    
    var body: some View {
        InputView(placeholder: "Enter your email", text: $email)
            .keyboardType(.emailAddress)
    }
}

struct ResetPasswordInfo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reset Password")
                .font(.largeTitle)
            
            Text("Enter the mail associated with your account and we'll send you a link to reset your password.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 20)
        .toolbarRole(.editor)
    }
}

struct SendLinkButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text("Send Reset Link")
        }
        .buttonStyle(CapsuleButtonStyle())
        .padding(.top, 8)
    }
}
