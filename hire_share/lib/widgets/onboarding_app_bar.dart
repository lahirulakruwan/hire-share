import 'package:flutter/material.dart';

import 'back_button.dart';

class OnBoardingAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const OnBoardingAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading:BackButtonWidget(),
        title:const Text(
          'Drive with HireShare',
        ),
        backgroundColor: Colors.yellow[700],
        titleTextStyle: const TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {},
                 icon: const Icon(
                Icons.help,
                color: Colors.black,
                size: 30.0
                ),
            ),
          )
        ],
      );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}