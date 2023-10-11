//
//  UserSwiftUI.swift
//  theMovieDBViper
//
//  Created by Muhammad Fahmi on 07/10/23.
//

import SwiftUI

struct AboutSwiftUI: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("fahmiProfile", bundle: nil)
                    .resizable()
                    .padding()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(uiColor: .lightGrayCustom), lineWidth: 3))
                    .shadow(radius: 5)
                
                Text("Muh Fahmi Ardiyanto")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                Text("Junior iOS Developer")
                    .font(.body)
                    .foregroundColor(.gray)
                    .foregroundColor(Color.black)
                Text("fahmiardiyannto@yahoo.com")
                    .font(.headline)
                Text("+6281315656535")
                    .font(.headline)
                    .foregroundColor(Color.black)
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
                    .shadow(radius: 2)
                    .frame(height: 220)
                    VStack {
                        Text("Hellow Code Reviewers, I am a junior iOS freelance worker. Before as Junior iOS Dev I am a Web Developer for 3 years experience.")
                            .padding()
                            .foregroundColor(Color.black)
                        
                        Text("If there is any information about jobs related to iOS development, I am interested in applying for the job")
                            .padding()
                            .foregroundColor(Color.black)
                    }
                                
                }
                Spacer()
            
            }
            .padding()
            .navigationBarTitle("User Profile")
        }
    }
}

#Preview {
    AboutSwiftUI()
}
