//
//  ProfileViewModel.swift
//  assignment
//
//  Created by Surya Koneru on 11/03/23.
//

import Foundation

class ProfileViewModel {
    
    var profileData:ProfileResponse?
    private let sourcesURL = URL(string: "https://run.mocky.io/v3/aaf97364-eedc-46a5-8f9e-56eb4b3cedd2")!

    func apiToGetProfileData(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let profileData = try! jsonDecoder.decode(ProfileResponse.self, from: data)
                self?.profileData = profileData
                print("Data from response in ViewModel",profileData)
                completion()
            }
        }.resume()
    }
}
