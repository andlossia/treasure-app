import 'package:flutter/material.dart';
import 'package:treasure/view/screens/home_page.dart';
import 'package:treasure/view/widgets/camera_viewer.dart';

import '../../theme/app_theme.dart';
import '../screens/template_game.dart';

class SuccessScan extends StatefulWidget {
  const SuccessScan({super.key});

  @override
  State<SuccessScan> createState() => _SuccessScanState();
}

class _SuccessScanState extends State<SuccessScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Game screen as background
          const TemplateGameScreen(),
          // Avatar image
          Positioned(
            bottom: -100,
            right: 30,
            child: Image.asset(
              'assets/images/avatar.png',
              width: 200,
              height: 500,
            ),
          ),
          // Hello world text
          Positioned(
            left: MediaQuery.of(context).size.width * 0.40,
            top: MediaQuery.of(context).size.height * 0.55,
            child: Center(
              child: Text(
                'חדר נכון!',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: MyAppTheme.buildTheme().hintColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const HomePage(cameraMode: CameraMode.objectFinder)),
              );
            },
            child: Positioned(
              child: Image.asset(
                'assets/icons/play_fill.png',
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
