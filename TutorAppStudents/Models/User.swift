//
//  User.swift
//  TutorApp
//
//  Created by PCSIJTIN on 11/17/19.
//  Copyright © 2019 Profind. All rights reserved.
//

import Foundation

struct User: Codable {
  
  var id: Int
  var names: String
  var last_names: String
  var dni: String
  var address: String
  var username: String
  var password: String
   

  init() {
    id = 0
    names = ""
    last_names = ""
    dni = ""
    address = ""
    username = ""
    password = ""
  }
}
