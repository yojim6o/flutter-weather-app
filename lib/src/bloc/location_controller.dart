
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  final RxBool isServiceEnabled = false.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    isLoading.value = true;

    try {
      bool currentStatus = await Geolocator.isLocationServiceEnabled();
      isServiceEnabled.value = currentStatus;

      Geolocator.getServiceStatusStream().listen((ServiceStatus serviceStatus) {
        isServiceEnabled.value = (serviceStatus == ServiceStatus.enabled);
      });
    } catch (e) {
      debugPrint('LocationController: Error during location status check. $e');
    } finally {
      isLoading.value = false;
    }
  }
}
