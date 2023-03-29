//
//  Product.swift
//  MVVMExampleSwiftUI
//
//  Created by Cliff Sharp on 3/21/23.
//

import Foundation

struct Product: Decodable {
  let id: Int
  let title: String
  let price: Double
  let images: [String]
}
