//
//  ContentView.swift
//  HTKApp Watch App
//
//  Created by Khiem Huynh on 24/8/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("My todoist").font(.headline)
            
            List {
                HStack {
                    Button(action: {print("click")}) {
                        CheckBoxView(isChecked: false)
                    }
                    Text("Cafe")
                }
                
                Text("Podcasts")
                Text("Running")
                Text("Reading")
                
                HStack {
                    Button(action: {print("click")}) {
                        CheckBoxView(isChecked: true)
                    }
                    Text("Coding")
                }
            }.listStyle(.elliptical)
        }
    }
}
