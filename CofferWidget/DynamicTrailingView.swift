//
//  DynamicTrailingView.swift
//  CofferWidgetExtension
//
//  Created by JerryLiu on 2022/9/24.
//

import SwiftUI
import WidgetKit

struct DynamicTrailingView: View {
    
    var body: some View {
        ZStack {
            CofferProductView(cofferName: "cappuccino")
                        .frame(width: 40, height: 25)
            
            CofferProductView(cofferName: "mocha")
                        .frame(width: 40, height: 25)
                        .padding(.leading, 40.0)
        }
    }
}

struct DynamicTrailingView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTrailingView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
