//
//  Users.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-10.
//

import SwiftUI

struct User: Codable {
    let uid: String
    let email: String
    let fullName: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

