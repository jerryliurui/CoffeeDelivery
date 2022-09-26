//
//  ProgressView.swift
//  CofferWidgetExtension
//
//  Created by JerryLiu on 2022/9/23.
//

import SwiftUI
import WidgetKit

struct CustomProgressView: View {
    var progress: Float
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(Color("customgray"))
                .padding(.horizontal, 0.0)
                .cornerRadius(5)
                .frame(width: 240, height: 8)
            
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .foregroundColor(Color.blue)
                .padding(.horizontal, 0.0)
                .cornerRadius(5)
                .frame(width: 240, height: 8)
                .offset(CGSize(width: -(240*CGFloat(1-progress)), height: 0))
        }
        .cornerRadius(4)
        .clipped()
        .padding(.horizontal, 0.0)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(progress: 0.1)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
