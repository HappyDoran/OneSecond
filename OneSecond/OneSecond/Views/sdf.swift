//
//  sdf.swift
//  OneSecond
//
//  Created by cksdn2221 on 6/19/24.
//

import SwiftUI

struct sdf: View {
    var body: some View {
        VStack{
            Text("음악퀴즈가 준비됐어요!\n다 맞출 준비 되셨죠?😉")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size:24))
                .multilineTextAlignment(.center)
                .padding(.top,60)
            Spacer()
            Rectangle()
                .fill(Color(hex: "#FF0080").opacity(0.51))
                .cornerRadius(150)
                .shadow(color: Color.black.opacity(0.65), radius: 25, x: 4, y: 4)
                .blur(radius: 40)
                .frame(width: 264, height: 264)
                .background(
                    Rectangle()
                        .fill(Color.black.opacity(0.25))
                        .blur(radius: 250)
                )
            
            Spacer()
            Button(action: {
                NavigationManager.shared.push(to: .quiz)
            }){
                Text("시작하기")
                    .foregroundColor(Color(hex: "#FFFFFF"))
                    .font(.system(size: 24))
                    .bold()
                    .frame(width:300, height:50)
                    .background(
                        RoundedRectangle(cornerRadius:55)
                            .fill(Color(hex:"#000000")))
                
                
            }

                Spacer()
            }
            
    }
}
#Preview {
    sdf()
}
