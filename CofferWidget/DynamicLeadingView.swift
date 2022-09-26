//
//  DynamicLeadingView.swift
//  CofferWidgetExtension
//
//  Created by JerryLiu on 2022/9/24.
//

import SwiftUI
import WidgetKit

struct DynamicLeadingView: View {
    
    var cofferStatus: CofferStatus
    
    var body: some View {
        
        HStack {
            CoffeeStateView(width:30, logo:cofferStatus == .making ? "coffee-maker" : (cofferStatus == .sending ? "delivery-time" : "avatar")  , scale: 1)
            
            Text(cofferStatus == .making ? "制作中" : (cofferStatus == .sending ? "配送中" : "已送达"))
                .foregroundColor(.white)
                .font(.custom("STHeitiTC-Medium", fixedSize: 14))
        }
    }
}

struct DynamicLeadingView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicLeadingView(cofferStatus: .making)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
