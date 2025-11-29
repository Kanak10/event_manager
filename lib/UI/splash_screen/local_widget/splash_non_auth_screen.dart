import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:event_manager/UI/global_widgets/buttons/em_elevalted_button.dart';
import 'package:event_manager/UI/home_screen.dart';
import 'package:event_manager/UI/login_screen/login_screen.dart';
import 'package:event_manager/theams/app_colors.dart';
import 'package:event_manager/utils/image_const/image_constant.dart';
import 'package:flutter/material.dart';

class SplashNonAuthScreen extends StatefulWidget {

  const SplashNonAuthScreen({super.key});

  @override
  State<SplashNonAuthScreen> createState() => _SplashNonAuthScreenState();
}

class _SplashNonAuthScreenState extends State<SplashNonAuthScreen> {
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  int currentIndex = 0;

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    carouselController: carouselSliderController,
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                      currentIndex = index + 1;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(titles[index],
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: textPrimaryColor,
                              fontSize: 24
                            )
                          ),
                          SizedBox(height: 20),
                          Text(subTitles[index],
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: textPrimaryColor,
                              fontSize: 14
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ]);
                      },
                    options: CarouselOptions(
                      aspectRatio: 16/9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    )),
                    DotsIndicator(
                      dotsCount: titles.length,
                      position: currentIndex.toDouble(),
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    EMElevatedButton(
                      minWidth: MediaQuery.of(context).size.width,
                      
                      onPressed: () {
                        if(currentIndex != titles.length) {
                          carouselSliderController.nextPage();
                          setState((){});
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get Started",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: whiteColor),
                          ),
                          Icon(Icons.arrow_forward_rounded, color: whiteColor)
                        ]))
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}