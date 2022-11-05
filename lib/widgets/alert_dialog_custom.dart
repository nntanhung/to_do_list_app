
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../styles/dimens.dart';
import '../themes/theme.dart';
import 'commons/common.dart';

class AlertDialogCustom extends StatelessWidget {
  const AlertDialogCustom({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return AlertDialog(
      actionsPadding: EdgeInsets.only(top: Dimens.size16, bottom: Dimens.size24),
      title: Text(tr('exit_app'),
          style: theme.subtitle1),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SingleButton(
          text: tr('cancel'),
          maxWidth: 100,
          borderRadius: Dimens.size12,
          backgroundColor: AppColors.primaryGrey.withOpacity(0.8),
          onTapped: () {
            AutoRouter.of(context).pop();
          },
        ),
        SingleButton(
          text: tr('yes'),
          maxWidth: 100,
          borderRadius: Dimens.size12,
          backgroundColor: AppColors.primaryLightRed,
          onTapped: () {
            AutoRouter.of(context).popUntilRoot();
          },
        ),
      ],
    );
  }
}
