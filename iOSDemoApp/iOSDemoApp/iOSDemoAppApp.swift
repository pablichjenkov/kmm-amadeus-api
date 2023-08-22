//
//  iOSDemoAppApp.swift
//  iOSDemoApp
//
//  Created by Pablo Valdes on 7/31/23.
//

import SwiftUI
import AmadeusDemoKt

@main
struct iOSDemoAppApp: App {

    let iosBridge = BindingsKt.createPlatformBridge()
       
       init() {
       }
       
       var body: some Scene {
           WindowGroup {
               ZStack {
                   Color.white.ignoresSafeArea(.all) // status bar color
                   ContentView(iosBridge: iosBridge)
                       .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                           print("application_willEnterForeground")
                       }
                       .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                           print("application_didBecomeActive")
                           iosBridge.appLifecycleDispatcher.dispatchAppLifecycleEvent(
                               appLifecycleEvent: .start
                           )
                       }
                       .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                           print("application_willResignActive")
                       }.onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
                           print("application_didEnterBackground")
                           iosBridge.appLifecycleDispatcher.dispatchAppLifecycleEvent(
                               appLifecycleEvent: .stop
                           )
                       }
               }.preferredColorScheme(.light)
               
           }
       }

}
