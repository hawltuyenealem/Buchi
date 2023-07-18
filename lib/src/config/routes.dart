

import 'package:buchi/src/presentation/bottom_navigator_page.dart';
import 'package:buchi/src/presentation/home_page.dart';
import 'package:buchi/src/presentation/pets/pets_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {

   MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {

     final args = routeSettings.arguments;

     switch(routeSettings.name){
       case HomePage.routeName:
         return MaterialPageRoute(settings: routeSettings,builder: (_) => const HomePage());
       case BottomNavigatorPage.routeName:
         return MaterialPageRoute(settings: routeSettings,builder: (_) => const BottomNavigatorPage());
       case PetsPage.routeName:
         return MaterialPageRoute(settings: routeSettings,builder: (_)=> const PetsPage());
     }
     return null;
   }
}