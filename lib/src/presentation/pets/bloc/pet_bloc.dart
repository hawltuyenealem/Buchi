import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buchi/src/data/models/pet_response_model.dart';
import 'package:buchi/src/domain/usecase/pet_usecase.dart';
import 'package:equatable/equatable.dart';

part 'pet_event.dart';
part 'pet_state.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  final PetUsecase petUsecase;
  PetBloc({required this.petUsecase}) : super(PetInitial()) {
    on<PetEvent>((event, emit) async{
      if(event is GetPets){
        emit(PetLoading());

        var result = await petUsecase.getPets();
        result.fold(
                (message) => emit(PetError(message: message)) ,
                (res) => emit(PetLoaded(petResponse: res))
        );
      }
    });
  }
}
