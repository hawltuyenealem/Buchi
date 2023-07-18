import 'package:buchi/src/data/models/pet_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class PetRepo {
  Future<Either<String, PetResponse>> getPets();
}