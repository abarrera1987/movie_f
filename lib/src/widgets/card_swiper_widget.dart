import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.5,
        itemHeight: _screenSize.height * 0.4,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(peliculas[index].getPostImg()),
              placeholder: AssetImage('assets/images/no-image.jpg'),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: peliculas.length,
        
      ),
    );
  }
}
