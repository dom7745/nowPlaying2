//
//  DetailView.swift
//  movieDB_gyak
//
//  Created by David Ferka on 24/11/2023.
//

import SwiftUI

struct DetailView: View {
    var m: Result
    
    var body: some View {
        
        VStack {
            Form {
                Section {
                    Text(m.title ?? "")
                        .font(.title)
                }
                
                Section {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(m.posterPath ?? "")")) { p in
                        p.image?
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                Section {
                    Text(m.overview ?? "")
                } header: {
                    Text("Overview")
                }
            }
        }
        
    }
}

