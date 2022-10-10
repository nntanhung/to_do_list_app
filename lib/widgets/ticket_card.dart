import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

import '../routers/route_keys.dart';
import '../styles/style.dart';
import '../themes/theme.dart';

class TicketCard extends StatelessWidget {
  final Function()? onTap;

  const TicketCard({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimens.size120,
        margin: EdgeInsets.only(bottom: Dimens.size16),
        padding: EdgeInsets.only(
          left: Dimens.size16,
          top: Dimens.size8,
          right: Dimens.size10,
          bottom: Dimens.size5,
        ),
        decoration: BoxDecoration(
          color: AppColors.appColor,
          borderRadius: BorderRadius.circular(Dimens.size8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Design Logo', style: theme.headline5),
                SvgPicture.asset(
                  ImageAssetPath.clockSmallIcon,
                  color: AppColors.primaryWhite,
                ),
              ],
            ),
            const SizedBox(
              height: Dimens.size8,
            ),
            Text(
              'Created ataaadadadad adada dadtop: Dimens.size8, adada bfbdgs 1 Sept 2021 Flutter application using Bloc, Sqflite, and shared preferences. Tasklist is a ToDo List app for Task Management inspired by the design below in the link',
              style: theme.headline6
                  ?.copyWith(height: 1.27, color: AppColors.primaryWhite),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(tr('created_at'), style: theme.subtitle2),
          ],
        ),
      ),
    );
  }
}
