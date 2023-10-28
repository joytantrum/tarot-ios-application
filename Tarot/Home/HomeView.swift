//
//  HomeView.swift
//  Tarot
//
//  Created by Lindsay Clifford on 11/7/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                       ZStack {
                           Image("galaxy_2")
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: geometry.size.width, height: geometry.size.height)    // the frame of the image is set to the size obtained from the geometry parameter
                           
                           Color.clear.overlay(
                               VStack(alignment: .center, spacing: 10) {
                                   
                                   Image("logo")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .padding(-20)
                                       
                                   Text("Tempest Tarot").font(.custom("Respira-Black", size: 30))
                                       .fontWeight(.semibold)
                                       .foregroundColor(.white)
                                       .multilineTextAlignment(.center)
                                       .padding(.bottom, 10)
                                       
                                   
                                   Text("Precise divination at your fingertips, offering guidance wherever you roam.")
                                       .font(.system(size: 20))
                                       .font(.largeTitle)
                                       .fontWeight(.thin)
                                       .foregroundColor(.white)
                                       .multilineTextAlignment(.center)
                                       .padding(.bottom, 10)
                                   
                                       Spacer()
                               }
                               .frame(maxWidth: .infinity, maxHeight: .infinity)
                           )
                       }
                   }
                   .edgesIgnoringSafeArea(.all)
        }
    }
}
#Preview {
    HomeView()
}
