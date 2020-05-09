//
//  ContentView.swift
//  LoginUI
//
//  Created by Al Amin on 9/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0
    @State private var mail = ""
    @State private var pass = ""
    @State private var repass = ""
    @State private var height = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1"),Color("Color2")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            if height > 800 {
                
                    VStack{
                        Logo()
                        IndexView(index: $index)
                        if index == 0 {
                           Login(mail: $mail, pass: $pass)
                            ForgetPassword()
                        }else{
                            SignUp(mail: $mail, pass: $pass, repass: $repass)
                        }
                        OrView()
                        FbGoogleView()
                        
                    }
                .padding()
            }else{
                ScrollView(.vertical, showsIndicators: false) {
                    
                        VStack{
                            Logo()
                            IndexView(index: $index)
                            if index == 0 {
                               Login(mail: $mail, pass: $pass)
                                ForgetPassword()
                            }else{
                                SignUp(mail: $mail, pass: $pass, repass: $repass)
                            }
                            OrView()
                            FbGoogleView()
                            
                        }
                    .padding()
                }
            }
        }
        //.animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Logo: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 200, height: 180)
    }
}

struct IndexView: View {
    @Binding var index: Int
    var body: some View {
        HStack{
            
            Button(action: {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                   self.index = 0
                }
                
            }) {
                Text("Existing")
                    .foregroundColor(self.index == 0 ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50 ) / 2)
                
            }
            .background(self.index == 0 ? Color.white : Color.clear)
            .clipShape(Capsule())
            
            
            Button(action: {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                   self.index = 1
                }
            }) {
                Text("New")
                    .foregroundColor(self.index == 1 ? .black : .white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 50 ) / 2)
                
            }
            .background(self.index == 1 ? Color.white : Color.clear)
            .clipShape(Capsule())
            
        }
            
        .background(Color.black.opacity(0.1))
        .clipShape(Capsule())
        .padding(.top, 25)
    }
}

struct Login: View {
    @Binding var mail: String
    @Binding var pass: String
    var body: some View {
        
        VStack{
            VStack {
                HStack (spacing: 15){
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("Enter Email Address", text: $mail)
                }
                .padding(.vertical, 20)
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    
                    SecureField("Enter Password", text: $pass)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 20)
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
            }
            .background(LinearGradient(gradient: .init(colors: [Color("Color2"),Color("Color1"),Color("Color")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(8)
            .offset( y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }
    }
}

struct SignUp: View {
    @Binding var mail: String
    @Binding var pass: String
    @Binding var repass: String
    var body: some View {
        
        VStack{
            VStack {
                HStack (spacing: 15){
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("Enter Email Address", text: $mail)
                }
                .padding(.vertical, 20)
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    
                    SecureField("Enter Password", text: $pass)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    
                    SecureField("Enter Re Password", text: $repass)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 20)
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
            }
            .background(LinearGradient(gradient: .init(colors: [Color("Color2"),Color("Color1"),Color("Color")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(8)
            .offset( y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }
    }
}

struct ForgetPassword: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Forget Password")
                .foregroundColor(.white)
        }
        .padding(.top, 20)
    }
}

struct OrView: View {
    var body: some View {
        HStack(spacing: 15){
            Color.white.opacity(0.7)
                .frame(width: 35, height: 1)
            
            Text("Or")
                .fontWeight(.bold)
                .foregroundColor(.white)
            Color.white.opacity(0.7)
                .frame(width: 35, height: 1)
        }
        .padding(.top, 10)
    }
}

struct FbGoogleView: View {
    var body: some View {
        HStack {
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("fb")
                    .renderingMode(.original)
                    .padding()
            }
            .background(Color.white)
            .clipShape(Circle())
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("google")
                    .renderingMode(.original)
                    .padding()
            }
            .background(Color.white)
            .clipShape(Circle())
            .padding(.leading, 25)
        }
        .padding(.top, 10)
    }
}
