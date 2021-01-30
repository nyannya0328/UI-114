//
//  StickyView.swift
//  UI-114
//
//  Created by にゃんにゃん丸 on 2021/01/29.
//

import SwiftUI

let gra = LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing)

struct StickyView: View {
    @Binding var firstMinY : CGFloat
    @Binding var minY : CGFloat
    @Binding var lastMinY : CGFloat
    @Binding var scale : CGFloat
    @Binding var show : Bool
   
    var body: some View {
        GeometryReader{ reader -> AnyView in
            
            let minY = self.firstMinY - reader.frame(in: .global).minY
            
            let progress = (minY > 0 ? minY : 0) / 200
            
            let scale = (1 - progress) * 1
            
            let imagescale = (scale / 0.6) > 0.9 ? (scale / 0.6) : 0.9
            
            let imageoffset = imagescale > 0 ? (1 - imagescale) * 200 : 20
            
            DispatchQueue.main.async {
                if self.firstMinY == 0{
                    self.firstMinY = reader.frame(in: .global).minY
                    
                }
                self.minY = minY
                if scale < 0.4 && lastMinY == 0{
                    
                    self.lastMinY = minY
                    
                }
            }
            
            
            return AnyView(
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getScreen().width, height: getScreen().height - firstMinY)
                .cornerRadius(1)
                .scaleEffect(scale < 0.6 ? imagescale : 1)
                .offset(y: scale < 0.6 ? imageoffset : 0)
                .overlay(
                    ZStack{
                        
                        
                        VStack{
                            
                            Text("Create WebSite")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("The Leader in\nwebsite design")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.top,10)
                            
                            
                        }
                        .foregroundColor(.white)
                        .offset(y: -20)
                        .padding()
                        .opacity(Double(scale - 0.7) / 0.3)
                        
                        Text("Seattle Based\nTiger")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .scaleEffect(1.5)
                            .opacity(0.3 - Double(scale - 0.7) / 0.3)
                       
                    }
                
                )
                .background(
                    
                    ZStack{
                    
                        if scale < 0.6{
                            
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(gra)
                            VStack{
                                
                                
                                HStack{
                                    
                                    Text("Castle")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    ForEach(1...3,id:\.self){_ in
                                        
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 15, height: 15)
                                        
                                    }
                                    
                                }
                                .padding()
                                Spacer()
                            }
                        }
                    
                    
                })
                .scaleEffect(scale > 0.6 ? scale : 0.6)
               .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                .offset(y: scale > 0.6 ? (scale - 1) * 200 : -80)
              
            )
        }
        .frame(width: getScreen().width, height:getScreen().height - firstMinY)
        .overlay(
            
            VStack(spacing:15){
                
                Text("The tiger once ranged widely from the Eastern Anatolia Region in the west to the Amur River basin, and in the south from the foothills of the Himalayas to Bali in the Sunda islands")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                
                Button(action: {
                    
                    withAnimation{
                        
                        show.toggle()
                    }
                    
                   
                }, label: {
                    Text("Create Account")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(gra)
                        .cornerRadius(10)
                })
                .padding(.top,10)
                
            }
            .padding(.bottom,70)
           
            .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
            ,alignment: .bottom
        
        
        
        )
        .fullScreenCover(isPresented: $show){
            
            CustomTabView()
        }
    }
    
    
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
