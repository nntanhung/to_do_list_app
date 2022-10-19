import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../themes/app_colors.dart';

class LoadingStateWidget extends StatelessWidget {
  final Color color;
  const LoadingStateWidget({
    Key? key,
    this.color = AppColors.appColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(color: color, size: 50),
    );
  }
}
