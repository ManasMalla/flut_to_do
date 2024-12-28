/**
 * Copyrighted. Manas Malla 2024©
 * A simple splash screen to match the Ui in Figma,
 * demonstration the use of rows, columns and stacks.
 */

import 'package:flut_to_do/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FlutToDo",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontFamily: "Monothoers",
                    fontSize: 86,
                    color: navyBlueColor,
                    height: 0.75,
                  ),
                ),
                Text("A simple TODO app built with Flutter"),
              ],
            ),
          ),
          Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -380,
                left: 40,
                child: Opacity(opacity: 1, child: PlaceholderToDoElement()),
              ),
              Positioned(
                top: -200,
                left: 40,
                child: Opacity(opacity: 0.8, child: PlaceholderToDoElement()),
              ),
              Positioned(
                top: -290,
                left: 40,
                child: Opacity(opacity: 0.6, child: PlaceholderToDoElement()),
              ),
              Positioned(
                top: -110,
                left: 40,
                child: Opacity(opacity: 0.4, child: PlaceholderToDoElement()),
              ),
              Positioned(
                top: -20,
                left: 40,
                child: Opacity(opacity: 0.2, child: PlaceholderToDoElement()),
              ),
              Container(
                height: 200,
                width: double.infinity,
                color: Color(0xFFFFEAC4),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: ClipOval(
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0x70D9D9D9),
                      backgroundBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -160,
                left: 20,
                child: Image.asset(
                  'assets/images/dash-search.png',
                  height: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceholderToDoElement extends StatelessWidget {
  const PlaceholderToDoElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            shape: BoxShape.circle,
          ),
          width: 40,
          height: 40,
        ),
        SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
              width: 240,
              height: 32,
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
              width: 130,
              height: 32,
            ),
          ],
        ),
      ],
    );
  }
}
