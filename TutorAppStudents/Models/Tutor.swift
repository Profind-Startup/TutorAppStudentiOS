//
//  Tutor.swift
//  TutorAppStudents
//
//  Created by PCSIJTIN on 11/11/19.
//  Copyright © 2019 Profind. All rights reserved.
//

import Foundation

struct Tutor: Codable {
  
  var id: Int
  var user_id: Int
  var academic_group_name: String
  var id_academic_group_foundation_datetutor: String
  var academic_group_address: String
  var birth_date: String
     
  init() {
    id = 0
    user_id = 0
    academic_group_name = ""
    id_academic_group_foundation_datetutor = ""
    academic_group_address = ""
    birth_date = ""
  }
}
