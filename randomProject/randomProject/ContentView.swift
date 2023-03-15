//
//  ContentView.swift
//  randomProject
//
//  Created by Julia Vister on 14/03/2023.

//var body: some View ->this part is what creates the UI
//VStack: stands for virtual stack, allows to put multiple things on top of each other
//imageScale: modify image element
//foregroundColor: changes color of image element
// padding : modifier for VStack -> add padding along all 4 sides of the stack
//  Image(systemName: "lasso.and.sparkles")
//.imageScale(.large)
//.foregroundColor(.purple)

import SwiftUI

struct ContentView: View {
    
    @State private var IsToggleOn = true
    @State var name: String = ""
    @State var password: String=""
    
    
    var body: some View {
        VStack{
            Button("Log in")
            {
                /*Text("Log into account")
                    .foregroundColor(Color("AccentColor"))
                    .fontDesign(.serif)
                TextField("Name", text: $name)
                    .padding()
                    .background(Color("AccentColor"))
                SecureField("Password", text: $password)
                    .padding()
                 
                HStack{
                    Button(action: {}, label: {
                        Text("LOGIN")
                            .fontWeight(.bold)
                        Spacer()})
                }
                Spacer() */
            }
            
    
            Image("plants")
                .frame(width: 350.0, height: 500.0)
                .cornerRadius(20)
            
            Text("Lovable Plants")
                .foregroundColor(Color("ToggleColor"))
                .fontDesign(.serif)
                .bold()
                .italic()
                .padding(.top, 6.0)
            
            Toggle(isOn: $IsToggleOn) {
                Text("Reminders")
                    .foregroundColor(Color("AccentColor"))
                Image(systemName: "bolt.heart")
                    .foregroundColor(Color("AccentColor"))
            }
            .toggleStyle(SwitchToggleStyle(tint: Color("ToggleColor")))
            if IsToggleOn{
                Text("Reminders are turned on!")
                    .foregroundColor(Color("ReminderColor"))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
