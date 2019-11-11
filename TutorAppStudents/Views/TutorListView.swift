//
//  TutorListView.swift
//  TutorAppStudents
//
//  Created by PCSIJTIN on 11/11/19.
//  Copyright © 2019 Profind. All rights reserved.
//

import SwiftUI

struct TutorRow: View {
  var tutor: TutorViewModel
  
  var body: some View {
    Text(tutor.academic_group_name)
  }
}

struct TutorListView: View {
  @ObservedObject private var tutorListViewModel = TutorListViewModel()
  
  var body: some View {
    List(self.tutorListViewModel.tutors) { tutor in TutorRow(tutor: tutor)
      
      }
      
  }
}

struct TutorListView_Previews: PreviewProvider {
  static var previews: some View {
    TutorListView()
  }
}
