//
//  ContentView.swift
//  AnimatedBarCharts
//
//  Created by ozy on 17.04.2021.
//

import SwiftUI

enum DayStyle: Int, CaseIterable {
    case weekday
    case afternoon
    case evening
    
    var id: Int { return self.rawValue }
}

struct ContentView: View {
    @State var pickerSelect = DayStyle.weekday
    @State var dataPoints: [[CGFloat]] = [
        [140, 100, 150, 80, 200, 35],
        [20, 130, 90, 40, 180, 190],
        [70, 40, 200, 90, 95, 200]
    ]
    
    var body: some View {
        ZStack {
            Color.intakeGreen.ignoresSafeArea(edges: .all)

            VStack {
                Text("Color Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)

                Picker(selection: $pickerSelect, label: Text(""), content: {
                    Text("Weekday").tag(DayStyle.weekday)
                    Text("Afternoon").tag(DayStyle.afternoon)
                    Text("Evening").tag(DayStyle.evening)
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack(spacing: 20) {
                    BarView(value: dataPoints[pickerSelect.rawValue][0])
                    BarView(value: dataPoints[pickerSelect.rawValue][1])
                    BarView(value: dataPoints[pickerSelect.rawValue][2])
                    BarView(value: dataPoints[pickerSelect.rawValue][3])
                    BarView(value: dataPoints[pickerSelect.rawValue][4])
                    BarView(value: dataPoints[pickerSelect.rawValue][5])
                }.padding(.top, 24)
                .animation(.default)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BarView: View {
    var value: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200).foregroundColor(Color("outBarColor"))
                Capsule().frame(width: 30, height: value).foregroundColor(Color("inBarColor"))
            }
        }
    }
}


extension Color {
    static let intakeGreen: Color = Color("appBackground")
}
