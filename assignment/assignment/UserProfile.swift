//
//  UserProfile.swift
//  assignment
//
//  Created by Surya Koneru on 11/03/23.
//

import Foundation

struct ProfileResponse: Codable {
    let id: String
    let username: String
    let firstname: String
    let lastName: String
    let dob: String
    let address: String
    let pointsEarned: String
    let walletBalance: String
}
