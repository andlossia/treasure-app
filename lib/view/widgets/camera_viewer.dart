import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'qr_scaner.dart';
import 'object_finder.dart';

enum CameraMode {
  qrScanner,
  objectFinder,
}

class CameraViewer extends StatefulWidget {
  final CameraMode cameraMode;

  const CameraViewer({super.key, required this.cameraMode});

  @override
  State<CameraViewer> createState() => _CameraViewerState();
}

class _CameraViewerState extends State<CameraViewer> {
  late bool _isCameraInitialized = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late CameraController controller;
  late bool scanning = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.lastWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    final cameraController = CameraController(
        backCamera, enableAudio: false, ResolutionPreset.ultraHigh);
    await cameraController.initialize();
    _isCameraInitialized = true;
    setState(() {
      controller = cameraController;
    });
  }

  @override
  void dispose() {
    _isCameraInitialized = false;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialized
          ? widget.cameraMode == CameraMode.qrScanner
              ? QRScanner(controller: controller)
              : ObjectFinder(controller: controller)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
