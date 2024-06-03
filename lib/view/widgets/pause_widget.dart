import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:treasure/view/screens/hello_page.dart';

class PauseWidget extends StatefulWidget {
  const PauseWidget({super.key});

  @override
  State<PauseWidget> createState() => _PauseWidgetState();
}

class _PauseWidgetState extends State<PauseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            _buildPauseBoard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset('assets/images/pause_header.png'),
        const Positioned.fill(
          bottom: 25,
          child: Align(
            child: Text(
              'עצור',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPauseBoard(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/pause_board.png'),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildButton('המשך', () {
                  Navigator.pop(context);
                  if (kDebugMode) {
                    print('Continue tapped');
                  }
                }),
                _buildButton('התחל מחדש', () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelloPage(),
                    ),
                  );
                  if (kDebugMode) {
                    print('Restart tapped');
                  }
                }),
                _buildButton('יציאה', () {
                  exit(0);
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String buttonText, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bottom_borad.png',
            width: 120,
            height: 100,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
