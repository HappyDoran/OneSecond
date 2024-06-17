//
//  OnbordingVIew.swift
//  OneSecond
//
//  Created by Doran on 6/17/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(alignment:.leading){
            Spacer()
            Text("one").font(.custom("Hoefler Text Black", size: 56)).foregroundColor(Color(hex: "007AFF"))
            Text("second").font(.custom("Hoefler Text Black", size: 56)).foregroundColor(Color(hex: "000000"))
            Spacer()
        }
        Button {
            NavigationManager.shared.push(to: .selectYear)
        } label: {
            HStack {
                Spacer()
                Text("시작하기")
                    .font(.system(size: 20))
                    .bold()
                    .tint(.white)
                Spacer()
            }
            .padding(.vertical, 16)
        }
        .background(Color(hex: "007AFF"))
        
    }
}

#Preview {
    OnboardingView()
}
