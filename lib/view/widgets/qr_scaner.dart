import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:treasure/view/widgets/success_scan.dart';

class QRScanner extends StatelessWidget {
  final CameraController controller;

  const QRScanner({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CameraPreview(controller),
        QRView(
          key: GlobalKey(),
          onQRViewCreated: (controller) =>
              _onQRViewCreated(context, controller),
          overlay: QrScannerOverlayShape(
            borderColor: Colors.green,
            borderRadius: 15,
            borderLength: 10,
            borderWidth: 5,
            cutOutSize: 500,
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(BuildContext context, QRViewController controller) {
    bool scanned =
        false; // Variable to track whether a QR code has been scanned

    controller.scannedDataStream.listen((scanData) {
      if (!scanned && // Check if a QR code has not been scanned yet
          scanData.format == BarcodeFormat.qrcode &&
          scanData.code != null &&
          scanData.code!.isNotEmpty) {
        scanned = true; // Mark that a QR code has been scanned
        controller.dispose(); // Dispose the controller
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessScan(),
          ),
        );
      }
    });
  }
}
