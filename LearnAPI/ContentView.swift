//
//  ContentView.swift
//  LearnAPI
//
//  Created by Saiman Chen on 2022-10-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct StationView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            // background image
            AsyncImage(
                url:
                    URL(string: "https://resources.news.e.abb.com/attachments/published/82941/en-US/3081E72A5C7C/ABB_launches_Terra_360_usecase_refueling_station_station_render_dpi.jpg"),
                
                content: { image in
                    image.resizable().opacity(0.8)
                },
                
                placeholder: {
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.title)
                }).overlay(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color.black.opacity(0.01),
                                Color.black]),
                        startPoint: .center,
                        endPoint: .bottom))
            
            VStack(alignment: .leading) {
                Spacer()
                Text("Title")
                    .font(.largeTitle)
                    .bold()
                Text("... description")
                    .font(.caption)
            }.foregroundColor(.white).padding()
        }
        .frame(width: 350, height: 250)
        .background(.black)
        .cornerRadius(10)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView()
        StationView()
    }
}
