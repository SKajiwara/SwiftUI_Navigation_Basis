//
//  ContentView.swift
//  navigationView&Tab
//
//  Created by Shinnosuke Kajiwara on 6/10/20.
//  Copyright © 2020 Shinnosuke Kajiwara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State private var selection: String? = nil
    var body: some View {
        
        ZStack {
            TabView {
            StartTabView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("スタート")
                }
            SupportTabView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("サポート")
                }
            HistoryTabView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("分析")
                }
            LearnTabView()
                .tabItem {
                    Image(systemName: "studentdesk")
                    Text("学ぶ")
                }
            }
            if self.show{
                GeometryReader{ geometry in
                    Menu().frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }.background(
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation{
                                self.show.toggle()
                            }
                        }
                )
            }
        }
    }
}
struct StartTabView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {}) {
                        Text("プチ断食を始める").foregroundColor(.white)
                        .frame(width: 160, height: 240).background(AnimationButton())
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    }
                        
                    Button(action: {}) {
                        Text("長期断食を始める").foregroundColor(.white)
                        .frame(width: 160, height: 240).background(AnimationButton())
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    }
                        
                }
                    .padding()
                    .frame(maxHeight: 300)
            }
                .navigationBarTitle("スタート", displayMode: .inline)
                .navigationBarItems(
                    //leading: Image(systemName: ""),
                    trailing: Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                )
        }
    }
}
struct SupportTabView: View {
    var body: some View {
        NavigationView {
            Text("サポートを受ける")
                .navigationBarTitle("サポート", displayMode: .inline)
        }
    }
}
struct HistoryTabView: View {
    var body: some View {
        NavigationView {
            Text("過去の断食・体重の推移")
                .navigationBarTitle("分析", displayMode: .inline)
        }
    }
}
struct LearnTabView: View {
    var body: some View {
        NavigationView {
            Text("断食について学ぶ")
                .navigationBarTitle("学ぶ", displayMode: .inline)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Menu : View {
    var body : some View{
        VStack(alignment: .leading, spacing: 15) {
            
            Button(action: {
                // TODO:
            }) {
                HStack(spacing: 12){
                    Text("ようこそ").font(.system(size: 30)).foregroundColor(.black)
                }.padding(50)
            }
        }.padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct AnimationButton: View {
    let timer = Timer.publish(every: 1, on: .main, in: . default).autoconnect()
    let colors = [
        Color.green,
        Color.green,
        Color.blue,
        Color.purple,
        Color.pink,
        Color.red,
        Color.orange
    ]

    @State private var start = UnitPoint(x: 0, y: -2)
    @State private var end = UnitPoint(x: 4, y: 0)

    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end )
            .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer) { _ in
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.end = UnitPoint(x: 4, y: 0)
            }

    }
}
