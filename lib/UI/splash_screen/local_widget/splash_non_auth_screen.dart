import 'package:event_manager/utils/image_const/image_constant.dart';
import 'package:flutter/material.dart';

class SplashNonAuthScreen extends StatelessWidget {
  SplashNonAuthScreen({super.key});
  
  final List<String> titles = [
    "Sign up for a free account",
    "Enter your event details",
    "Split the costs between guests"
  ];

  final List<String> subTitles = [
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.",
    "Integer lobortis lobortis nulla, sit amet porttitor elit pretium nec. Nam varius vehicula metus, tincidunt vehicula orci posuere quis.",
    "Nam vestibulum neque vel ipsum lobortis imperdiet.Aenean rhoncus, turpis vel semper porta, arcu mi sodales est, nec tempor felis orci non mi."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageConstant.splashBackgroundImage))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for(String title in titles)
              Text(title),
            for(String subTitle in subTitles)
              Text(subTitle),
            ElevatedButton(
              onPressed: (){},
              child: Text("Get Started"))
          ],
        ),
      )
    );
  }
}