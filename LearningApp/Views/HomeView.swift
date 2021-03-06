//
//  ContentView.swift
//  LearningApp
//
//  Created by michael montano on 2021-03-29.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            
                            VStack (spacing: 20){
                                
                                NavigationLink(
                                    destination: ContentView().onAppear(perform: {
                                        model.beginModule(module.id)
                                    }),
                                    label: {
                                        HomeViewRow(image: module.content.image, title:" Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    })
                            
                            
                            HomeViewRow(image: module.test.image, title:"\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            
                            }
                        }
                    }.padding()
                    .accentColor(.black)
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
