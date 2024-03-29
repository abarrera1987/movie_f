// creamos la clase peliculas
import 'package:flutter/painting.dart';

class Peliculas {
  // creamos una lista de items que contrendra la pelicula
  List<Pelicula> items = new List();
  // declaramos un constructor vacio
  Peliculas();
// creamos un constructor para recibir todas las peliculas y lo definimos como una lista dinamica para evitar problemas 
  Peliculas.fromJsonList( List<dynamic> jsonList ){
    // validamos si el jsonList es igual a null para no hacer nada
    if( jsonList == null ) return;
    // si tiene datos hacemos un for in
    for( var item in jsonList){
      // creamos una nueva instancia de pelicula donde le pasamos el item para enviarlo al constructor
      final pelicula = new Pelicula.fromJsonMap(item);
      //esa instancia lo almacinamos en los items de las peliculas 
      items.add(pelicula);

    }

  }

}

// creamos la clase pelicula
class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;
// creamos su constructor 
  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });
// mapeamos los datos que recibimos 
  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  getPostImg() {

    if(posterPath == null){

      return AssetImage('assets/image/no-image.jpg');

    }else {

      return 'https://image.tmdb.org/t/p/w500/$posterPath';

    }
    

  }

}
