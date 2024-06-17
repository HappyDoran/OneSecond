//
//  ContentView.swift
//  OneSecond
//
//  Created by Doran on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!").font(.custom(Pretendard.bold.rawValue, size: 24))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
