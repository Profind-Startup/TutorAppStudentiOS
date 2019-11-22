//
//  Student.swift
//  TutorAppStudents
//
//  Created by PCSIJTIN on 11/21/19.
//  Copyright © 2019 Profind. All rights reserved.
//


import Foundation

struct Student: Codable {
  
  var id: Int
  var user_id: Int
 
  init() {
    id = 0
    user_id = 0
   
  }
}
