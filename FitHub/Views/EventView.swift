//
//  EventView.swift
//  FHOffline
//
//  Created by Roberto on 12/8/21.
//

import SwiftUI

struct EventView: View {
    @ObservedObject var fitHubViewModel: FitHubViewModel
    @State var eventTitle: String = ""
    @State var eventDescription: String = ""
    
    func createEvent() {
        let newEvent = EventModel(
            title: eventTitle,
            description: eventDescription,
            eventCreator: fitHubViewModel.user.username
        )
        fitHubViewModel.createEvent(event: newEvent)
        fitHubViewModel.createEventView = false
    }
    
    var body: some View {
        ZStack {
            MainView.lightPurple.ignoresSafeArea()
            
            VStack {
                EventHeader(fitHubViewModel: fitHubViewModel)
                if (fitHubViewModel.createEventView) {
                    VStack {
                        TextField ("Event Title", text: $eventTitle)
                            .inputTextBoxStyle()
                        TextField ("Event Description", text: $eventDescription)
                            .inputTextBoxStyle()
                        Button(action: {fitHubViewModel.createEventView = false}, label: {
                            Text("Cancel").loginButtonStyle(color: .pink)
                        })
                        Button(action: createEvent, label: {
                            Text("Create Event").loginButtonStyle(color: .green)
                        })
                        
                    }.padding()
                }
                ScrollView {
                    ForEach(fitHubViewModel.eventList.reversed()) {event in
                        if (!fitHubViewModel.user.blockedEvents.contains(event.id!)){
                            withAnimation {
                                EventCardView(
                                    fitHubViewModel: fitHubViewModel,
                                    id: event.id,
                                    title: event.title,
                                    description: event.description,
                                    eventCreator: event.eventCreator)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct EventHeader: View {
    @ObservedObject var fitHubViewModel: FitHubViewModel
    //var testEvent =  EventModel(eventCreator: UserModel())

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            fithubLogo()
                .onTapGesture(perform: fitHubViewModel.getEvents)
                .onAppear(perform: fitHubViewModel.getEvents)
            
            HStack {
                Button(action: {
                        withAnimation{
                            fitHubViewModel.createEventView = !fitHubViewModel.createEventView
                        }
                    }
                ){
                    Text("Create Event")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(width: 100)
                
                Spacer()
                Menu(content: {
                    Button("My Events") {
                        fitHubViewModel.getUserEvents(user: fitHubViewModel.user)
                    }
                    Button("Favorite Events") {
                        fitHubViewModel.getFavoriteEvents()
                    }
                    Button("All Events") {
                        fitHubViewModel.getEvents()
                    }
                    Button("Sign Out"){
                        fitHubViewModel.loggedIn = false
                    }
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                })
                
            }
        }
        .frame(height: 50)
        .padding(.vertical)
    }
}

struct EventCardView: View {
    @ObservedObject var fitHubViewModel: FitHubViewModel
    var id: String?
    var title: String
    var description: String
    var eventCreator: String
    @State var viewDescription: Bool = false
    @State var frameSize: CGFloat = 100
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(height: frameSize)
            VStack (alignment: .leading){
                HStack {
                    VStack (alignment: .leading){
                        Text(title)
                            .font(.title)
                            .fontWeight(.medium)
                        Text("Posted by \(eventCreator)")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.vertical)
                    .padding(.leading,5)
                    
                    Spacer()
                    Image(systemName: "photo.on.rectangle.angled")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .padding()
                }
                if (viewDescription) {
                    HStack {
                        Text(description)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding(.leading,5)
                        Spacer()
                        if (!fitHubViewModel.user.favoriteEvents.contains(id!)){
                            if (fitHubViewModel.user.username == eventCreator){
                                Image(systemName: "trash.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.pink)
                                    .padding(.horizontal)
                                    .onTapGesture(perform: {fitHubViewModel.deleteEvent(eventID: id)})
                            } else {
                                Image(systemName: "x.square.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.pink)
                                    .padding(.horizontal)
                                    .onTapGesture(perform: {fitHubViewModel.blockEvent(eventID: id)})
                            }
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.pink)
                                .padding(.horizontal)
                                .onTapGesture(perform: {fitHubViewModel.favoriteEvent(eventID: id)})
                        }else {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.pink)
                                .padding(.horizontal)
                                .onTapGesture(perform: {fitHubViewModel.unfavoriteEvent(eventID: id)})
                        }

                    }
                    Spacer()
                }
            }
        }
        .onTapGesture {
            if(viewDescription) {
                frameSize = 100
                viewDescription = false
            } else {
                frameSize = 200
                viewDescription = true
            }
        }
        .padding(.horizontal)
        .padding(.top,1)
    }
}
