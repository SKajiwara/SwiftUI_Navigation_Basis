//
//  ContentView.swift
//  navigationView&Tab
//
//  Created by Shinnosuke Kajiwara on 6/10/20.
//  Copyright © 2020 Shinnosuke Kajiwara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = true
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
            Text("断食を始める")
                .navigationBarTitle("スタート", displayMode: .inline)
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
                .navigationBarTitle("学び", displayMode: .inline)
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

