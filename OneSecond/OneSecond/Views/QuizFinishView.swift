//
//  QuizFinishView.swift
//  OneSecond
//
//  Created by Doran on 6/19/24.
//

import SwiftUI

struct QuizFinishView: View {
    var body: some View {
        Spacer()
        Text("준비한 음악 퀴즈가\n끝났습니다.")
            .font(.system(size: 32, weight: .bold))
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .padding(.bottom,0.5)
        Text("다른 연도로도 도전해보세요!")
            .font(.system(size: 16, weight: .semibold))
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
        
        Spacer()
        
        Rectangle()
            .fill(Color(hex: "#FF0080").opacity(0.38))
            .cornerRadius(150)
            .shadow(color: Color.black.opacity(0.65), radius: 253, x: 4, y: 4)
            .blur(radius: 40)
            .frame(width: 264, height: 264)
            .background(
                Rectangle()
                    .fill(Color.black.opacity(0.25))
                    .blur(radius: 250)
            )
        
        Spacer()
 
            
        Button(action:{
            NavigationManager.shared.pop(to: .selectYear)
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 40).frame(width: 130,height: 50).foregroundColor(Color(hex: "#000000")).shadow(color: .gray, radius: 1, x: 0, y: 3)
                Text("홈 화면").font(.system(size: 18, weight: .bold)).foregroundColor(.white)
            }
        }.padding(.bottom,29)
    }
}

#Preview {
    QuizFinishView()
}
