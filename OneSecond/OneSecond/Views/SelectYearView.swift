//
//  SelectYearView.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import SwiftUI

struct SelectYearView: View {
    @State private var isVStackHidden: [Bool] = Array(repeating: false, count: yearData.count)  // 버튼 상태 배열
    @State private var selectedIndex: Int? = nil  // 선택된 버튼의 인덱스
    @State private var isAnimating: Bool = false  // 애니메이션 상태
    
    var body: some View {
        ScrollView(showsIndicators: false){
            HStack{
                VStack(alignment:.leading){
                    Text("연도를 선택해주세요!").font(.system(size: 24, weight: .semibold))
                        .padding(.bottom,1)
                        .padding(.leading,5)
                    Text("연도에 맞는 음악 퀴즈가 자동 생성돼요.")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color(hex: "#C7C7C7"))
                        .padding(.bottom,20)
                        .padding(.leading,5)
                }   
                Spacer()
            }
            
            .padding(.top, 30)
            
            VStack(alignment: .leading) {
                ForEach(0..<yearData.count/2, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<2, id: \.self) { columnIndex in
                            let index = 23 - (rowIndex * 2 + columnIndex)
                            if selectedIndex == nil || selectedIndex == index {
                                VStack {
                                    Image(yearData[index].imageSource)
                                        .resizable()
                                    
                                        .clipShape(RoundedRectangle(cornerRadius: 40))
                                        .frame(width: selectedIndex == index ? 320 : 180,
                                               height: selectedIndex == index ? 320 : 180)
                                        .shadow(color: .gray, radius: 1, x: 0, y: 3)

                                    .foregroundColor(Color(hex: "#C7C7C7"))
//                                    Image("\(yearData[index].imageSource)")
//                                        .resizable()
//                                        .frame(width: selectedIndex == index ? 361 : 180,
//                                               height: selectedIndex == index ? 361 : 180)
//                                    .cornerRadius(10)
                                        .onTapGesture {
                                            guard !isAnimating else { return }
                                            isAnimating = true
                                            withAnimation {
                                                selectedIndex = (selectedIndex == index) ? nil : index
                                                isVStackHidden[index].toggle()
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                isAnimating = false
                                            }
                                        }
                                        .disabled(isAnimating)
                                    if isVStackHidden[index] {
                                        SelectOptionView(isHidden: $isVStackHidden[index], yeardata: yearData[index])
                                            .transition(.scale)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SelectYearView()
}
