import 'package:flutter/material.dart';
import 'package:movie/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationsRoutes(){

  return <String, WidgetBuilder>{

    '/': (BuildContext context) => HomePage(),

  };

}