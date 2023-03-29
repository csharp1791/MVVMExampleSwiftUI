//
//  ProductListViewModel.swift
//  MVVMExampleSwiftUIp
//
//  Created by Cliff Sharp on 3/21/23.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
  
  @Published var products: [ProductViewModel] = []
  let webservice: Webservice
  
  init(webservice: Webservice) {
    self.webservice = webservice
  }
  
  func populateProducts() async {
    do {
      let products = try await webservice.getProduct()
      self.products = products.map(ProductViewModel.init)
      
    } catch {
      print(error.localizedDescription)
    }
  }
}

struct ProductViewModel: Identifiable {
  
  private var product: Product
  
  init(product: Product) {
    self.product = product
  }
  
  var id: Int {
    product.id
  }
  
  var title: String {
    product.title
  }
  
  var price: Double {
    product.price
  }
  
  var images: [String] {
    product.images
  }
  
}
