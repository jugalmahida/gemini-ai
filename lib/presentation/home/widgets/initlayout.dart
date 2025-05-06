import 'package:flutter/material.dart';

Widget buildInitLayot() {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/gemini_logo.png",
          width: 90,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Ask to gemini",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
