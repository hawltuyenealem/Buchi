import 'package:buchi/src/config/routes.dart';
import 'package:buchi/src/injector.dart';
import 'package:buchi/src/presentation/home_page.dart';
import 'package:buchi/src/presentation/pets/bloc/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await serviceLocatorInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PetBloc>(create: (_)=> PetBloc(petUsecase: sl()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
