import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/constants.dart';

import '../../../styles/dimens.dart';
import '../../../themes/app_colors.dart';

class TicketDetailScreen extends StatelessWidget {
  final String? ticketId;
  const TicketDetailScreen({Key? key, @PathParam('id') this.ticketId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(ImageAssetPath.backIcon,
              color: AppColors.primaryBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset(ImageAssetPath.clockIcon),
          ),
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset(ImageAssetPath.editIcon),
          ),
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset(ImageAssetPath.trashIcon),
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: AppColors.primaryWhite,
        padding: const EdgeInsets.only(top: Dimens.size12, bottom: Dimens.size16),
        child: Text(
          tr('created_at', args: ['3/10/2022']),
          textAlign: TextAlign.center,
          style: theme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: Dimens.size24, top: Dimens.size16, right: Dimens.size24, ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 'Icon Button jnjgjgj'.toUpperCase(),
                style: theme.headline4,
              ),
              const SizedBox(height: Dimens.size24),
              Text(
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.clockSmallIcon)'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.editIcon),),'
                'IconButton(onPressed: null, icon:  SvgPicture.asset(ImageAssetPath.trashIcon)'
                'If theres a translation key that will always have the same concrete text as another one you can just link to it. To link to another translation key, all you have to do is to prefix its contents with an @: sign followed by the full name of the translation key including the namespace you want to link to.',
                style: theme.headline6,
              ),
              SizedBox(height: h/2),
            ],
          ),
        ),
      ),
    );
  }
}
