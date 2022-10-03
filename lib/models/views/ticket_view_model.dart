import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../themes/app_colors.dart';

class TicketViewModel {
  final String title;
  final IconData? icon;
  final String? imagePath;
  final Color? color;
  final String titleLabel;
  final String? ticketType;
  final DateTime? date;

  TicketViewModel({
    this.title = Constants.emptyString,
    this.icon,
    this.imagePath,
    this.color = AppColors.primaryLightRed,
    this.titleLabel = Constants.emptyString,
    this.ticketType = Constants.emptyString,
    this.date,
  });
}
