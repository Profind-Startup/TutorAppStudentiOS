//
//  TutorAppService.swift
//  TutorAppStudents
//
//  Created by PCSIJTIN on 11/11/19.
//  Copyright © 2019 Profind. All rights reserved.
//

import Foundation

class TutorAppService {
  func getTutors(completion: @escaping ([Tutor]?) -> ()) {
    guard let url = URL(string: "http://tutorapp.somee.com/api/tutors") else {
      fatalError("Invalid URL")
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completion(nil)
        if let error = error {
          print(error.localizedDescription)
        }
        return
      }
      
      
      let tutors = try? JSONDecoder().decode([Tutor].self, from: data)
        
    
        
      DispatchQueue.main.async {
        completion(tutors)
      }

      if let error = error {
        print(error.localizedDescription)
      }

    }.resume()
  }
}
