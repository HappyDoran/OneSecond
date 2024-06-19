//
//  QuizView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject private var musicManager = MusicManager.shared
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        NavigationManager.shared.pop(to: .selectYear)
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .font(.system(size: 17))
                            .bold()
                            .foregroundStyle(.black)
                            .padding(.vertical, 11)
                    }
                    .frame(width: 44, height: 44)
                }
            }
            .onAppear{
                musicManager.getRandomTrack()
            }
    }
}

#Preview {
    QuizView()
}
