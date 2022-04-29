import 'package:app_1/home/food.page.body.dart';
import 'package:app_1/widgets/big.text.dart';
import 'package:app_1/widgets/small.text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // showing the header 
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 55, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Kyrgystan",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Bishkek",
                            color: Colors.black54,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        //color: Color.fromARGB(255, 33, 229, 243),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // showing the body
          const FoodPageBody(),
        ],
      ),
    );
  }
}
