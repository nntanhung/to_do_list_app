import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../helpers/helper.dart';
import '../models/services/service_model.dart';
import '../styles/style.dart';
import '../themes/theme.dart';

class TicketCard extends StatelessWidget {
  final Function()? onTap;
  final TicketResultResponse? ticketListModel;
  const TicketCard({
    super.key,
    this.onTap,
    this.ticketListModel,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    var now = DateTime.now();

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
          color: ticketListModel?.due?.date == now.toyyyyMMddDate()
              ? AppColors.primaryLightRed
              : AppColors.appColor,
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
                    ticketListModel?.content ?? '',
                    style: theme.headline5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: Dimens.size8,
                ),
                ticketListModel?.due?.datetime != null
                    ? SvgPicture.asset(
                        ImageAssetPath.clockSmallIcon,
                        color: AppColors.primaryWhite,
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(
              height: Dimens.size8,
            ),
            Text(
              ticketListModel?.description == ''
                  ? tr('no_additional_text')
                  : ticketListModel?.description ?? '',
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
                    ticketListModel?.createdAt
                            ?.add(Duration(hours: 7))
                            .todMMMyDate() ??
                        ''
                  ],
                ),
                style: theme.subtitle2),
          ],
        ),
      ),
    );
  }
}
