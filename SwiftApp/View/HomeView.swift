//
//  HomeView.swift
//  SwiftApp
//
//  Created by Thiệp Trần Huy on 23/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        CustomView(content: {
            ScrollView(){
                Text("Content")
                Text("Content")
                Text("Content")
            }
        }, title: {
            NavigationUtil.logoIcon(withAction: {})
        }, leadingContent: {
            Text("<-")
        }, trailingContent: {
            NavigationUtil.featureStroke(withAction: {})
        })
    }
}

#Preview {
    HomeView()
}
