//
//  AppSettings.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import Foundation

class AppSettings {
    static let shared = AppSettings()
    var serverBaseAddress = "https://www.random.org/strings/"
    
    static let mockUser =  LoginData(userName: "user", password: "123qwe")
}

enum Endpoints: String {
    case list = "?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
    case login = ""
}
