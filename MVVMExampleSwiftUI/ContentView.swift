//
//  ContentView.swift
//  MVVMExampleSwiftUI
//
//  Created by Cliff Sharp on 3/21/23.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject private var vm = ProductListViewModel(webservice: Webservice())
  
  var body: some View {
    
    List(vm.products) { product in
      Text(product.title)
      Text(product.price.toCurrency())
      AsyncImage(url: URL(string: product.images[0]), scale: 3)

    }.task {
      await vm.populateProducts()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
