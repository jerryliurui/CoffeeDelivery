//
//  CofferStateView.swift
//  CofferWidgetExtension
//
//  Created by JerryLiu on 2022/9/22.
//

import SwiftUI
import WidgetKit

struct CofferProgressView: View {
    
    var cofferStatus: CofferStatus
    
    var progressToDrink : Float
    
    var body: some View {
        
        VStack {
            HStack {
                
                CoffeeStateView(width:36, logo: "coffee-maker", scale: (cofferStatus.rawValue == 0) ? 1.2 : 1)
                
                Spacer()
                
                CoffeeStateWholeView(scale: (cofferStatus.rawValue == 1) ? 1.2 : 1, progressToDrink: progressToDrink)
                    .opacity(cofferStatus == .sending ? 1 : 0)
                
                Spacer()
                
                CoffeeStateView(width:36, logo: "avatar", scale: (cofferStatus.rawValue == 2) ? 1.2 : 1)
            }
            .frame(width: 276)
            
            CustomProgressView(progress: progressToDrink)
        }
        
    }
}

struct CofferStateView_Previews: PreviewProvider {
    static var previews: some View {
        CofferProgressView(cofferStatus: .making, progressToDrink:0.9)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct CoffeeStateWholeView: View {
    var scale: Float
    
    var progressToDrink: Float
    
    var body: some View {
        let offsetX = progressToDrink < 0.5 ? 240.0*progressToDrink - 120 : -(120 - 240.0*progressToDrink)
        
        CoffeeStateView(width:36, logo: "delivery-time", scale: scale)
            .offset(CGSize(width: CGFloat(offsetX), height: 0))
    }
}
