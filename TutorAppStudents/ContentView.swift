//
//  ContentView.swift
//  TutorApp
//
//  Created by PCSIJTIN on 11/2/19.
//  Copyright © 2019 Profind. All rights reserved.
//

import SwiftUI

var check = false
func checkStudent(user_id: Int) {
    
    guard let url = URL(string: "http://tutorapp.somee.com/api/Users/" + String(user_id) + "/Student") else
       {
return
         
     }
  
     
     URLSession.shared.dataTask(with: url){ (data, response, error) in
         print(data)
         
         let student = try? JSONDecoder().decode(Student.self, from: data!)
         DispatchQueue.main.async {
          //  UserDefaults.standard.set(user.id, forKey: "user_id")
            if(student != nil)
            {
                print(student?.user_id)
             UserDefaults.standard.set(String(student!.id), forKey: "tutor_id")
                check = true
            }
         }
     }.resume()
   
 }

func checkDetails(username: String, password: String){
    
     guard let url = URL(string: "http://tutorapp.somee.com/api/users/check") else
        {
 return
          
      }
      let body: [String: String] = ["address": "","password": password,"id": "0","last_names":"","username": username, "names":""]
      
      let finalBody = try! JSONSerialization.data(withJSONObject: body)
      
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.httpBody = finalBody
      
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      URLSession.shared.dataTask(with: request){ (data, response, error) in
          print(data)
          
          let user = try? JSONDecoder().decode(User.self, from: data!)
          DispatchQueue.main.async {
           //  UserDefaults.standard.set(user.id, forKey: "user_id")
              print(user?.names)
              if(user != nil)
              {
              UserDefaults.standard.set(String(user!.id), forKey: "user_id")
             
              checkStudent(user_id: user!.id)
               
              }
          }
      }.resume()
   
  }
struct ContentView: View {
    
    @State var username: String = ""
           @State var password: String = ""
        
      
    @State var view: String = "viewLogin"
  
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
     
   
    
    struct HomeView: View {
    
       var body: some View {
          Text("Busca un tutor segun el tema")
                        .fontWeight(.semibold)
                        .padding(.bottom, 15)
                         .font(.system(size: 15))
       }
        
        
     }
     struct RegisterSubject: View {
     
        let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
          @State var subject: String = ""
                
                 @State var area: String = ""
          @State var view2: String = "viewLogin"
           
        
        var body: some View {
            VStack {
                                  TextField("Tema", text: $subject)
                                                               .padding()
                                                               .background(lightGreyColor)
                                                               .cornerRadius(5.0)
                                                               .padding(.bottom, 20)
                                    TextField("Area", text: $area)
                                                               .padding()
                                                               .background(lightGreyColor)
                                                               .cornerRadius(5.0)
                                                               .padding(.bottom, 20)
                              
                                    Button(action: {self.view2 = "viewLogin"}) {
                                  AddSubjectButtonContent()
                                              }
                                  
                                }
        }
         
         
      }
    
    
    struct ViewReservations: View {
     var body: some View {
       
        Text("Mi calendario")
                                   .font(.largeTitle)
                                   .fontWeight(.semibold)
                                   .padding(.bottom, 30)
        }
     }
    
    struct UserRegister: View {
        
        @State var username: String = ""
          @State var password: String = ""
          
          @State var names: String = ""
          @State var lastnames: String = ""
           
          @State var dni: String = ""
          @State var telephone: String = ""
          
          @State var address: String = ""
        
        
        @State var view2: String = "viewLogin"
                  
