//
//  SearchView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    @State private var searchMovie: String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center,spacing: 0){
                NavigationBarView()
                    .padding(.horizontal,15)
                    .padding(.bottom)
                    .padding(.top, UIApplication
                        .shared
                        .connectedScenes
                        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                        .first { $0.isKeyWindow }?.safeAreaInsets.top)
                    .background(Color("ColorNavigationBar"))
                    .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0,y:5)
                List{
                    SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                        .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    
                    LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                        self.movieSearchState.search(query: self.movieSearchState.query)
                        
                    }
                    if self.movieSearchState.movies != nil {
                        ForEach(self.movieSearchState.movies!) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                    Text(movie.yearText)
                                }
                            }
                        }
                    }
                    
                    
                    Spacer()
                }
                
                .listStyle(.inset)
                .onAppear {
                    self.movieSearchState.startObserve()
                }
                .background(Color("ColorBackground"))
                
            }
            .ignoresSafeArea(.all,edges: .top)
            
            
        }
    }
}

#Preview {
    SearchView()
}
