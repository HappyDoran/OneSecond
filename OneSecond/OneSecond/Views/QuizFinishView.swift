//
//  QuizFinishView.swift
//  OneSecond
//
//  Created by Doran on 6/19/24.
//

import SwiftUI

struct QuizFinishView: View {
    var body: some View {
        Text("퀴즈가 끝났습니다!")
        
        Button(action:{
            NavigationManager.shared.pop(to: .selectYear)
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 40).frame(width: 200,height: 50).foregroundColor(Color(hex: "#000000")).shadow(color: .gray, radius: 1, x: 0, y: 3)
                Text("홈 화면으로 이동").font(.system(size: 18, weight: .bold)).foregroundColor(.white)
            }
        }
    }
}

#Preview {
    QuizFinishView()
}
