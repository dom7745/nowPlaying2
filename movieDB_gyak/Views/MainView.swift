//
//  ContentView.swift
//  movieDB_gyak
//
//  Created by David Ferka on 24/11/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var model = MovieDBClient()
    
    var body: some View {
        VStack {
            NavigationStack{
                List(model.npr.results ?? [], id: \.id){ m in
                    NavigationLink{
                        DetailView(m: m)
                    } label: {
                        VStack(alignment: .leading){
                            Text(m.title ?? "")
                                .bold()
                            Text(m.releaseDate ?? "")
                        }
                    }
                    
                }
                .navigationTitle("now playing")
            }
            .task {
                do {
                    let data = try await MovieDBClient().getNowPlayingAsync()
                    self.model.npr = data
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
