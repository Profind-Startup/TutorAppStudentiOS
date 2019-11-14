//
//  TutorViewModel.swift
//  TutorAppStudents
//
//  Created by PCSIJTIN on 11/11/19.
//  Copyright © 2019 Profind. All rights reserved.
//

import Foundation


struct TutorViewModel: Identifiable {
  
  var tutor: Tutor
  
  var id = UUID()
  
  init(tutor: Tutor) {
    self.tutor = tutor
  }

    var id_tutor: Int {
        return self.tutor.id
    }
    
    var user_id: Int {
        return self.tutor.user_id
    }
    
  var academic_group_name: String {
    return self.tutor.academic_group_name
  }
  
  var academic_group_foundation_date: String {
    return self.tutor.academic_group_foundation_date
  }
  
    var academic_group_address: String {
       return self.tutor.academic_group_address
     }
     var birth_date: String {
        return self.tutor.birth_date
      }
     
  
}

