part of 'pet_bloc.dart';

abstract class PetState extends Equatable {
  const PetState();
}

class PetInitial extends PetState {
  @override
  List<Object> get props => [];
}

class PetLoading extends PetState{
  @override
  List<Object> get props => [];
}
class PetLoaded extends PetState{
  final PetResponse petResponse;
  const PetLoaded({required this.petResponse});

  @override
  List<Object> get props => [petResponse];
}
class PetError extends PetState{
  final String message;
  const PetError({required this.message});

  @override
  List<Object> get props => [message];
}