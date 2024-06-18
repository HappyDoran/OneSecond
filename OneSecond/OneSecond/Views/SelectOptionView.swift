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
            Text("몇 문제 도전하시겠어요?").font(.system(size: 24, weight: .semibold))
                .padding(.top, 30)
            HStack {
                ForEach(0..<3) { index in
                    ZStack {
                        Button(action: {
                            questionCount = (index + 1) * 10
                        }) {
                            RoundedRectangle(cornerRadius: 40.0)
                                .frame(width: 85, height: 50)
                                .foregroundColor(questionCount == (index + 1) * 10 ? Color(hex: "#0A84FF") : Color(hex: "#0A84FF").opacity(0.15))
                        }
                        Text("\((index + 1) * 10)문제")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(questionCount == (index + 1) * 10 ? Color(hex: "#FFFFFF") : Color(hex: "#0A84FF"))
                    }
                }
            }.padding(.top, 10)
            
            Text("몇 초만 들으시겠어요?").font(.system(size: 24, weight: .semibold))
                .padding(.top, 30)
            HStack {
                ForEach(0..<3) { index in
                    ZStack {
                        Button(action: {
                            playTime = index + 1
                        }) {
                            RoundedRectangle(cornerRadius: 40.0)
                                .frame(width: 85, height: 50)
                                .foregroundColor(playTime == index + 1 ? Color(hex: "#0A84FF") : Color(hex: "#0A84FF").opacity(0.15))
                        }
                        Text("\(index + 1)초")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(playTime == index + 1 ? Color(hex: "#FFFFFF") : Color(hex: "#0A84FF"))
                    }
                }
                ZStack {
                    Button(action: {
                        playTime = 0
                    }) {
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(playTime == 0 ? Color(hex: "#0A84FF") : Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("전부")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(playTime == 0 ? Color(hex: "#FFFFFF") : Color(hex: "#0A84FF"))
                }
            }.padding(.top, 10)
        }
        Button(action: {
            if let questionCount = questionCount, let playTime = playTime {
                NavigationManager.shared.push(to: .quizReady(selectYear: yeardata.year, questionCount: questionCount, playTime: playTime))
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 13.0)
                    .frame(width: 340, height: 60)
                    .foregroundColor(questionCount != nil && playTime != nil ? Color(hex: "#0A84FF") : Color.gray)
                
                Text("퀴즈 시작!")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: "#FFFFFF"))
            }
        }
        .disabled(questionCount == nil || playTime == nil)
        .padding(.top, 30)
    }
}

#Preview {
    SelectOptionView(isHidden: .constant(false), yeardata: YearModel(year: 2001, imageSource: "PlayList_Thumbnail_2023"))
}
