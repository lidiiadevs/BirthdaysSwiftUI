//
//  ContentView.swift
//  Birthdays
//
//  Created by Lidiia Diachkovskaia on 5/6/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend] //to fetch Friend instances stored in SwiftData
    @Environment(\.modelContext) private var context //provides a connection between the view and the model container so that  we can fetch, insert and delete items in the container - memory managment
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        VStack {
            NavigationStack {
                List(friends) { friend in  //for id we're using names-we can't have exact the same names
                    HStack {
                        if friend.isBirthdayToday  {
                            Image(systemName: "birthday.cake.fill")
                        }
                        Text(friend.name)
                            .bold(friend.isBirthdayToday)
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
                            context.insert(newFriend)
                            newName = ""
                            newDate = Date.now
                        }
                        .bold()
                    }
                    .padding()
                    .background(.bar)
                }
//                .task {
//                    context.insert(Friend(name: "Mike", birthday: .now))
//                    context.insert(Friend(name: "Jennie", birthday: Date(timeIntervalSince1970: 0)))
//                    context.insert(Friend(name: "Mai", birthday: Date(timeIntervalSince1970: 1000000000)))
//                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true) //storage mechanism - the same initial state every time they refresh
}
