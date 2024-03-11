//
//  UserView.swift
//  Hydration
//
//  Created by Simar Cheema on 3/11/24.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


struct ProfileView: View {
    @State var sideMenu = false
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                if sideMenu {
                    SideMenuView()
                }
                VStack {
                    HStack(alignment: .center) {
                        ZStack {
                            HStack {
                                Button(action: {
                                    withAnimation(.spring()) {
                                        sideMenu.toggle()
                                    }
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .resizable()
                                        .frame(width: 30, height: 20)
                                        .foregroundColor(.white)
                                }
                                .padding([.leading])
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text("UniWell")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .heavy))
                                Spacer()
                            }
                        }
                    }
                    //Main body of app is here:
                    VStack {
                        UserView()
                        Spacer()
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0, blue: 0.91), Color(red: 1, green: 0, blue: 0.75)]), startPoint: .top, endPoint: .bottom))
                .offset(x: sideMenu ? 250 : 0)
                .onTapGesture {
                    if sideMenu {
                        withAnimation {
                            sideMenu = false
                        }
                    }
                }
            }
            .onAppear {
                sideMenu = false
            }
        }
    }
}

#Preview {
    ProfileView()
}
