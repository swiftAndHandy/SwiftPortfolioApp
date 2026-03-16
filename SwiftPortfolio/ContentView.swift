//
//  ContentView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 16.03.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(.sampleData)
}
