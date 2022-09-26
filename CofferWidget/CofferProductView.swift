//
//  CofferProductView.swift
//  CofferWidgetExtension
//
//  Created by JerryLiu on 2022/9/22.
//

import SwiftUI
import WidgetKit

struct CofferProductView: View {
    var cofferName: String
    
    var body: some View {
        Image(cofferName)
            .resizable()
            .clipShape(Circle())
    }
}

struct CofferProductView_Previews: PreviewProvider {
    static var previews: some View {
        CofferProductView(cofferName: "cappuccino")
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
