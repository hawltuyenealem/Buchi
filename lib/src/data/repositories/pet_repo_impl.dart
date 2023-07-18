import 'package:buchi/src/core/network_info.dart';
import 'package:buchi/src/data/datasources/pet_datasource.dart';
import 'package:buchi/src/data/models/pet_response_model.dart';
import 'package:buchi/src/domain/repository/pet_repo.dart';
import 'package:dartz/dartz.dart';

class PetRepoImpl implements PetRepo {
  final PetDataSource petDataSource;
  final NetworkInfo networkInfo;

  PetRepoImpl(this.petDataSource, this.networkInfo);


  @override
  Future<Either<String, PetResponse>> getPets() async {
    if (await networkInfo.isConnected) {
      var res = await petDataSource.getPets();
      return Right(res);
    } else {
      return const Left("Please check your connection!");
    }
  }
}