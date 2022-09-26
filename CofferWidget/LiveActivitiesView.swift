//
//  LiveActivitiesView.swift
//  CofferWidgetExtension
//
//  Created by JerryLiu on 2022/9/22.
//

import SwiftUI
import WidgetKit

struct LiveActivitiesView: View {
    @State var attribute: CofferActivityAttributes
    @State var state: CofferActivityAttributes.ContentState
    
    var body: some View {
        VStack(spacing: 0.0) {
            TopView()
            BottomView(attribute: attribute, state: state)
        }
    }
}

struct LiveActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        
        let orderInfo = CofferOrderInfo(coffees: ["mocha","cappuccino"], orderId: "jerryliu1", userHead: "avatar", price: 36)
        let attribute = CofferActivityAttributes(totalDistance: 1000, orderInfo: orderInfo)
        let startState = CofferActivityAttributes.ContentState(finishDistance: 0, cofferStatus: .making, tips: "正在制作您的饮品")
        
        LiveActivitiesView(attribute: attribute, state: startState)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
