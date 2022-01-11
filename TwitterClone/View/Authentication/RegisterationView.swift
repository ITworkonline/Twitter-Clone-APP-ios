//
//  RegisterationView.swift
//  TwitterClone
//
//  Created by skidnp on 1/7/22.
//

import SwiftUI

struct RegisterationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage? //uikit
    @State var image: Image? //swiftui
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel

    func loadImage() {
        guard let selectedUIImage = selectedUIImage else {
            return
        }
        image = Image(uiImage: selectedUIImage)
    }
    
    var body: some View{
        ZStack {
        VStack {
            Button(action: {showImagePicker.toggle()}, label: {
                ZStack {
                    if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipped()
                        .cornerRadius(70)
                        .padding(.top, 88)
                        .padding(.bottom,16)
                        
                    } else{
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .padding(.top, 88)
                        .padding(.bottom,16)
                    .foregroundColor(.white)
                    }
                }
            }).sheet(isPresented: $showImagePicker, onDismiss: loadImage,content: {
                ImagePicker(image: $selectedUIImage)
            })
            
            
            VStack(spacing: 20) {
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal,32)
                    .foregroundColor(.white)
                CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal,32)
                    .foregroundColor(.white)
                CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal,32)
                    .foregroundColor(.white)
                CustomSecureField(text: $password, placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .padding(.horizontal,32)
                    .foregroundColor(.white)
                
            }
            
            Button(action: {
                guard let image = selectedUIImage else {
                    return
                }
                viewModel.registerUser(email: email, password: password, username: username, fullname: fullname, profileImage: image)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(width: 360, height: 50)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
            })
            Spacer()
            HStack {
                Text("Already have an account?")
                    .font(.system(size:14))
                Text("Sign In")
                    .font(.system(size: 14, weight: Font.Weight.semibold))
            }
            .foregroundColor(.white)
            .padding(.bottom, 40)
            .onTapGesture {
                mode.wrappedValue.dismiss()
            }
        }
    }
    .background(Color(#colorLiteral(red: 0.1825715601, green: 0.6299551129, blue: 0.9542170167, alpha: 1)))
    .ignoresSafeArea()
    
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}
