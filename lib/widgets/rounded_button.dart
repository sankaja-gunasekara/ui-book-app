import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function tap;
  final double verticalPadding;
  final double fontSize;

  const RoundedButton({
    this.text,
    this.tap,
    this.verticalPadding = 16,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 16),
        padding:
            EdgeInsets.symmetric(horizontal: 30, vertical: verticalPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF666666).withOpacity(.11),
                  blurRadius: 30,
                  offset: Offset(0, 15))
            ]),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
