import 'package:flutter/material.dart';

import '../widgets/pause_widget.dart';
import '../widgets/progress_bar.dart';

class TemplateGameScreen extends StatefulWidget {
  const TemplateGameScreen({super.key});

  @override
  State<TemplateGameScreen> createState() => _TemplateGameScreenState();
}

class _TemplateGameScreenState extends State<TemplateGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 50,
            child: ProgressBar(),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const PauseWidget();
                  },
                );
              },
              child: Image.asset(
                'assets/icons/pause_fill.png',
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/land.png',
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          Positioned(
            bottom: 25,
            left: 14,
            child: Image.asset(
              'assets/images/open_treasure.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Positioned(
            right: -60,
            bottom: 25,
            child: Image.asset(
              'assets/images/tree.png',
              height: MediaQuery.of(context).size.height * 0.9,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}