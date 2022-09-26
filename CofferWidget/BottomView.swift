//
//  BottomView.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/22.
//

import SwiftUI
import WidgetKit

struct BottomView: View {
    @State var attribute: CofferActivityAttributes
    @State var state: CofferActivityAttributes.ContentState
    @State private var tipsOpacity: Double = 1
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("blue3"),Color("blue4")], startPoint: .top, endPoint: .bottom)
            
            VStack {
                
                CofferProgressView(cofferStatus: state.cofferStatus, progressToDrink: Float(state.finishDistance/attribute.totalDistance))
                    .padding(.top)
                
                HStack {
                    Text(state.tips)
                        
                        .transition(.moveAndFade)
                        .opacity(tipsOpacity)
                        .foregroundColor(Color.white)
                        .font(.custom("STHeitiTC-Medium", fixedSize: 16))
                        .onAppear {
                            withAnimation(Animation.easeIn(duration: 2).delay(0)) {
                                tipsOpacity = 1
                            }
                        }
                }
                .padding(.bottom)
            }
        }
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.move(edge: .trailing)
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        let orderInfo = CofferOrderInfo(coffees: ["mocha","cappuccino"], orderId: "jerryliu1", userHead: "avatar", price: 36)
        let attribute = CofferActivityAttributes(totalDistance: 1000.0, orderInfo: orderInfo)
        let startState = CofferActivityAttributes.ContentState(finishDistance: 0.0, cofferStatus: .making, tips: "正在制作您的饮品")
        BottomView(attribute: attribute, state: startState)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
