import 'package:camera/camera.dart';

class CameraService {
  static CameraController? controller;
  static Future initCamera() async
  {
    final carmeras =await availableCameras();
    controller= CameraController(carmeras.first, ResolutionPreset.medium,);

    await controller!.initialize();
  }
  static Future<XFile?> takePicture() async
  {
    if(controller==null ) return null;
    return await controller!.takePicture();
  }
}