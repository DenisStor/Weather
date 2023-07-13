//
//  WeatherView.swift
//  Weather
//
//  Created by Денис Сторожев on 13.07.2023.
//

import SwiftUI



struct WeatherView: View {
    
    @State private var chooseBackColor : Int = 0
    
    @ObservedObject var RefWeather = WeatherKitManager()
    
    
    @Binding var choose : Int
    var body: some View {
        ZStack{
            switch chooseBackColor {
            case 0 :
                
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.77, green: 0.77, blue: 0.77), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.26, green: 0.68, blue: 0.85), location: 0.47),
                        Gradient.Stop(color: Color(red: 0.09, green: 0.09, blue: 0.09), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
                .ignoresSafeArea()
            case 1 :
                Color.white
            default :
                Color.white
                
                
                
                
            }
            ScrollView {
                VStack(alignment: .center,spacing: 20) {
                    HStack{
                        Spacer()
                        Image(systemName: "list.bullet")
                            .font(.system(size: 24,weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                            .onTapGesture {
                                choose = 1
                            }
                    }
                    // MARK: кнопка справа сверху - переход в другое окно (не завершено)
                    VStack(alignment: .center,spacing: 10){
                        Text("Светлогорск")
                            .font(.system(size: 35,weight: .semibold))
                            .foregroundColor(.white)
                        HStack{
                          
                            Text(String(RefWeather.tempNow) + "°")
                                    .font(.system(size: 110,weight: .semibold))
                                    .foregroundColor(.white)
                           
                        }.padding(.leading,10)
                       
                        HStack(spacing: 35){
                            ForEach(0..<3) { index in
                                VStack{
                                    Circle()
                                        .frame(height: UIScreen.main.bounds.width / 8)
                                    Text(timerWeather[index])
                                        .font(.system(size: 20,weight: .semibold))
                                        .foregroundColor(.white)
                                    Text(RefWeather.tempOne)
                                        .font(.system(size: 15,weight: .semibold))
                                        .foregroundColor(.white.opacity(0.7))
                                    
                                }
                                
                            }
                        }.padding(15)
                    }
                 
                    
                    
                    
                    
                }.padding(.horizontal,10)
            }
            
        }.task {
            await RefWeather.getWeather()
        }
    }
}
