import 'dart:core';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/styles/dimens.dart';
import '../constants.dart';
import '../themes/theme.dart';
import 'customize_date_time_picker.dart' as date;

const paddingBottom = EdgeInsets.only(bottom: 0.0);

enum DatePickerType { dateTime, dateOnly, timeOnly }

class CustomDatePicker extends StatefulWidget {
  @override
  final Key? key;
  final String? title;
  final String? errorDescription;
  final DateFormat? format;
  final DatePickerType pickerType;
  final TextAlign? textAlignment;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool isEditable;
  final DateTime? firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;
  final Locale? locale;
  final AutovalidateMode autovalidateMode;
  final Function(DateTime? value) onChanged;
  final FormFieldValidator<DateTime>? validator;
  final bool isRequired;
  final bool isTitle;
  final Color colorField;
  final bool hasBorder;
  final String hintText;
  final Color? backgoundColor = null;
  final bool enabled = true;
  final bool showIcon;
  final IconData? iconData;
  final int? errorMaxLines;
  final String? errorInvalidText;
  final String? errorFormatText;
  final Color colorText;

  CustomDatePicker({
    this.key,
    required this.firstDate,
    required this.lastDate,
    this.title,
    this.errorDescription,
    required this.onChanged,
    this.format,
    this.textAlignment,
    this.controller,
    this.textInputType,
    this.isEditable = true,
    this.showIcon = true,
    this.errorMaxLines,
    this.initialDate,
    this.locale,
    this.pickerType = DatePickerType.dateOnly,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validator,
    this.isRequired = false,
    this.isTitle = true,
    this.colorField = Colors.green,
    this.iconData,
    this.errorInvalidText,
    this.errorFormatText,
    this.hasBorder = true,
    this.colorText = AppColors.primaryWhite,
    this.hintText = '',
  });

  @override
  State<StatefulWidget> createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  TextTheme get textTheme => Theme.of(context).textTheme;

  InputBorder inputBorder(Color color) {

    if (widget.hasBorder) {
      return OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.size12),
          ));
    }
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(Dimens.size12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateFormat defaultFormat;
    switch (widget.pickerType) {
      case DatePickerType.dateTime:
        defaultFormat = DateFormat(DataFormat.hhMMSS);
        break;
      case DatePickerType.dateOnly:
        // defaultFormat = DateFormat(DataFormat.dMMMMy);
        defaultFormat = DateFormat(DataFormat.ddMMMMy);
        break;
      case DatePickerType.timeOnly:
        defaultFormat = DateFormat(DataFormat.hhMM);
        break;
      default:
        defaultFormat = DateFormat(DataFormat.hhmmddMMyyyy);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.title != null ? Text(widget.title!, style: textTheme.headline4) :const SizedBox(),
            if (widget.isRequired)
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(Constants.redAsterisk,
                    style:
                        textTheme.headline4?.copyWith(color: AppColors.red2)),
              )
          ],
        ),
        DateTimeField(
            key: widget.key,
            maxLines: 1,
            scrollPadding: EdgeInsets.zero,
            onShowPicker: _onShowPicker,
            resetIcon: !widget.showIcon
                ? Icon(Icons.close, color: Colors.transparent)
                : null,
            textAlign: widget.textAlignment ?? TextAlign.start,
            format: widget.format ?? defaultFormat,
            enabled: widget.isEditable,
            initialValue: widget.initialDate,
            autovalidateMode: widget.autovalidateMode,
            validator: widget.validator,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            style: textTheme.bodyText2?.copyWith(color: widget.colorText),
            decoration: InputDecoration(
                //labelText: null,
                //labelStyle: textTheme.headline4,
                //hintStyle: textTheme.bodyText2?.copyWith(
                //    color: AppColors.darkBlue2,
                //    fontStyle: FontStyle.italic),
                contentPadding:
                      EdgeInsets.symmetric(
                        horizontal: Dimens.size16, vertical: Dimens.size16),
                isDense: true,
                errorText: widget.errorDescription,
                errorMaxLines: widget.errorMaxLines,
                errorStyle:
                    textTheme.bodyText2?.copyWith(color: AppColors.accentColor),
                filled: widget.backgoundColor != null || !widget.enabled
                    ? true
                    : false,
                fillColor: !widget.enabled
                    ? AppColors.primaryWhite
                    : widget.backgoundColor,
                border: inputBorder(widget.colorText),
                enabledBorder: inputBorder(widget.colorText),
                focusedBorder: inputBorder(Color(0xFF0265FE)),
                suffixIconConstraints:
                    BoxConstraints(minWidth: 20, maxHeight: 20),
                suffixIcon: widget.showIcon
                    ? Container(
                        width: 20.0,
                        height: 20.0,
                        margin: const EdgeInsets.only(right: Dimens.size16),
                        child: widget.iconData != null
                            ? Icon(widget.iconData)
                            : SvgPicture.asset(
                                ImageAssetPath.calendarIcon,
                                color: AppColors.primaryWhite,
                              ),
                      )
                    : null,
                hintStyle:
                    textTheme.headline6?.copyWith(color: widget.colorField),
                hintText: widget.hintText,
                errorBorder: inputBorder(AppColors.red2),
                focusedErrorBorder: inputBorder(AppColors.red2),
                disabledBorder: inputBorder(AppColors.primaryGrey)),
            onChanged: widget.onChanged),
      ],
    );
  }

  Future<DateTime?> _onShowPicker(
      BuildContext context, DateTime? currentValue) async {
    var lastDate = widget.lastDate;
    currentValue ??= DateTime.now();
    if (lastDate == null) {
      lastDate = currentValue;
    } else {
      if (currentValue.compareTo(lastDate) == 1) {
        currentValue = lastDate;
      }
    }

    switch (widget.pickerType) {
      case DatePickerType.dateTime:
        final datePicked = await date.showDatePicker(
            context: context,
            builder: (context, child) => Localizations.override(
                context: context,
                locale: widget.locale,
                child: Theme(
                    data: ThemeData.light(), child: child ?? Container())),
            firstDate: widget.firstDate ?? DateTime.now(),
            initialDate: currentValue,
            helpText: tr('common_date_help'),
            errorInvalidText:
                widget.errorInvalidText ?? tr('error_validate_format_datetime'),
            errorFormatText:
                widget.errorFormatText ?? tr('error_validate_format_date'),
            fieldHintText: tr('common_date_time_format'),
            lastDate: lastDate);
        if (datePicked != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(datePicked),
          );
          return DateTimeField.combine(datePicked, time);
        }
        return null;
      case DatePickerType.dateOnly:
        return await date.showDatePicker(
            context: context,
            builder: (context, child) => Localizations.override(
                context: context,
                locale: widget.locale,
                child: Theme(
                    data: ThemeData.light(), child: child ?? Container())),
            firstDate: widget.firstDate ?? DateTime.now(),
            initialDate: currentValue,
            helpText: tr('common_date_help'),
            errorInvalidText:
                widget.errorInvalidText ?? tr('error_validate_format_day'),
            errorFormatText:
                widget.errorFormatText ?? tr('error_validate_format_day'),
            fieldHintText: DataFormat.ddMMyyyy,
            lastDate: lastDate);
      case DatePickerType.timeOnly:
        final time = await showTimePicker(
          context: context,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          },
          initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        );
        return time != null
            ? DateTimeField.combine(DateTime.now(), time)
            : null;
      default:
        return null;
    }
  }
}
