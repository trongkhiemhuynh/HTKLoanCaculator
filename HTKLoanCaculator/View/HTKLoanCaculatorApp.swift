//
//  HTKLoanCaculatorApp.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI
import MyLibrary

@main
struct HTKAppView: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        return WindowGroup {
            TabView {
                GithubView().tabItem {
                    Label {
                        Text("Git")
                    } icon: {
                        Image(systemName: "cloud.drizzle.fill")
                    }
                }
                
                HTKCalView().tabItem {
                    Label {
                        Text("Cal")
                    } icon: {
                        Image(systemName: "cart.fill")
                    }

                }
                
                RunView().tabItem {
                    Label {
                        Text("Run")
                    } icon: {
                        Image(systemName: "sunrise.fill")
                    }
                }
                
                MemoryView().tabItem {
                    Label {
                        Text("Memory")
                    } icon: {
                        Image(systemName: "pencil.circle.fill")
                    }
                }
                
                SettingsView().tabItem {
                    Label {
                        Text("Setting")
                    } icon: {
                        Image(systemName: "cube.fill")
                    }
                }
            }
//            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
