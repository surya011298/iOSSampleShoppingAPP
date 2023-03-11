//
//  ProductsViewModel.swift
//  assignment
//
//  Created by Surya Koneru on 11/03/23.
//

import Foundation

class ProductsViewModel {
    
    var productData:ProductResponse?
    private let sourcesURL = URL(string: "https://run.mocky.io/v3/bc09a745-4346-4025-9611-9da76366dbbc")!

    func apiToGetProductData(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let productData = try! jsonDecoder.decode(ProductResponse.self, from: data)
                self?.productData = productData
                //print("Data from response in ViewModel",productData)
                completion()
            }
        }.resume()
    }
}
