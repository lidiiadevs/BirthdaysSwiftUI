//
//  ContentView.swift
//  Birthdays
//
//  Created by Lidiia Diachkovskaia on 5/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Mia", birthday: .now),
        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
//        Friend(name: "Mia", birthday: .now),
//        Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)),
        //0 secs since 1970 - Unix epoch - one of those referenced dates
        ]
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        VStack {
            NavigationStack {
                List(friends, id: \.name) { friend in  //for id we're using names-we can't have exact the same names
                    HStack {
                        Text(friend.name)
                        Spacer()
                        Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    }
                }
                .navigationTitle("Birthdays")
                .safeAreaInset(edge: .bottom) { //anchors any side
                    VStack(alignment: .center, spacing: 20){
                        Text("New Birthday")
                            .font(.headline)
                        DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                            TextField("Name", text: $newName)
                                .textFieldStyle(.roundedBorder)
                        }
                        Button("Save") {
                            let newFriend = Friend(name: newName, birthday: newDate)
                            friends.append(newFriend)
                            newName = ""
                            newDate = Date.now
                        .bold()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
