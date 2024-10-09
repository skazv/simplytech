//
//  UserProfileView.swift
//  SimplyLesson6
//
//  Created by Suren Kazaryan on 07.10.24.
//

import SwiftUI

struct UserProfileView: View {
    var user: UserModel
    @State var isAnimate = false
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user.picture.large)) { image in
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 200, height: 200)
                               .clipShape(Circle())
                       } placeholder: {
                           ProgressView()
                       }
                       .opacity(isAnimate ? 1 : 0)
                       .animation(.easeInOut(duration: 1.5), value: isAnimate)
            Text(user.fullName)
                .font(.largeTitle)
                .bold()
            Text("Location: \(user.location.city), \(user.location.country)")
                .font(.title3)
            
            Text("Email: \(user.email)")
                .font(.body)
            Spacer()
        }
        .font(.body)
        .opacity(isAnimate ? 1 : 0)
        .offset(y: isAnimate ? 0 : -250)
        .animation(.easeInOut(duration: 0.5), value: isAnimate)
        .padding()
        .navigationTitle("Profile")
        .onAppear() {
            isAnimate = true
        }
    }
}

#Preview {
    UserProfileView(user: UserModel(name: UserModel.Name(first: "Suren", last: "Kazaryan"), location: UserModel.Location(city: "Yerevan", country: "Armenia"), email: "s@mail.ru", picture: UserModel.Picture(large: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlx3pWh8dCHIvT8iCKUnZqJOcUOdZ2vs63Og&s", medium: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlx3pWh8dCHIvT8iCKUnZqJOcUOdZ2vs63Og&s", thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlx3pWh8dCHIvT8iCKUnZqJOcUOdZ2vs63Og&s")))
}
