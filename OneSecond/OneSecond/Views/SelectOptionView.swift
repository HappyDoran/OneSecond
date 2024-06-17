//
//  SelectOptionView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct SelectOptionView: View {
    @Binding var isHidden: Bool
    var body: some View {
        VStack(alignment: .leading){
            Text("몇 문제 도전하시겠어요?").font(.system(size: 24,weight: .semibold))
                .padding(.top,30)
            HStack{
                ZStack{
                    Button(action:{}){
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("10문제").font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: "#0A84FF"))
                }
                ZStack{
                    Button(action:{}){
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("20문제").font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: "#0A84FF"))
                }
                ZStack{
                    Button(action:{}){
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("30문제").font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: "#0A84FF"))
                }
            }.padding(.top, 10)
            
            Text("몇 초만 들으시겠어요?").font(.system(size: 24,weight: .semibold))
                .padding(.top,30)
            HStack{
                ZStack{
                    Button(action:{}){
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("1초").font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: "#0A84FF"))
                }
                ZStack{
                    Button(action:{}){
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("3초").font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: "#0A84FF"))
                }
                ZStack{
                    Button(action:{}){
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("5초").font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: "#0A84FF"))
                }
                ZStack{
                    Button(action:{}){
                        RoundedRectangle(cornerRadius: 40.0)
                            .frame(width: 85, height: 50)
                            .foregroundColor(Color(hex: "#0A84FF").opacity(0.15))
                    }
                    Text("전부").font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: "#0A84FF"))
                }
            }.padding(.top, 10)
            
        }
        Button(action:{}){
            ZStack{
                RoundedRectangle(cornerRadius: 13.0)
                    .frame(width: 340, height: 60)
                    .foregroundColor(Color(hex: "#0A84FF"))
                
                Text("퀴즈 시작!").font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: "#FFFFFF"))
            }
        }
        .padding(.top,30)
    }
}

#Preview {
    SelectOptionView(isHidden: .constant(false))
}
