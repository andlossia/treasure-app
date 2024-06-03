import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:treasure/view/widgets/question.dart';

import '../../model/question_model.dart';

class ObjectFinder extends StatefulWidget {
  final CameraController controller;

  const ObjectFinder({super.key, required this.controller});

  @override
  ObjectFinderState createState() => ObjectFinderState();
}

class ObjectFinderState extends State<ObjectFinder> {
  late QRViewController _qrViewController;
  bool _scanned = false;

  @override
  void dispose() {
    _qrViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CameraPreview(widget.controller),
            QRView(
              key: GlobalKey(debugLabel: 'QR'),
              overlayMargin: EdgeInsetsGeometry.infinity,
              formatsAllowed: const [BarcodeFormat.qrcode],
              onQRViewCreated: _onQRViewCreated,
              onPermissionSet: (p0, p1) {
                if (!p1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Camera permission denied'),
                    ),
                  );
                }
              },
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 15,
                borderLength: 10,
                borderWidth: 5,
                cutOutSize: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrViewController = controller;
    _qrViewController.scannedDataStream.listen((scanData) {
      if (!_scanned && scanData.code != null && scanData.code!.isNotEmpty) {
        setState(() {
          _scanned = true;
        });

        Question scannedQuestionModel = Question(
          questionID: 0,
          question: scanData.code!,
          answers: [],
          correctAnswer: 0,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => QuestionWidget(
                    question: scannedQuestionModel,
                  )),
        );
      }
    });
  }
}
