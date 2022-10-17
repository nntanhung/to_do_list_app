import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' as easyLoading;

import '../styles/style.dart';
import '../themes/theme.dart';
import '../widgets/commons/common.dart';
import 'logger.dart';

class EasyLoading {
  EasyLoading._();
  // static OverlayEntry? _overlayEntry;
  static bool isShow = false;

  static void configLoading() {
    easyLoading.EasyLoading.instance
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..userInteractions = false
      ..dismissOnTap = false
      ..maskType = easyLoading.EasyLoadingMaskType.custom
      ..maskColor = AppColors.primaryWhite.withOpacity(0.2)
      ..animationStyle = easyLoading.EasyLoadingAnimationStyle.custom
      ..customAnimation = _CustomAnimation();
  }

  static void show() {
    if (!isShow) {
      easyLoading.EasyLoading.show();
      LoggerUtils.d(easyLoading.EasyLoading.isShow.toString());
      isShow = true;
    }

  }

  static Future<void> dismiss() async {
    if (isShow) {
      await easyLoading.EasyLoading.dismiss();
      isShow = false;
    }
  }
}

class _CustomAnimation extends easyLoading.EasyLoadingAnimation {
  _CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return const SizedBox(
      child: LoadingIndicator(),
      height: Dimens.size100,
      width: Dimens.size100,
    );
  }
}
