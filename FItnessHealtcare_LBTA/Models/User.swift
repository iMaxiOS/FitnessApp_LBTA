//
//  User.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 03.09.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let photoURL: URL?
}
