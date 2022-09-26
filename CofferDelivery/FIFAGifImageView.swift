//
//  FIFAGifImageView.swift
//  WidgetDemoExtension
//
//  SwiftUI 播放GIF
//
//  Created by JerryLiu on 2022/9/22.
//

import SwiftUI
import WebKit

struct FIFAGifImageView: UIViewRepresentable {
    
    private let gifName : String
    
    init(gifName: String) {
        self.gifName = gifName
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: gifName, withExtension: ".gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url.deletingLastPathComponent())
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct FIFAGifImageView_Previews: PreviewProvider {
    static var previews: some View {
        FIFAGifImageView(gifName: "Football2")
    }
}
