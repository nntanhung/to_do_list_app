import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../helpers/helper.dart';
import '../styles/style.dart';
import '../themes/theme.dart';

class TicketCard extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final Color? color;
  const TicketCard({
    super.key,
    this.onTap,
    this.title,
    this.description,
    this.createdAt,
    this.color = AppColors.appColor,
  });
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
          color: color,
          borderRadius: BorderRadius.circular(Dimens.size8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title!,
                    style: theme.headline5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: Dimens.size8,
                ),
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
              description!,
              style: theme.headline6
                  ?.copyWith(height: 1.27, color: AppColors.primaryWhite),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
                tr(
                  'created_at',
                  args: [
                    createdAt?.add(Duration(hours: 7)).toddMMMMyDate() ??
                        DateTime.now().toddMMMMyDate(),
                  ],
                ),
                style: theme.subtitle2),
          ],
        ),
      ),
    );
  }
}
