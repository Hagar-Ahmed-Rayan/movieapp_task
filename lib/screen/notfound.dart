import 'package:flutter/material.dart';
class NotFoundResultView extends StatelessWidget {
  const NotFoundResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 35,
        ),
        Image(
          image: const AssetImage(
            "assets/images/pic.png",
          ),
          fit: BoxFit.cover,
          height: 250,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Your films is empty",
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Sorry",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
