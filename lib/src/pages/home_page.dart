import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/src/providers/peliculas_provider.dart';
import 'package:movie/src/widgets/card_swiper_widget.dart';
import 'package:movie/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProviders();
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Peliculas en cines"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(context),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas(context) {
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
            height: _screenSize.height * 0.25,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Populares',
                  style: Theme.of(context).textTheme.subhead)),
          SizedBox(
            height: 5.0,
          ),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguentePagina: peliculasProvider.getPopulares,
                );
              } else {
                return Container(
                  height: _screenSize.height * 0.25,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
