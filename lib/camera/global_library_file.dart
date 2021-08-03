library my.globals;

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

CameraDescription cameraVak = new CameraDescription(
    name: 'name',
    lensDirection: CameraLensDirection.front,
    sensorOrientation: 0);

late FirebaseApp appl;
