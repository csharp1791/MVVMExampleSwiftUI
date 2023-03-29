//
//  Webservice.swift
//  MVVMExampleSwiftUI
//
//  Created by Cliff Sharp on 3/21/23.
//

import Foundation

enum NetworkError: Error {
  case badURL
  case badRequest
  case decodingError
}

class Webservice {
  
  func getProduct() async throws -> [Product] {
    
    guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else {
      throw NetworkError.badURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      throw NetworkError.badRequest
    }
    
    guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
      throw NetworkError.decodingError
    }
    
    print (products)
    return products
  }
  
}
