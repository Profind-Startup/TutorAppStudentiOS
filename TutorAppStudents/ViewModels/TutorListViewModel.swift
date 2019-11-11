//
//  TutorListViewModel.swift
//  TutorAppStudents
//
//  Created by PCSIJTIN on 11/11/19.
//  Copyright © 2019 Profind. All rights reserved.
//

import Foundation

class TutorListViewModel: ObservableObject {
  
  @Published var tutors = [TutorViewModel]()
  
  init() {
    TutorAppService().getTutors { tutors in
      
      if let tutors = tutors {
        self.tutors = tutors.map(TutorViewModel.init)
      }
      
    }
  }
  
}
