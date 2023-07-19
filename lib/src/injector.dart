

import 'package:buchi/src/core/network_info.dart';
import 'package:buchi/src/data/datasources/pet_datasource.dart';
import 'package:buchi/src/data/repositories/pet_repo_impl.dart';
import 'package:buchi/src/domain/repository/pet_repo.dart';
import 'package:buchi/src/domain/usecase/pet_usecase.dart';
import 'package:buchi/src/presentation/pets/bloc/pet_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> serviceLocatorInit() async {

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());


  /// DATASOURCES
  sl.registerLazySingleton<PetDataSource>(() =>PetDataSource());

   /// USECASE
  sl.registerFactory(() => PetUsecase(petRepo: sl()));

  ///REPOSITORIES
  sl.registerLazySingleton<PetRepo>(() =>PetRepoImpl(petDataSource: sl()));

  ///BLOC
  sl.registerLazySingleton<PetBloc>(() =>PetBloc(petUsecase: sl()));


}