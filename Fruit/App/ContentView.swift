//
//  ContentView.swift
//  Fruit
//
//  Created by Ted Butler on 2/24/22.
//

import SwiftUI
import UserNotifications
import EventKit


struct ContentView: View {
    // MARK: - PROPERTIES
    var fruits:[Fruit] = fruitData
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var isShowingSettings:Bool = false
    
    
    // MARK: - FUNCTIONS
    func insertEvent(store: EKEventStore) {
        let calendars = store.calendars(for: .event)
        for calendar in calendars {
            if calendar.title == "Calendar" {
                let startDate = Date()
                let endDate = startDate.addingTimeInterval(10)
                let event = EKEvent(eventStore: store)
                let alarm = EKAlarm(relativeOffset: 0)
                
                event.calendar = calendar
                event.title = "Drink Medicine fool!"
                event.startDate = startDate.addingTimeInterval(10)
                event.endDate = endDate
                event.url = URL(string: "fruitapp://?v=10101")
                event.alarms = [alarm]
                
                do {
                    try store.save(event, span: .thisEvent)
                }
                catch {
                    print("Error saving event in calendar")
                }
            }
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                Button {
                    let eventStore = EKEventStore()
                    eventStore.requestAccess(to: .event, completion: { (granted: Bool, error: Error?) -> Void in
                        if granted {
                            self.insertEvent(store: eventStore)
                        } else {
                            print("Access denied")
                        }
                    })
                } label: {
                    Text("Adding Calendar Event")
                }
                
                Button {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            let center = UNUserNotificationCenter.current()
                            center.delegate = appDelegate
                            
                            let content = UNMutableNotificationContent()
                            
                            content.title = "Drink Medicine fool!"
                            content.body = "Something to drink on schedule."
                            content.categoryIdentifier = "alarm"
                            content.userInfo = ["customData": "fizzbuzz"]
                            content.sound = UNNotificationSound.default
                            
                            let show = UNNotificationAction(identifier: "show", title: "+10mins", options: .foreground)
                            let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])

                            center.setNotificationCategories([category])
                            
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            center.add(request)
                            
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Schedule Notification")
                }
                
                
                ForEach(fruits.shuffled()){ fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)){
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                    
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    }) //: BUTTON
                    .sheet(isPresented: $isShowingSettings){
                        SettingsView()
                    }
            )
        } //: NAVIGATION
        
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitData)
    }
}

