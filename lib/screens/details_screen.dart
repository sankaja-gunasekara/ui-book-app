import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_book_app/widgets/book_rating.dart';
import 'package:ui_book_app/widgets/rounded_button.dart';

import '../constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * .4,
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: BookInfo(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * .4 - 15, left: 24, right: 24),
                  child: Column(
                    children: [
                      ChapterCard(
                        chapterNumber: 1,
                        name: 'Money',
                        tag: 'Life is about change',
                      ),
                      ChapterCard(
                        chapterNumber: 2,
                        name: 'Power',
                        tag: 'Everything loves power',
                      ),
                      ChapterCard(
                        chapterNumber: 3,
                        name: 'Influence',
                        tag: 'Influence easily like never before',
                      ),
                      ChapterCard(
                        chapterNumber: 4,
                        name: 'Win',
                        tag: 'Winning is what matters',
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 24, left: 24, right: 24),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'You might also ',
                        ),
                        TextSpan(
                          text: 'like...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      children: [
                        // Container(
                        //   width: double.infinity,
                        //   height: 180,
                        // ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 160,
                            width: double.infinity,
                            padding:
                                EdgeInsets.only(left: 24, top: 24, right: 150),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF8F9),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  maxLines: 3,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            "How To Win Friends & Influence \n",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: kBlackColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Gary Venchuk",
                                        style:
                                            TextStyle(color: kLightBlackColor),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BookRating(score: 4.9),
                                    SizedBox(width: 24),
                                    Expanded(
                                      child: RoundedButton(
                                        text: 'Read',
                                        verticalPadding: 8,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Image.asset(
                              'assets/images/book-3.png',
                              width: 150,
                              fit: BoxFit.fitWidth,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 50)
                  //Stack()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final int chapterNumber;
  final String name;
  final String tag;
  final Function tap;
  const ChapterCard({
    Key key,
    this.chapterNumber,
    this.name,
    this.tag,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(bottom: 16),
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Chapter $chapterNumber : $name\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: tag,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 14,
                    color: kLightBlackColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.navigate_next_rounded,
                size: 24,
                color: kLightBlackColor,
              ),
              onPressed: tap)
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Text('Crushing & Influence',
                  //maxLines: 2,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold, color: kBlackColor)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        '\nWhen the earth was flat and everyone wanted to win the game of the best and people and winning with an A game with all the things you have.',
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: kLightBlackColor, fontSize: 12),
                      ),
                      RoundedButton(
                        text: 'Read',
                        verticalPadding: 10,
                      )
                    ],
                  )),
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.favorite_border_rounded),
                          onPressed: () {}),
                      BookRating(score: 4.9),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Image.asset(
            'assets/images/book-1.png',
            height: 200,
          ),
        ),
      ],
    );
  }
}
