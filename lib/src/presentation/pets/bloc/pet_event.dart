part of 'pet_bloc.dart';

abstract class PetEvent extends Equatable {
  const PetEvent();
}

class GetPets extends PetEvent{
  @override
  List<Object> get props => [];
}