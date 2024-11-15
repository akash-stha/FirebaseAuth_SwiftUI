//
//  Utilites.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-09.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    
    var bgColor: Color = .teal
    var labelColor: Color = .white
    var hasBorder: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .foregroundColor(labelColor)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .overlay {
                hasBorder ? Capsule().stroke(Color.gray.opacity(0.3), lineWidth: 1) : nil
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
    }
}

struct DividerView: View {
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3))
            
            Text("or")
                .padding(.horizontal, 8)
                .padding(.vertical, -12)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3))
        }
        .padding(.top, -10)
        .padding(.horizontal, 10)
    }
    
}

/*
 Firebase Auth
 FirebaseFirestore
 FirebaseStorage
 */
