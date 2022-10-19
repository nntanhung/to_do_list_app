import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../routers/route_keys.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(ImageAssetPath.todolist),
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {
                AutoRouter.of(context)
                              .pushNamed(RouteKey.logout);
            }, icon: SvgPicture.asset(ImageAssetPath.setting))
      ],
    );
  }
}