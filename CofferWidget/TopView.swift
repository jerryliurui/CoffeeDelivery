//
//  TopView.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/21.
//

import SwiftUI
import WidgetKit

struct TopView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("blue1"),Color("blue3")], startPoint: .top, endPoint: .bottom)
            
            HStack {
                Image("luckyicon")
                    .resizable()
                    .frame(width: 34, height: 34)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("幸运送")
                        .foregroundColor(.white)
                        .font(.custom("STHeitiSC-Medium", fixedSize: 18))
                    HStack(spacing: 0.0) {
                        Text("Lucky you~")
                            .foregroundColor(.white)
                        .font(.custom("STHeitiTC-Medium", fixedSize: 12))
                        Text("跟幸运打个招呼")
                            .foregroundColor(.white)
                        .font(.custom("STHeitiTC-Medium", fixedSize: 12))
                    }
                    .padding(.top, -4.0)
                }
                
                Spacer()
                
                ZStack {
                    CofferProductView(cofferName: "cappuccino")
                                .frame(width: 40, height: 25)
                    
                    CofferProductView(cofferName: "mocha")
                                .frame(width: 40, height: 25)
                                .padding(.leading, 40.0)
                }
            }
            .padding([.top, .leading, .trailing])
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
