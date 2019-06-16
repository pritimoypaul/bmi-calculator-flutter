import 'package:flutter/material.dart';

class ChangableContainer extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPressed;
  ChangableContainer({@required this.colour, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
