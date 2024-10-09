//
//  ContentView.swift
//  SimplyLesson6
//
//  Created by Suren Kazaryan on 07.10.24.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users.indices, id: \.self) { index in
                        let user = viewModel.users[index]
                        NavigationLink(destination: UserProfileView(user: user)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(user.fullName)
                                        .font(.headline)
                                        .foregroundStyle(Color(.black))
                                    Text("\(user.location.city), \(user.location.country)")
                                        .font(.subheadline)
                                        .foregroundStyle(Color(.gray))
                                }
                                Spacer()
                                Image(systemName: "arrowtriangle.forward.fill")
                                    .foregroundStyle(Color(.black))
                            }
                            .padding()
                            .background(.green)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                        }
                        .padding(.horizontal)
                        .onAppear {
                            if index == viewModel.users.count - 1 {
                                viewModel.fetchUsers()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UserListView()
}