        let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
        
        
        var body: some View {
           VStack {
                                   Text("Registro")
                                  .font(.largeTitle)
                                  .fontWeight(.semibold)
                                  .padding(.bottom, 1)
               
                                 TextField("Usuario", text: $username)
                                                              .padding()
                                                              .background(lightGreyColor)
                                                              .cornerRadius(5.0)
                                                              .padding(.bottom, 1)
                                                               .font(.system(size: 15))
                                   TextField("Contraseña", text: $password)
                                                              .padding()
                                                              .background(lightGreyColor)
                                                              .cornerRadius(5.0)
                                                              .padding(.bottom, 1)
                                                           .font(.system(size: 15))
               
                                   TextField("Nombres", text: $names)
                                                              .padding()
                                                              .background(lightGreyColor)
                                                              .cornerRadius(5.0)
                                                              .padding(.bottom, 1)
                                                                .font(.system(size: 15))
                HStack {
                                   TextField("DNI", text: $dni)
                                                              .padding()
                                                              .background(lightGreyColor)
                                                              .cornerRadius(5.0)
                                                              .padding(.bottom, 1)
                                                            .font(.system(size: 15))
                                   TextField("Teléfono", text: $telephone)
                                                             .padding()
                                                             .background(lightGreyColor)
                                                             .cornerRadius(5.0)
                                                             .padding(.bottom, 1)
                                                            .font(.system(size: 15))
                    }
                                  TextField("Dirección", text: $address)
                                                             .padding()
                                                             .background(lightGreyColor)
                                                             .cornerRadius(5.0)
                                                             .padding(.bottom, 1)
                                                            .font(.system(size: 15))
              
                                 
                      VStack {
            Button(action: {self.view2 = "Home"}) {
                      RegisterButtonContent()
                }
                          }
       
            
               }
                                  
          
           }
        }
    var body: some View {
          
        return Group {
            
        if view  == "viewLogin"{
             NavigationView {
          VStack {
         
            UserImage()
            
            TextField("Usuario", text: $username)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
            SecureField("Contraseña", text: $password)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
            
            Button(action: {
                
                checkDetails(username :self.username, password :self.password)
                
                if(check)
                {
                self.view = "Home"
                }
                
            }) {
            LoginButtonContent()
            }
            NavigationLink(destination: UserRegister()) {
                        
                                            
                         
                            RegisterButtonContent()
                          }
                          
         
          }.padding()
                 }
            }
            
         if view  == "Home"{
            
            NavigationView {
                
                VStack{
                    
                    
                    HStack {
                                 
                                  Text("Busca un tutor segun el tema")
                                                        .fontWeight(.semibold)
                                                        .padding(.bottom, 15)
                                                         .font(.system(size: 15))
                                  
                             
                                  
                                 NavigationLink(destination: ViewReservations()) {
                                 
                                                     
                                  
                                     ViewReservationButtonContent()
                                   }
                                  
                                   }
                                  
                       TutorListView()
                                  }
                
                               
                              
                              }
            
                
                
            }
                
  
    }

}
    }


struct WelcomeText: View {
    
    var body: some View {
          
          VStack {
          return Text("TutorApp")
              .font(.largeTitle)
              .fontWeight(.semibold)
              .padding(.bottom, 20)
          }
      }
}


struct UserImage: View {
    
    var body: some View {
          
          VStack {
          return Image("userImage")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 250, height: 150)
          .clipped()
          .padding(.bottom, 75)

          }
      }
}


struct ViewReservationButtonContent: View {
    
    var body: some View {
           VStack {
        
                      Text("Ver Reservas")
                          .font(.headline)
                          .foregroundColor(.white)
                          .padding()
                          .frame(width: 140, height: 40)
                          .background(Color.green)
                          .cornerRadius(15.0)
                  }
                  .padding()
      }
}
struct LoginButtonContent: View {
    
    var body: some View {
           VStack {
        
                      Text("Iniciar Sesión")
                          .font(.headline)
                          .foregroundColor(.white)
                          .padding()
                          .frame(width: 220, height: 60)
                          .background(Color.green)
                          .cornerRadius(15.0)
                  }
                  .padding()
      }
}
struct RegisterSubjectButtonContent: View {
    
    var body: some View {
           VStack {
        
                      Text("+")
                          .font(.headline)
                          .foregroundColor(.white)
                          .padding()
                          .frame(width: 40, height: 40)
                          .background(Color.green)
                          .cornerRadius(15.0)
                  }
                  .padding()
      }
}

struct RegisterButtonContent: View {
    
    var body: some View {
           VStack {
        
                      Text("Registrarse")
                          .font(.headline)
                          .foregroundColor(.white)
                          .padding()
                          .frame(width: 220, height: 60)
                          .background(Color.green)
                          .cornerRadius(15.0)
                  }
                  .padding()
      }
}

struct AddSubjectButtonContent: View {
    
    var body: some View {
           VStack {
        
                      Text("Agregar Tema")
                          .font(.headline)
                          .foregroundColor(.white)
                          .padding()
                          .frame(width: 220, height: 60)
                          .background(Color.green)
                          .cornerRadius(15.0)
                  }
                  .padding()
      }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
