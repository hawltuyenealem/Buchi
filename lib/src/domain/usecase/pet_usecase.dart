import 'package:buchi/src/data/models/pet_response_model.dart';
import 'package:buchi/src/domain/repository/pet_repo.dart';
import 'package:dartz/dartz.dart';

class PetUsecase {
  final PetRepo petRepo;

  PetUsecase({required this.petRepo});

  Future<Either<String, PetResponse>> getPets() {
    return petRepo.getPets();
  }
}
