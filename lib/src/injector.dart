

import 'package:buchi/src/data/datasources/pet_datasource.dart';
import 'package:buchi/src/data/repositories/pet_repo_impl.dart';
import 'package:buchi/src/domain/repository/pet_repo.dart';
import 'package:buchi/src/domain/usecase/pet_usecase.dart';
import 'package:buchi/src/presentation/pets/bloc/pet_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> serviceLocatorInit() async {

  sl.registerLazySingleton(() => Dio());


  /// DATASOURCES
  sl.registerFactory<PetDataSource>(() =>PetDataSource());

   /// USECASE
  sl.registerLazySingleton<PetUsecase>(() => PetUsecase(petRepo: sl()));

  ///REPOSITORIES
  sl.registerLazySingleton<PetRepo>(() =>PetRepoImpl(sl(),sl()));

  ///BLOC
  sl.registerLazySingleton<PetBloc>(() =>PetBloc(petUsecase: sl()));


}