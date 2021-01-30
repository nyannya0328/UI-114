//
//  Home.swift
//  UI-114
//
//  Created by にゃんにゃん丸 on 2021/01/29.
//

import SwiftUI

struct Home: View {
    @State var firstMinY : CGFloat = 0
    @State var show = false
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    @State var minY : CGFloat = 0
    @State var lastMinY : CGFloat = 0
    
    @State var scale : CGFloat = 0
    @State var issmall = UIScreen.main.bounds.height < 750
   

    var body: some View {
        
    
        VStack(spacing:0){
            
           HeaderView()
            
            ScrollView{
                
               
                StickyView(firstMinY: $firstMinY, minY: $minY, lastMinY: $lastMinY, scale: $scale, show: $show)
                    
                
              VStack(alignment: .leading, spacing: 15, content: {
                    
                    ForEach(subTitle,id:\.self){text in
                        Section(header: Text(text)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)){
                            
                            
                           
                            
                            Text("The tiger (Panthera tigris) is the largest extant cat species and a member of the genus Panthera. It is most recognisable for its dark vertical stripes on orange-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar. It is territorial and generally a solitary but social predator, requiring large contiguous areas of habitat, which support its requirements for prey and rearing of its offspring. Tiger cubs stay with their mother for about two years, before they become independent and leave their mother's home range to establish their own.")
                                .fontWeight(.semibold)
                             
                                .foregroundColor(.black)

                        }
                        
                        
                        
                            
                        
                    }
                  
                    
                })
                .padding()
                .padding(.bottom,lastMinY)
              .background(Color.white)
                .offset(y: scale > 0.4 ? minY : lastMinY)
              .opacity(scale < 0.3 ? 1 : 0)
              
                
            
                
                
                
            }
            
            
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.8).ignoresSafeArea(.all, edges: .all))
       
    }
}

let subTitle = ["Tiger Amazing","Tiger Fear","Sumatra","Carnivorous","Wonderful"]

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    
    func getScreen() -> CGRect{
        
        UIScreen.main.bounds
    }
    
    func getSafearea() -> CGFloat{
        
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
        
    }
    
}
