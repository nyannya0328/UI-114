//
//  HeaderView.swift
//  UI-114
//
//  Created by にゃんにゃん丸 on 2021/01/29.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
     
        HStack{
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                   Image(systemName: "magnifyingglass")
                    .font(.title2)
            })
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                   Image(systemName: "line.horizontal.3")
                    .font(.title2)
            
        })
    }
        .padding()
        
        .overlay(
        
        Text("SquareSpace")
            .font(.title2)
            .fontWeight(.bold)
        )
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color.black.opacity(0.6))
        .foregroundColor(.white)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
        
    }
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
