import 'package:buchi/src/presentation/pets/bloc/pet_bloc.dart';
import 'package:buchi/src/presentation/pets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants.dart';

class PetsPage extends StatelessWidget {
  static const routeName = "/pets_page";

  const PetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kFadedBackgroundColor,
        appBar: AppBar(
            backgroundColor: kBaseColor,
            automaticallyImplyLeading: false,
            title: Text(
              "Pets",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 24, color: kDarkTextColor, fontFamily: 'roboto'),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kDarkTextColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child:Icon(Icons.menu),
              ),
              // IconButton(onPressed: (() {}), icon: Icon(Icons.notifications))
            ]),
        body: BlocConsumer<PetBloc, PetState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is PetLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is PetLoaded){
              return Container(
                  padding: const EdgeInsets.only(left: 10, right: 5, top: 28),
                  child: ListView.builder(
                    itemCount: state.petResponse.pets.length,
                    itemBuilder: ((context, index) {
                      return PetCard(pet: state.petResponse.pets.elementAt(index),);
                    }),
                  )
              );
            }
            else if (state is PetError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
            },
        ));
  }
}
