//
//  MainView.swift
//  Weather
//
//  Created by Денис Сторожев on 13.07.2023.
//

import SwiftUI

struct MainView: View {
    @State private var chooseBackColor : Int = 0
    @State private var chooseView : Int = 0
    @Namespace var namespace
    var body: some View {
        ZStack{
            
         
           
            if chooseView == 0 {
                WeatherView(choose: $chooseView)
                .matchedGeometryEffect(id: "View", in: namespace)
            }
            else if chooseView == 1 {
                ChooseView()
                    
                    .matchedGeometryEffect(id: "View", in: namespace)
            }
            else if chooseView == 2 {
                SettingsView()
                    .matchedGeometryEffect(id: "View", in: namespace)
                    
            }
            else {
                Text("ERORRRRRR")
            }
            
        }.animation(.easeInOut, value: chooseView)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
