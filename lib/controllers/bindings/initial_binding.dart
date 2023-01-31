import 'package:get/get.dart';
import 'package:vidmo/controllers/auth_controller.dart';
import 'package:vidmo/controllers/firestore_controller.dart';
import 'package:vidmo/controllers/storage_controller.dart';
import 'package:vidmo/controllers/transaction_controller.dart';
import 'package:vidmo/controllers/weather_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
      fenix: true,
    );
    Get.lazyPut<StorageController>(
      () => StorageController(),
      fenix: true,
    );
    Get.lazyPut<FirestoreController>(
      () => FirestoreController(),
      fenix: true,
    );
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
      fenix: true,
    );
    Get.lazyPut<WeatherController>(
      () => WeatherController(),
      fenix: true,
    );
  }
}
