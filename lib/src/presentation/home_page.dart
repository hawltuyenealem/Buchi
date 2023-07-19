import 'package:buchi/src/presentation/bottom_navigator_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: 'https://media.istockphoto.com/id/985545734/fr/photo/golden-retriever-jouant-dans-la-prairie.jpg?s=2048x2048&w=is&k=20&c=-E5Xe_WcDMTV8S7WR3nqtd1LFhV222-Fab9yxhHSePU=',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 3/5,
              width: double.infinity,
              errorWidget: (context, error, _) => const Center(
                child: Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          //SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Be part of the solution",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color:Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 4,),
                const Text(
                  'Adopt a stray pet to sdecrease the number \n of stray pets on the street for the safety of \n every one'
                ),
                const SizedBox(height: 2,),
                const Text(
                    'Start your journey of finding your companion  \n now using Buchi app'
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, BottomNavigatorPage.routeName);
                  },
                  icon:const Icon(Icons.search,size: 50),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}