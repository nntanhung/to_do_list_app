import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' as easyLoading;

import '../styles/style.dart';
import '../themes/theme.dart';
import '../widgets/commons/common.dart';
import 'logger.dart';

// class DialogUtility {
//   bool isShowing = false;

//   void showLoading(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return const JumpingLoading();
//         });
//     isShowing = true;
//   }

//   void showJumpingLoading({required BuildContext context, String? content}) {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => Dialog(
//               backgroundColor: MyColors.whiteColor,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5.0)),
//               child: SizedBox(
//                   width: 450,
//                   height: 300,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const JumpingLoading(),
//                       const SizedBox(
//                         height: 24.0,
//                       ),
//                       Text(
//                         content ?? '',
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.subtitle2?.copyWith(
//                             color: MyColors.primaryColor, height: 2.0),
//                       )
//                     ],
//                   )),
//             ));
//     isShowing = true;
//   }

//   void hide(BuildContext context) {
//     if (isShowing) {
//       Navigator.pop(context);
//       isShowing = false;
//     }
//   }
// }

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

    // dismiss();
    // if (!_isShow) {
    //   _isShow = true;
    //   final overlay = Overlay.of(context);
    //   _overlayEntry = OverlayEntry(
    //     builder: (context) => Container(
    //       color: Colors.white38,
    //       alignment: Alignment.center,
    //       child: const LoadingIndicator(),
    //     ),
    //   );
    //   if (overlay != null) {
    //     WidgetsBinding.instance!.addPostFrameCallback((_) {
    //       overlay.insert(_overlayEntry!);
    //     });
    //   }
    // }
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
