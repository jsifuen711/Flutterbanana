import 'package:app_1/utils/colors.dart';
import 'package:app_1/widgets/icon.and.text.widget.dart';
import 'package:app_1/widgets/small.text.dart';
import 'package:flutter/material.dart';

import '../widgets/big.text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //bottom line of code is to check scroller/slider is working. remove forward slashes to
        //test in debug console
        //print("Current value is " + _currPageValue.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //remove bottom line of code that is commentd out (//) before deployment along with this comment
      //color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven
                ? const Color(0xFF69c5df)
                : const Color(0xFF9294cc),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/food1.jpg"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 130,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              //color: Colors.yellowAccent,
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Pancake Breakfast"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: 15,
                                )),
                      ),
                      const SizedBox(width: 10),
                      SmallText(text: "4.5"),
                      const SizedBox(width: 10),
                      SmallText(text: "1287"),
                      const SizedBox(width: 10),
                      SmallText(text: "comments"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      IconAndTextWidget(
                          icon: Icons.circle,
                          text: "Normal",
                          iconColor: AppColors.iconColor1),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7Km",
                          iconColor: AppColors.mainColor),
                      IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: AppColors.iconColor2),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
