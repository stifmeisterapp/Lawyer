//
//  SceneDelegate+MessagingDelegates.swift
//  Lawyer
//
//  Created by Aman Kumar on 05/09/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import Firebase
import UserNotifications



//MARK: - Extension for get FCM TOKEN
extension SceneDelegate:MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        USER_DEFAULTS.set(fcmToken, forKey: ConstantTexts.deviceToken)
    }
}


//MARK: - Extension for get Device token
extension SceneDelegate:UNUserNotificationCenterDelegate{

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("in did recieve")
        /*  if let userInfo = response.notification.request.content.userInfo as? NSDictionary{
         print(userInfo)
         } */
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("in will present")
        completionHandler([.alert, .badge, .sound])
        /*  if let userInfo = notification.request.content.userInfo as? NSDictionary{
         print(userInfo)
         } */
        
    }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
}



