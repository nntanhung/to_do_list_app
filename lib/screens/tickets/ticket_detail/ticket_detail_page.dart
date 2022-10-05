import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../styles/dimens.dart';
import '../../../extensions/string_extension.dart';
import '../../../helpers/colors_helper.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/widget.dart';

class TicketDetailScreen extends StatefulWidget {
  const TicketDetailScreen({Key? key}) : super(key: key);

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: Dimens.size8),
            padding: const EdgeInsets.all(Dimens.size16),
            color: AppColors.backgroundColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              ],
            ),
          ),
          const SizedBox(height: Dimens.size8),
          
        ],
      ),
    );
  }
}


