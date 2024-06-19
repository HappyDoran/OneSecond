//
//  TestView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct TestView: View {
    
    @StateObject private var musicManager = MusicManager.shared
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color(hex: "787880"))
                    .opacity(0.16)
                    .frame(width: 345.0, height: 8.0)
                    .cornerRadius(4.0)
                Rectangle()
                    .foregroundColor(Color(hex: "FF0080"))
                    .frame(width: 200.0, height: 8.0)
                    .cornerRadius(4.0)
            }
            Spacer()
            Text("당신의 음악 감각을 보여주세요!").font(.system(size: 24, weight: .semibold))
            ZStack{
                RoundedRectangle(cornerRadius: 50).frame(width: 260,height: 260).foregroundColor(Color(hex: "#000000"))
                RoundedRectangle(cornerRadius: 50).frame(width: 260,height: 260).foregroundColor(Color(hex: "#D9D9D9"))
            }
            .padding(.top,20)
            Text("힌트2").padding(.top,30)
            Text("힌트3")
            
            Button(action:{}){
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 34, height: 34)
                    .foregroundColor(Color(hex: "#000000"))
                    
            }
            .padding(.top,20)
            
            Button(action:{}){
                ZStack{
                    RoundedRectangle(cornerRadius: 40).frame(width: 92,height: 38).foregroundColor(Color(hex: "#000000"))
                    Text("힌트").font(.system(size: 18, weight: .regular)).foregroundColor(.white)
                }
            }.padding(.top,10)
            
            Button(action:{}){
                ZStack{
                    RoundedRectangle(cornerRadius: 40).frame(width: 136,height: 49).foregroundColor(Color(hex: "#000000"))
                    Text("정답입력").font(.system(size: 18, weight: .regular)).foregroundColor(.white)
                }
            }
            .padding(.top,10)
            .padding(.bottom,70)
        }
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
    }
}

#Preview {
    TestView()
}
