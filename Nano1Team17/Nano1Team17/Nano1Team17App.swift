//
//  Nano1Team17App.swift
//  Nano1Team17
//
//  Created by Elvis Susanto on 20/03/23.
//

import SwiftUI

@main
struct Nano1Team17App: App {
    var body: some Scene {
        WindowGroup {
            LandingView().environmentObject(ContentViewModel())
        }
    }
}
