import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/constants.dart';

import '../styles/style.dart';
import '../themes/theme.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(Dimens.size16),
      decoration: BoxDecoration(
        color: AppColors.primaryApp,
        borderRadius: BorderRadius.circular(Dimens.size8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('data', style: theme.subtitle1),
              IconButton(onPressed: null, icon: SvgPicture.asset(ImageAssetPath.clockSmallIcon))
            ],
          ),
          Text('data', maxLines: 2, overflow: TextOverflow.ellipsis,),
          Text(tr('created_at')),
        ],
      ),
    );
  }
}
