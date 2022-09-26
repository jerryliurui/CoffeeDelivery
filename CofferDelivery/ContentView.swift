//
//  ContentView.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/21.
//

import SwiftUI

struct ContentView: View {
    let cofferTrigger: CoffeeTrigger = CoffeeTrigger()
    
    var body: some View {
        VStack {
            FIFAGifImageView(gifName: "truck-delivery-done")
                .frame(width: 300, height: 300)
            
            Button {
              DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2,
                            execute: {
                    cofferTrigger.startPushLiveActivities()
                })
              
            } label: {
              Text("购买两杯咖啡")
                .font(.system(size: 18, weight: .medium))
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
