import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widget/takepicture_screen.dart';
// Note: displaypicture_screen.dart is not used in this file,
// but it is used by takepicture_screen.dart, so this is fine.

Future<void> main() async {
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  // Pass the camera to the MyApp widget.
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  // Add a field to store the camera
  final CameraDescription camera;

  // Update the constructor to accept a camera
  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // Use the camera variable from this class
      home: TakePictureScreen(camera: camera),
      debugShowCheckedModeBanner: false,
    );
  }
}
