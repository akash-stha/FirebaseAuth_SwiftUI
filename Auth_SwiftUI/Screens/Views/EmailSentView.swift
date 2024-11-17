//
//  ForgotPasswordView.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-16.
//

import SwiftUI

struct EmailSentView: View {
    var body: some View {
        Spacer()
        
        Image(systemName: "envelope.circle.fill")
            .resizable()
            .frame(width: 80, height: 80)
            .foregroundStyle(.teal)
        
        Text("Check your email")
            .font(.largeTitle.bold())
        
        Text("We have sent you an email to reset your password.")
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
        
        Button {
            
        } label: {
            Text("Skip")
        }
        .buttonStyle(CapsuleButtonStyle())
        .padding(.top, 30)
        .toolbarRole(.editor)
        
        Spacer()
    }
}

#Preview {
    EmailSentView()
}
