//
//  AppDelegate.swift
//  testpushNotification
//
//  Created by Mohamed Ali on 28/02/2024.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        configureNotifications()
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func configureNotifications() {
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, _ in
            guard success else { return }
            
            print("Success in APNS registery")
        }
    }
}


extension AppDelegate: MessagingDelegate, UNUserNotificationCenterDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, error in
            if let error = error {
                print("Fetch Error: \(error.localizedDescription)")
            }
            else {
                guard let token = token else { return }
                
                print("RegiserToken: \(token)")
            }
        }
    }
}
