//
//  CustomTabView.swift
//  UI-114
//
//  Created by にゃんにゃん丸 on 2021/01/29.
//

import SwiftUI

struct CustomTabView: View {
    
   
    @State var selected = "Swfit"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Environment(\.colorScheme) var scheme
    
    @Environment(\.presentationMode) var present
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
          
           
           
            
            TabView(selection:$selected){
                
                Color.red
                    .tag("Swfit")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color.green
                    .tag("Book")
                    .ignoresSafeArea(.all, edges: .all)
                
                
                Color.purple
                    .tag("Computer")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color.orange
                    .tag("Setting")
                    .ignoresSafeArea(.all, edges: .all)
                
                
            }
            
            HStack(spacing:0){
                
                Button(action: {
                    
                    present.wrappedValue.dismiss()
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .frame(width: 30, height: 30)
                }
                .padding()
                
                TabButtonView(title: "Swfit", image: "swift", selected: $selected)
                TabButtonView(title: "Book", image: "books.vertical.fill", selected: $selected)
                TabButtonView(title: "Computer", image: "laptopcomputer", selected: $selected)
                TabButtonView(title: "Setting", image: "gear", selected: $selected)
               
                    
                
            }
            
            .frame(maxWidth: .infinity,alignment: .leading)
            
            .background(scheme == .dark ? Color.black : Color.white)
            
        })
        .ignoresSafeArea(.all, edges: .all)
       
        
    }
}

struct TabButtonView : View {
    
    var title : String
    var image : String
    @Binding var selected : String
   
    var body: some View{
        
        Button(action: {
            
            withAnimation(.easeInOut){
                
                selected = title
                
                
            }
            
            
            
        }, label: {
            VStack(spacing:5){
                
                
                Image(systemName: image)
                    .font(.system(size: 30))
                    .foregroundColor(selected == title ? .white : .primary)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(selected == title ? .white : .primary)
                    
                
            }
            .frame(width: (self.getScreen().width - 75) / 3.6, height: 55 + self.getSafearea())
            
        })
        .padding(.bottom,8)
        .background(gra.offset(y: selected == title ? 0 : 100))
        
        
       
       
       
        
        
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}


