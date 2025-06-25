import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableArrowController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _rotationAnim;
  final DraggableScrollableController _dragController =
      DraggableScrollableController();
  final double minScrollHeight = 0.06;
  final double maxScrollHeight = 0.5;

  DraggableScrollableController get dragController => _dragController;
  Animation<double> get animation => _rotationAnim;
  void Function() get listener => () {
    final newSize = _dragController.size;

    final scrollPosition = ((newSize - minScrollHeight) /
            (maxScrollHeight - minScrollHeight))
        .clamp(0.0, 1.0);

    _animController.animateTo(scrollPosition, duration: Duration.zero);
    return;
  };

  @override
  void onInit() {
    super.onInit();
    // Initialize the animation controller
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Create a custom animation that interpolates between 0 and 0.5
    // based on scroll position
    _rotationAnim = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(_animController);
  }

  // Dispose the controllers to prevent memory leaks
  @override
  void dispose() {
    _animController.dispose();
    dragController.dispose();

    super.dispose();
  }
}
