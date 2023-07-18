
import 'package:buchi/src/data/models/pet_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants.dart';

class PetCard extends StatelessWidget {
  const PetCard({super.key,required this.pet});
  final Pet pet;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Card(
          elevation: 2,
          child: SizedBox(
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 110.h,
                //   width: 130.w,
                //   child: Image.asset(
                //     'assets/images/phone.png',
                //     fit: BoxFit.fill,
                //   ),
                // ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(4)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: pet.photos.first.url!,//'https://media.istockphoto.com/id/985545734/fr/photo/golden-retriever-jouant-dans-la-prairie.jpg?s=2048x2048&w=is&k=20&c=-E5Xe_WcDMTV8S7WR3nqtd1LFhV222-Fab9yxhHSePU=',
                    fit: BoxFit.fill,
                    height: 110,
                    width: 130,
                    errorWidget: (context, value, data) => Image.asset(
                      'assets/images/dog.jpeg',
                      fit: BoxFit.fill,
                      height: 110,
                      width: 130,
                    ),
                    placeholder: (context, value) => Image.asset(
                      'assets/images/dog.jpeg',
                      fit: BoxFit.fill,
                      height: 110,
                      width: 130,
                    ),
                  ),
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.type.name,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 40,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      pet.source,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: kDarkTextColor,
                          fontSize: 15,
                          fontFamily: 'roboto',
                      ),
                    ),
                    Text(
                      pet.age,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: kDarkTextColor,
                          fontSize: 10,
                          fontFamily: 'roboto',
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
