//
//  InputView.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-09.
//

import SwiftUI

struct InputView: View {
    
    let placeholder: String
    var isSecure: Bool = false
    @Binding var text: String
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .textInputAutocapitalization(.never)
                .background(Color.gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black.opacity(0.3), lineWidth: 2)
                )
                .padding(.horizontal, 20)
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .textInputAutocapitalization(.never)
                .background(Color.gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black.opacity(0.3), lineWidth: 2)
                )
                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    InputView(placeholder: "Enter your email", text: .constant(""))
}
