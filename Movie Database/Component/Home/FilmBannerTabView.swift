//
//  FilmBannerTabView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct FilmBannerTabView: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    
    let movie: Movie
    
    var genres: [MovieGenre]? = nil
    let index = 1
    
    var body: some View {
        VStack(alignment: .center){
            if self.imageLoader.image != nil {
                ZStack{
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 370,height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay{
                            VStack(alignment:.center, spacing: 15){
                                Text(self.movie.title.uppercased()) //: MOVIE TITLE
                                    .font(.custom("GothamMedium", size: 20))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .frame(width: 300)
                                    .foregroundStyle(Color("ColorText"))
                                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                                
                                HStack {
                                    ForEach(self.genres?.prefix(2) ?? [
                                        MovieGenre(id: 1, name: "DefaultGenre1"),
                                        MovieGenre(id: 2, name: "DefaultGenre2")
                                    ] , id:\.id ){ item in
                                        
                                        Text(item.name)
                                            .font(.custom("Gotham-Bold", size: 10))
                                            .foregroundStyle(Color("ColorIMDB"))
                        
                                        if index == 1 {
                                            Circle()
                                                .frame(width: 5, height: 5)
                                                .foregroundColor(Color("ColorIMDB"))
                                        }
                                    }
                                } //: GENRES
                                
                                    Text("WATCH NOW")
                                        .font(.custom("Gotham-Bold", size: 11))
                                        .foregroundStyle(.white)
                                        .frame(width: 120,height: 35)
                                        .background(.ultraThinMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .shadow(color: .gray, radius: 1, x: 0, y: 0)
                                           
                                
                                

                            }
                            .offset(y: 60)
                        }
                    Rectangle()
                        .foregroundStyle(Color("ColorIMDB"))
                        .frame(width: 35, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay{
                            VStack(alignment: .center,spacing: 3){
                                Image(systemName:"star.fill")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 13))
                                    .fontDesign(.rounded)
                                    .fontWeight(.light)
                                Text(self.movie.voteAverageText)
                                    .foregroundStyle(.black)
                                    .font(.system(size: 15))
                                    .fontDesign(.rounded)
                                    .fontWeight(.semibold)
                            }
                        }
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 12,
                                bottomTrailingRadius: 12,
                                topTrailingRadius: 0
                            )
                        )
                        .shadow(color: .black, radius: 3, x: 0 , y: 2)
                        .offset(x:130,y: -115)
                    
                }
                
            }
            else {
                Rectangle()
                    .frame(width: 370, height: 280)
                    .clipShape(RoundedRectangle(cornerRadius:12))
            }
        }
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }//: TAB VIEW
    }
}

#Preview {
    FilmBannerTabView(movie: Movie.stubbedMovie)
        .background(Color.gray)
}




/*
Rectangle()
//                        .frame(width: 370,height: 50)
    .frame(minWidth: 370, maxWidth: 370, minHeight: 50, idealHeight: 60, maxHeight: 60, alignment: .center)

    .opacity(0.7)
    .offset(y:90)
*/


/*
 VStack(alignment: .center){
     Text(self.movie.title.uppercased())
         .font(.custom("Gotham-Bold", size: 17))
         .multilineTextAlignment(.center)
         .foregroundStyle(.white)
     
     Text("- \(self.movie.yearText) -")
         .multilineTextAlignment(.center)
         .font(.custom("Gotham-Thin", size: 13))
         .foregroundStyle(Color("ColorText"))
     
 }
 .frame(minWidth: 370, maxWidth: 370, minHeight: 50, idealHeight: 60, maxHeight: 60, alignment: .center)
 .background(.ultraThinMaterial)
 .offset(y: 90)
 */
