import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class TransactionController extends GetxController {
  static TransactionController instance = Get.find();

  Rx<String?> qrData = ''.obs;

  //qr code scanner
  Future<void> scanTheQRCode() async {
    PermissionStatus permission = await Permission.camera.status;
    if (permission.isGranted) {
      String? scannedData = await scanner.scan().then(
        (value) {
          Get.snackbar('QR Scanned', 'QR Scanned Successfully.');
          return null;
        },
      );
      print(scannedData);
    } else {
      var isCameraGranted = await Permission.camera.request();
      if (isCameraGranted.isGranted) {
        qrData.value = await scanner.scan();
        print(qrData);
      }
    }
    //if the qrcode is in your gallery as a photo
    // String? scannedPhotoData = await scanner.scanPhoto();
  }
}
