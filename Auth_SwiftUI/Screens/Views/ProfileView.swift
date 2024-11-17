//
//  ProfileView.swift
//  Auth_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-13.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: Router

    var body: some View {
            if let currentUser = authViewModel.currentUser {
                List {
                    Section {
                        HStack {
                            Text(currentUser.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 70, height: 70)
                                .background(Color(.lightGray))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(currentUser.fullName)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser.email)
                                    .font(.footnote)
                            }
                            .padding(.leading, 8)
                        }
                    }
                    
                    Section {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            Label {
                                Text("Sign Out")
                                    .foregroundStyle(.blue)
                            } icon: {
                                Image(systemName: "arrow.left.circle.fill")
                                    .foregroundStyle(.blue)
                            }
                        }

                        Button {
                            Task {
                                await authViewModel.deleteAccount()
                            }
                        } label: {
                            Label {
                                Text("Delete Account")
                                    .foregroundStyle(.red)
                            } icon: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.red)
                            }
                        }

                    }
                }
            } else {
                ProgressView("Please wait...")
            }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
