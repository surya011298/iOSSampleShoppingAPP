//
//  ProductsVC.swift
//  assignment
//
//  Created by Surya Koneru on 10/03/23.
//

import UIKit

class ProductsVC: UIViewController {

    @IBOutlet weak var productsTable: UITableView!
    var viewModel = ProductsViewModel()
    var productList:ProductResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        registerTableView()
        
        //fetching data from API
        
        viewModel.apiToGetProductData { [weak self] in
            self?.productList = self?.viewModel.productData
            
            DispatchQueue.main.async {
                self?.productsTable.reloadData()
            }
            
        }
    }
    func registerTableView(){
        productsTable.register(UINib(nibName: "ProductCell", bundle: .main), forCellReuseIdentifier: "ProductCell")
        productsTable.delegate = self
        productsTable.dataSource = self
    }


}

extension ProductsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList?.data.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else {return UITableViewCell()}
        cell.productNameLabel.text = productList?.data.products[indexPath.row].name ?? ""
        cell.priceLabel.text = "Price:\(productList?.data.products[indexPath.row].price ?? "")"
        cell.offerPriceLabel.text = "OfferPrice:\(productList?.data.products[indexPath.row].offerPrice ?? "")"
        cell.productDescLabel.text = productList?.data.products[indexPath.row].productDesc ?? ""
        cell.productImage.layer.cornerRadius = 20
        cell.productImage.load(urlString: productList?.data.products[indexPath.row].productUrl ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        let product = productList?.data.products[indexPath.row]
            
            let alertController = UIAlertController(title: "Product Selected", message: "Thank you for joining our rewards program", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
}


extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else{return}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.image = image
                    }
                }
            }
        }
    }
}
