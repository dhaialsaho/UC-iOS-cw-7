//
//  ContentView.swift
//  movie app
//
//  Created by Dhai AlSaho on 21/09/2022.
//

import SwiftUI

struct CastMember: Identifiable {
    let id = UUID()
    
    let name: String
    let imageName: String
    
}

struct MovieInfo: Identifiable {
    let id = UUID()
    
    let title: String
    let imageName: String
    let cast: [CastMember]
}


struct ContentView: View {
    var body: some View {
      let movies = [
            MovieInfo(title: "infinity war", imageName: "marvel", cast: [CastMember(name: "Robert downy junior", imageName: "RDJ")
            ]),
            MovieInfo(title: "me before u", imageName: "mebefore", cast: [
            CastMember(name: "emilia clark", imageName: "emilia")
            ]),
            MovieInfo(title: "orphan", imageName: "orphan",cast: [CastMember(name: "Isabelle Fuhrman", imageName: "isa")])
        ]
        
        
  //      var body: some View{
        NavigationView{
            List {
                ForEach(movies) {movie in
                    NavigationLink(destination: MovieDetail(movie: movie)){
                        movieer(movie:movie)
                    }
                }
                
                }
            .navigationTitle("movies")
        }
        .accentColor(.white)
    }
}
struct MovieDetail: View {
    let movie: MovieInfo
    
    var body: some View {
        ZStack {
            Image(movie.imageName)
                .resizable()
                .ignoresSafeArea()
                .opacity(0.5)
                .blur(radius: 11)
            
            VStack{
                Image(movie.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                    .background(.white)
                    .clipShape(Circle())
                
                Text(movie.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(movie.cast){
                CastMember in
                            VStack{
                                Image(CastMember.imageName)
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                    .clipShape(Circle())
                                Text(CastMember.name)
                                    .foregroundColor(.white)
                            }
                    }
                    }
            }
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct movieer: View {
    let movie: MovieInfo
    
    var body: some View {
        HStack{
            Image(movie.imageName)
                .resizable()
                .frame(width:100, height:100)
                .clipShape(Circle())
            Text(movie.title)
        }
    }
}
}
