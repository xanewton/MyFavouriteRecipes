//
//  ViewModelWatch.swift
//  MyFavoriteRecipesWatch Extension
//
//  Created by newtan on 2021-02-13.
//

import Foundation
import WatchConnectivity

// Based on Article: https://medium.com/better-programming/get-started-with-watch-connectivity-with-swiftui-51722324b6f6
class ViewModelWatch : NSObject,  WCSessionDelegate, ObservableObject{
    
    var session: WCSession
    @Published var messageText = ""
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.messageText = message["message"] as? String ?? "Unknown"
        }
    }
    
}
