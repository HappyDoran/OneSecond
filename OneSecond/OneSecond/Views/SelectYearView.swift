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
                    Text("연도에 맞는 음악 퀴즈가 자동 생성돼요.")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color(hex: "#C7C7C7"))
                        .padding(.bottom,10)
                }
                Spacer()
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading) {
                ForEach(0..<yearData.count/2) { rowIndex in
                    HStack {
                        ForEach(0..<2) { columnIndex in
                            let index = 23 - (rowIndex * 2 + columnIndex)
                            if selectedIndex == nil || selectedIndex == index {
                                VStack {
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .frame(width: selectedIndex == index ? 361 : 180,
                                               height: selectedIndex == index ? 361 : 180)
                                        .foregroundColor(Color(hex: "#C7C7C7"))
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
