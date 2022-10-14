import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../styles/dimens.dart';
import '../../themes/app_colors.dart';
import '../../widgets/commons/common.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: Dimens.size24),
        child: Column(
          children: [
              Expanded(
            child: SvgPicture.asset(
              ImageAssetPath.union,
              height: Dimens.size180,
              width: Dimens.size187,
            ),
          ),
            TextFieldInput(
              name: 'password',
              hintText: 'password'.tr(),
              isPassword: true,
              validateOnFocusChange: true,
              onChanged: (value) {},
              validator: (value) {
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: Dimens.size16,
            ),
            TextFieldInput(
              name: 'confirm_password',
              hintText: 'confirm_password'.tr(),
              isPassword: true,
              validateOnFocusChange: true,
              onChanged: (value) {
              },
              validator: (value) {
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: Dimens.size16,
            ),
            SingleButton(
              text: tr('change_password').toUpperCase(),
              borderRadius: Dimens.size12,
              backgroundColor: AppColors.appColor,
              onTapped: () {},
            ),
            const SizedBox(
              height: Dimens.size76,
            ),
          ],
        ),
      ),
    );
  }
}
