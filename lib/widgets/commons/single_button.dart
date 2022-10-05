import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../styles/style.dart';
import '../../themes/theme.dart';

class SingleButton extends StatelessWidget {
  const SingleButton({
    Key? key,
    this.text,
    this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.borderColor,
    this.borderRadius = Dimens.borderRadius,
    this.onTapped,
    this.tag,
    this.padding = Dimens.paddingAll,
    this.expanded = true,
    this.enable = true,
    this.selected = true,
    this.textStyle,
    this.maxHeight = Dimens.controlHeight,
    this.minWidth = Dimens.controlWidth,
  }) : super(key: key);

  final String? text;
  final Color? backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final double borderRadius;
  final VoidCallback? onTapped;
  final String? tag;
  final EdgeInsetsGeometry padding;
  final bool expanded;
  final bool enable;
  final bool selected;
  final TextStyle? textStyle;
  final double? maxHeight;
  final double? minWidth;

  BorderSide get _borderSide => BorderSide(
        style: (borderColor != null && !selected) ? BorderStyle.solid : BorderStyle.none,
        color: borderColor ?? Colors.transparent,
      );

  Color _backgroundColor(BuildContext context) {
    if (!_enableButton) return AppColors.appColor;
    final bgColor = backgroundColor ?? Theme.of(context).primaryColor;
    return selected ? bgColor : Colors.white;
  }

  Color get _textColor => selected ? foregroundColor : AppColors.primaryBlack;

  bool get _enableButton => onTapped != null && enable;

  @override
  Widget build(BuildContext context) {
    final _child = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth ?? Dimens.controlWidth,
        minHeight: maxHeight ?? Dimens.controlHeight,
        maxWidth: double.infinity,
        maxHeight: maxHeight ?? Dimens.controlHeight,
      ),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.center,
        padding: padding,
        decoration: ShapeDecoration(
          color: _backgroundColor(context),
          shape: RoundedRectangleBorder(
            side: _borderSide,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text ?? '',
          overflow: TextOverflow.fade,
          style: textStyle ??
              Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: _textColor),
        ),
      ),
    );


    return GestureDetector(
      onTap: _enableButton
          ? () {
              EasyDebounce.debounce(
                tag ?? const Uuid().v1(),
                const Duration(milliseconds: 350),
                () => onTapped!(),
              );
            }
          : null,
      child: expanded ? _child : IntrinsicWidth(child: _child),
    );
  }
}
