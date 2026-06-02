import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
class FaceService {
  static final FaceDetector detector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),);

  static Future<bool> detectFace(InputImage image) async {
    final faces = await detector.processImage(image);
    return faces.isNotEmpty;
  }
}