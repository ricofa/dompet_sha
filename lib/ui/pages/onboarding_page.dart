import 'package:carousel_slider/carousel_slider.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together'
  ];

  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/images/img_onboarding1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/images/img_onboarding2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/images/img_onboarding3.png',
                  height: 331,
                ),
              ],
              options: (CarouselOptions(
                enableInfiniteScroll: false,
                height: 331,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subtitles[currentIndex],
                    style: greyTextStyle.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  currentIndex == 2 ?
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: purpleColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56))),
                            onPressed: () {
                              carouselController.nextPage();
                            },
                            child: Text(
                              'Continue',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            )),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 24,
                        width: double.infinity,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              // carouselController.nextPage();
                            },
                            child: Text(
                              'Sign In',
                              style: greyTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            )),
                      )
                    ],
                  )
                  : Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: currentIndex == 0
                                ? blueColor
                                : greyBackgroundColor,
                            shape: BoxShape.circle),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: currentIndex == 1
                                ? blueColor
                                : greyBackgroundColor,
                            shape: BoxShape.circle),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: currentIndex == 2
                                ? blueColor
                                : greyBackgroundColor,
                            shape: BoxShape.circle),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: purpleColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56))),
                            onPressed: () {
                              carouselController.nextPage();
                            },
                            child: Text(
                              'Continue',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}