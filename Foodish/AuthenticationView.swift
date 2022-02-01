//
//  AuthenticationView.swift
//  Foodish
//
//  Created by Tony on 01/02/2022.
//

import SwiftUI

struct AuthenticationView: View {
    @State var showLogin: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var editingEmailField: Bool = false
    @State var editingPasswordField: Bool = false
    @State var isRevealed: Bool = false
    
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Color(AuthConstant.authBackground)
            VStack(alignment: .leading) {
                
                VStack {
                    ZStack {
                        VStack {
                            Spacer()
                            HStack(spacing: 25) {
                                VStack {
                                    Text("Login")
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .bold()
                                    Color(showLogin ? AuthConstant.underlineColor : AuthConstant.underlineColorInactive)
                                        .frame(width: 135, height: 3)
                                        .cornerRadius(40)
                                        .animation(.easeInOut)
                                }
                                .onTapGesture {
                                    showLogin = true
                                }
                                
                                VStack {
                                    Text("Sign-up")
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .bold()
                                    Color(!showLogin ? AuthConstant.underlineColor : AuthConstant.underlineColorInactive)
                                        .frame(width: 135, height: 3)
                                        .cornerRadius(40)
                                        .animation(.easeInOut)
                                }
                                .onTapGesture {
                                    showLogin = false
                                }
                            }
                        }
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                    }
                    
                    
                }
                .frame(width: screen.width, height: screen.height * 0.4)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                VStack() {
                    VStack(spacing: 40) {
                        VStack(alignment: .leading) {
                            Text("Email address")
                                .font(.system(.body, design: .rounded).bold())
                                .foregroundColor(Color.black.opacity(0.4))
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundColor(Color.black).opacity(0.5)
                                TextField("Your Email", text: $email) {editing in
                                    editingEmailField = editing
                                    editingPasswordField = false
                                    generator.selectionChanged()
                                }
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                                .foregroundColor(Color.black)
                            }
                            .padding(.bottom, 10)
                            Color(editingEmailField ? AuthConstant.underlineColor : AuthConstant.inactiveFieldColor)
                                .frame(height: 1)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Password")
                                .font(.system(.body, design: .rounded).bold())
                                .foregroundColor(Color.black.opacity(0.4))
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(Color.black).opacity(0.5)
                                Group {
                                    if isRevealed {
                                        TextField("Password", text: $password)
                                            .autocapitalization(.none)
                                       
                                    } else {
                                        SecureField("Password", text: $password)
                                    }
                                }
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    editingPasswordField = true
                                    editingEmailField = false
                                    generator.selectionChanged()
                                }
                                Button(action: {
                                    self.isRevealed.toggle()
                                }) {
                                    Image(systemName: self.isRevealed ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(Color.black).opacity(0.5)
                                }
                            }
                            .padding(.bottom, 10)
                            
                            
                            Color(editingPasswordField ? AuthConstant.underlineColor : AuthConstant.inactiveFieldColor)
                                .frame(height: 1)
                            
                        }
                        
                        HStack {
                            Button(action: {}){
                                Text("Forgot passcode?")
                                    .font(.system(.body, design: .rounded).bold())
                                    .foregroundColor(Color(AuthConstant.underlineColor))
                            }
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Get started")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .frame(width: screen.width * 0.8, height: 70)
                        .background(Color(AuthConstant.underlineColor))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    
                }
                .padding(30)
                .padding(.top, 10)
                .frame(height: screen.height * 0.55, alignment: .top)
                
                
            }
            .frame(height: screen.height, alignment: .top)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private struct AuthConstant {
        static let authBackground = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        static let underlineColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        static let underlineColorInactive = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let inactiveFieldColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
