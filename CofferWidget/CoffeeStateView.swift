//
//  CoffeeStateView.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/22.
//

import SwiftUI
import WidgetKit

struct CoffeeStateView: View {
    var width: CGFloat
    
    var logo: String
    
    var scale: Float
    
    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: width*CGFloat(scale), height: width*CGFloat(scale))
            Image(logo)
                .resizable()
                .frame(width: (width-6)*CGFloat(scale), height: (width-6)*CGFloat(scale))
        }
    }
}

struct CoffeeStateView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeStateView(width: 36, logo: "delivery-time", scale: 1.2)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
