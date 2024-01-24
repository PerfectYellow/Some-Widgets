//
//  ContentView.swift
//  WidgetKitsTest
//
//  Created by Mohammad Afshar on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var submit: String = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            TextField("Submit", text: $submit)
                .onSubmit {
                    print("Ok")
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.blue, lineWidth: 2)
                }
            
            SecureField("Password", text: $password)
                        .onSubmit {
                            submit = "poool"
                        }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
