//
//  LoginViewComponents.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-10.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .mask(RoundedRectangle(cornerRadius: 25))
            .padding(.top, 30)
            .padding(.horizontal, 40)
    }
}

struct GreetingTitleView: View {
    var body: some View {
        Text("Let's Connect With Us")
            .font(.title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(20)
    }
}

struct TextfieldView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 20) {
            InputView(placeholder: "Enter your email", text: $email)
            InputView(placeholder: "Enter your password", isSecure: true, text: $password)
        }
    }
}

struct ForgotView: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Text("Forgot Password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
        .padding(10)
        .padding(.horizontal, 10)
    }
}

struct LoginButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text("Login")
                .font(.headline)
        }
        .buttonStyle(CapsuleButtonStyle())
    }
}

struct LoginWithApple: View {
    var body: some View {
        Button {
            
        } label: {
            Label("Sign in with Apple", systemImage: "apple.logo")
                .imageScale(.large)
                .font(.headline)
        }.buttonStyle(CapsuleButtonStyle(bgColor: .black))
            .padding(.top, 5)
    }
}

struct LoginWithGoogle: View {
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image("google")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 25, height: 25)
                Text("Sign in with Google")
                    .font(.headline)
            }
        }.buttonStyle(CapsuleButtonStyle(bgColor: .white, labelColor: .primary, hasBorder: true))
            .padding(.top, -15)
            .padding(.bottom, 45)
    }
}

struct SignupButton: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationLink {
            CreateAccountView()
                .environmentObject(authViewModel)
        } label: {
            HStack {
                Text("Don't have an account?")
                    .foregroundStyle(.black)
                Text("Sign Up")
                    .foregroundStyle(.teal)
                    .fontWeight(.bold)
            }
        }
    }
}

