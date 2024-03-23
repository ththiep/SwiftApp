//
//  NavigationUtil.swift
//  SwiftApp
//
//  Created by Thiệp Trần Huy on 23/03/2024.
//

import SwiftUI

struct NavigationUtil {
    static func userProfile(withAction action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }) {
            VStack(alignment: .center, spacing: 0) {
                Text("icon_arrow_left")
                    .foregroundColor(.black)
                    .frame(width: 27, height: 24)
            }
            .padding(.horizontal, 5.25)
            .padding(.vertical, 7.25)
            .frame(width: 24, height: 24, alignment: .center)
        }
    }
    
    static func logoIcon(withAction action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Image("logo_tw")
                .resizable()
                .frame(width: 24, height: 24)
        })
    }
    
    static func featureStroke(withAction action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Image("feature_stroke_icon")
                .resizable()
                .frame(width: 24, height: 24)
        })
    }
}

