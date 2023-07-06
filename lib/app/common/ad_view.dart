import 'package:flutter/material.dart';

class AdView extends StatelessWidget {
  const AdView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Container(
        padding: EdgeInsets.all(30),
        color: Colors.transparent,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
