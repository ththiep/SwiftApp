//
//  CustomView.swift
//  SwiftApp
//
//  Created by Thiệp Trần Huy on 23/03/2024.
//

import SwiftUI


struct CustomView<Content: View, Leading: View, Trailing: View, Title: View>: View {
    var content: () -> Content
    var title: () -> Title
    var leadingContent: () -> Leading
    var trailingContent: () -> Trailing
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.white)
                VStack{
                    Spacer()
                        .frame(height: geometry.safeAreaInsets.top + 55)
                    HStack {
                        leadingContent()
                        Spacer()
                        title()
                        Spacer()
                        trailingContent()
                    }
                    .padding(.horizontal)
                    .frame(width: geometry.size.width)
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(height: 0.8)
                    content()
                    Spacer()
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}
