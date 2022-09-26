//
//  CofferOrderInfo.swift
//  CofferDelivery
//
//  Created by JerryLiu on 2022/9/23.
//

import Foundation

public class CofferOrderInfo : Codable, Hashable {
    public static func == (lhs: CofferOrderInfo, rhs: CofferOrderInfo) -> Bool {
        return lhs.orderId == rhs.orderId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(coffees)
        hasher.combine(orderId)
        hasher.combine(userHead)
        hasher.combine(price)
    }
    
    public var coffees: Array<String> = []
    public var orderId: String = ""
    public var userHead: String = ""
    public var price: Double = 0.0
    
    init(coffees: Array<String>, orderId: String, userHead: String, price: Double) {
        self.coffees = coffees
        self.orderId = orderId
        self.userHead = userHead
        self.price = price
    }
}
