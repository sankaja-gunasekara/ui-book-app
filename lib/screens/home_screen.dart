import 'package:flutter/material.dart';
import 'package:ui_book_app/constants.dart';
import 'package:ui_book_app/widgets/book_rating.dart';
import 'package:ui_book_app/widgets/reading_list_card.dart';
import 'package:ui_book_app/widgets/two_side_rounded_button.dart';

import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_page_bg.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .1),
              //what are you reading
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline4,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'What are your \nreading ',
                      ),
                      TextSpan(
                        text: 'Today?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Reading list
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ReadingListCard(
                      image: 'assets/images/book-1.png',
                      rating: 4.9,
                      title: 'Crushing & Influence',
                      author: 'Gary Venchuk',
                      pressDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()),
                        );
                      },
                    ),
                    ReadingListCard(
                      image: 'assets/images/book-2.png',
                      rating: 4.7,
                      title: 'Top 10 Business Hacks',
                      author: 'Herman Joel',
                    ),
                    SizedBox(width: 24)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Best of the day
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline5,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Best of the ',
                          ),
                          TextSpan(
                              text: 'day',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    bestOfTheDayCard(size, context),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline5,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Continue ',
                          ),
                          TextSpan(
                              text: 'Reading...',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFDD3D3D3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 30, top: 10, bottom: 10, right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Crushing & Influence',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Gary Venchuk',
                                            style: TextStyle(
                                              color: kLightBlackColor,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              'Chapter 6 of 10',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: kLightBlackColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Image.asset(
                                      'assets/images/book-1.png',
                                      width: 55,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // Reading Progress bar
                            Container(
                              height: 7,
                              width: size.width * .6,
                              decoration: BoxDecoration(
                                color: kProgressIndicator,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container bestOfTheDayCard(Size size, BuildContext context) {
    return Container(
      height: 205,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      //color: Colors.black,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 185,
              padding:
                  EdgeInsets.only(top: 24, left: 24, right: size.width * .35),
              decoration: BoxDecoration(
                  color: Color(0xFFEAEAEA).withOpacity(.5),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New York Time Best For 11th March',
                    style: TextStyle(color: kLightBlackColor, fontSize: 10),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'How To Win Friends & Influence',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Gary Venchuk',
                    style: TextStyle(color: kLightBlackColor),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      BookRating(score: 4.9),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        'When the earth was flat and everyone wanted to win the game of the best and people...',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kLightBlackColor,
                          fontSize: 10,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            width: size.width * .35,
            child: Image.asset('assets/images/book-3.png'),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: size.width * .32,
                child: TwoSideRoundedButton(
                  text: 'Read',
                  tap: () {},
                ),
              ))
        ],
      ),
    );
  }
}
