//
//  ProfileVC.swift
//  assignment
//
//  Created by Surya Koneru on 10/03/23.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var profileTable: UITableView!
    var viewModel = ProfileViewModel()
    var profileList:ProfileResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerTableView()
        
        //fetching data from API
        
        viewModel.apiToGetProfileData { [weak self] in
            self?.profileList = self?.viewModel.profileData
            
            DispatchQueue.main.async {
                self?.profileTable.reloadData()
            }
            
        }
    
    }
    
    func registerTableView(){
        profileTable.register(UINib(nibName: "ProfileCell", bundle: .main), forCellReuseIdentifier: "ProfileCell")
        profileTable.delegate = self
        profileTable.dataSource = self
    }
}

extension ProfileVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as? ProfileCell else {return UITableViewCell()}
        cell.idLabel.text = "UserID:\(profileList?.id ?? "")"
        cell.pointsEarnedLabel.text = "\(profileList?.pointsEarned ?? "")\n Points Earned"
        cell.walletBalanceLabel.text = "\(profileList?.walletBalance ?? "")\n Wallet Balance"
        cell.userNameTF.text = profileList?.username ?? ""
        cell.firstNameTF.text = profileList?.firstname ?? ""
        cell.lastNameTF.text = profileList?.lastName ?? ""
        cell.dobTF.text = profileList?.dob ?? ""
        cell.addressTF.text = profileList?.address ?? ""
        return cell
    }
}
