//
//  AppDelegate.swift
//  Drink
//
//  Created by HelloDigital_iOS_Dev on 2022/06/15.
//

import UIKit
import NotificationCenter
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let userNotificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // delegate 설정
        UNUserNotificationCenter.current().delegate = self
        
        // 사용자 권한 허용
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        userNotificationCenter.requestAuthorization(options: authorizationOptions) { _, error in
            if let error = error {
                print("Error: notification authorization request: \(error.localizedDescription)")
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

// notificationCenter을 보내기 전에 어떤 handling을 해줄지 선언
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}

