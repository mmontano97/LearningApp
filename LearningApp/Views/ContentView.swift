//
//  ContentView.swift
//  LearningApp
//
//  Created by michael montano on 2021-03-31.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink(
                            destination:
                                ContentDetailView()
                                    .onAppear(perform: {
                                        model.beginLesson(index)
                                }),
                            label: {
                                ContentViewRow(index: index)
                            })
                       
                }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn\(model.currentModule?.category ?? "")")
        }
        
        
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
