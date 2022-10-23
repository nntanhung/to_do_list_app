import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../styles/dimens.dart';
import '../../themes/theme.dart';
import '../../widgets/commons/common.dart';
import '../../widgets/widget.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Dimens.size40),
        child: AppBarCustom(
          isShowIcon: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset(ImageAssetPath.logout)),
            _textInfor(context, tr('full_name'), tr('nnth'), isBold: true),
            const SizedBox(
              height: Dimens.size16,
            ),
            _textInfor(context, tr('email'), 'nntanhung@gmail.com'),
            const SizedBox(
              height: Dimens.size16,
            ),
            _textInfor(context, tr('password'), '12345678'),
            const SizedBox(
              height: Dimens.size46,
            ),
            SingleButton(
              text: tr('log_out').toUpperCase(),
              borderRadius: Dimens.size12,
              backgroundColor: AppColors.appColor,
              onTapped: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogCustom();
                  },
                );
              },
            ),
            const SizedBox(
              height: Dimens.size76,
            ),
          ],
        ),
      ),
    );
  }

  Row _textInfor(BuildContext context, String title, String infor,
      {bool isBold = false}) {
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.bodyText1!.copyWith(color: AppColors.primaryBlack80),
        ),
        Text(
          infor,
          style: theme.bodyText1!
              .copyWith(fontWeight: isBold ? FontWeight.w600 : FontWeight.w400),
        ),
      ],
    );
  }
}
