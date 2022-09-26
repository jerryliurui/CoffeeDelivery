//
//  LiveCofferWidget.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/23.
//

import Foundation
import SwiftUI
import WidgetKit

struct LiveCofferWidget: Widget {
    var body: some WidgetConfiguration {
        
        //创建锁屏Live 和 Dynamic Island 灵动岛UI
        ActivityConfiguration (for: CofferActivityAttributes.self) { context in
            LiveActivitiesView(attribute: context.attributes, state: context.state)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.trailing) {
                    ZStack {
                        CofferProductView(cofferName: "cappuccino")
                            .frame(width: 40, height: 25)
                        CofferProductView(cofferName: "mocha")
                            .frame(width: 40, height: 25)
                            .padding(.leading, 40)
                    }
                }
                
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        Image("luckyicon")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("幸运送")
                            .foregroundColor(.white)
                            .font(.custom("STHeitiSC-Medium", fixedSize: 18))
                    }
                }
                
                DynamicIslandExpandedRegion(.center) {
                    //这里不展示东西了
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    VStack {
                        CofferProgressView(cofferStatus: context.state.cofferStatus, progressToDrink: Float(context.state.finishDistance/context.attributes.totalDistance))
                            .padding(.top)
                        
                        Text(context.state.tips)
                            .foregroundColor(.white)
                            .font(.custom("STHeitiTC-Medium", size: 16))
                    }
                    
                }
            } compactLeading: {
                DynamicLeadingView(cofferStatus: context.state.cofferStatus)
            } compactTrailing: {
                DynamicTrailingView()
            } minimal: {//咖啡一直拼错了，好尴尬啊 😓￣□￣｜｜！！！！！！！！！！！
                CoffeeStateView(width: 30, logo: context.state.cofferStatus == .making ? "coffee-maker" : (context.state.cofferStatus == .sending ? "delivery-time" : "avatar"), scale: 1)
            }
        }
    }
}
