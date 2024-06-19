//
//  SelectOptionView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct SelectOptionView: View {
    @Binding var isHidden: Bool
    var yeardata: YearModel
    
    @State var questionCount: Int? = nil
    @State var playTime: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("몇 문제 도전하시겠어요?").font(.system(size: 22, weight: .semibold))
                .padding(.top, 20)
                .padding(.leading,8)

            HStack {
                ForEach(0..<3) { index in
                    ZStack {
                        Button(action: {
                            questionCount = (index + 1) * 10
                        }) {
                            RoundedRectangle(cornerRadius: 40.0)
                                .shadow(color: .gray, radius: 1, x: 0, y: 3)
                                .frame(width: 85, height: 50)
                                .foregroundColor(questionCount == (index + 1) * 10 ? Color(hex: "#000000") : Color(hex: "#000000").opacity(0.15))
                        }
                        Text("\((index + 1) * 10)문제")
                        
                            .font(.system(size: 18, weight: .regular))
                            .fontWeight(questionCount == (index + 1) * 10 ? .bold : .regular)
                            .foregroundColor(questionCount == (index + 1) * 10 ? Color(hex: "#FFFFFF") : Color(hex: "#000000"))
                    }
                }
            }.padding(.top, 4)
            
            Text("몇 초만 들으시겠어요?").font(.system(size: 22, weight: .semibold))
                .padding(.top, 5)
                .padding(.leading,8)

            HStack {
                ForEach(0..<3) { index in
                    ZStack {
                        Button(action: {
                            playTime = index + 1
                        }) {
                            RoundedRectangle(cornerRadius: 40.0)
                                .shadow(color: .gray, radius: 1, x: 0, y: 3)
                                .frame(width: 85, height: 50)
                                .foregroundColor(playTime == index + 1 ? Color(hex: "#00000") : Color(hex: "#000000").opacity(0.15))
                        }
                        Text("\(index + 1)초")
                            .font(.system(size: 18, weight: .regular))
                            .fontWeight(playTime == index + 1 ? .bold : .regular)
                            .foregroundColor(playTime == index + 1 ? Color(hex: "#FFFFFF") : Color(hex: "#000000"))
                    }
                }
                ZStack {
                    Button(action: {
                        playTime = 0
                    }) {
                        RoundedRectangle(cornerRadius: 40.0)
                            .shadow(color: .gray, radius: 1, x: 0, y: 3)

                            .frame(width: 85, height: 50)
                            .foregroundColor(playTime == 0 ? Color(hex: "#000000") : Color(hex: "#000000").opacity(0.15))
                    }
                    Text("전부")
                        .font(.system(size: 18, weight: .regular))
                        .fontWeight(playTime == 0 ? .bold : .regular)
                        .foregroundColor(playTime == 0 ? Color(hex: "#FFFFFF") : Color(hex: "#000000"))
                }
            }.padding(.top, 4)
        }
        Button(action: {
            if let questionCount = questionCount, let playTime = playTime {
                NavigationManager.shared.push(to: .quizReady(selectYear: yeardata.year, questionCount: questionCount, playTime: playTime))
            }
        }) {
            VStack {
//                RoundedRectangle(cornerRadius: 13.0)
//                    .frame(width: 350, height: 60)
//                    .foregroundColor(questionCount != nil && playTime != nil ? Color(hex: "#000000") : Color(hex: "#000000").opacity(0.15))
//                
//                Spacer()
                Text("시작하기")
                    .foregroundColor(questionCount != nil && playTime != nil ? Color(hex: "#FFFFFF") : Color(hex: "#000000"))
                    .font(.system(size: 24))
                    .bold()
                    .tint(.white)
                
                
            }.frame(width: 300, height: 50)

            .background(questionCount != nil && playTime != nil ? Color(hex: "000000") : Color(hex:"#000000").opacity(0.15))
            

        }
        .clipShape(RoundedRectangle(cornerRadius: 40))

        .disabled(questionCount == nil || playTime == nil)
        .padding(.top, 20)
    }
}

#Preview {
    SelectOptionView(isHidden: .constant(false), yeardata: YearModel(year: 2001, imageSource: "PlayList_Thumbnail_2023"))
}
