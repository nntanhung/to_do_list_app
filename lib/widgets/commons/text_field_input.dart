import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../styles/style.dart';
import '../../themes/theme.dart';
import '../../utilities/formater_text_input.dart';

class TextFieldInput extends StatefulWidget {
  final String initText;
  final String name;
  final String? labelText;
  final String? errorText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final FormFieldSetter<String>? onSaved;
  final Color? backgroundColor;
  final double borderRadius;
  final bool isPassword;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool isRequired;
  final AutovalidateMode autovalidateMode;
  final int errorMaxLines;
  final bool refreshAfterBuild;
  final bool? removeUnderline;
  final bool hasBorder;
  final String hintText;
  final bool validateOnFocusChange;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool removeDisableHorizontalPadding;
  final TextEditingController? controller;
  final Color colorText;

  /// [name] is required, the placeholder value is just for avoiding mass conflict
  const TextFieldInput({
    Key? key,
    this.name = 'PLEASE_REPLACE',
    this.initText = '',
    this.labelText,
    this.errorText,
    this.onChanged,
    this.validator,
    this.onTap,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.isPassword = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.suffixIcon,
    this.prefix,
    this.isRequired = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.errorMaxLines = 2,
    this.refreshAfterBuild = true,
    this.hintText = '',
    this.removeUnderline = false,
    this.hasBorder = true,
    this.focusNode,
    this.validateOnFocusChange = false,
    this.onFocusChange,
    this.removeDisableHorizontalPadding = false,
    this.controller,
    this.colorText = AppColors.primaryBlack80,
  }) : super(key: key);

  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late TextEditingController controller;
  late FocusNode? focusNode;
  late bool obscureText;

  final _formFieldKey = GlobalKey<FormFieldState>();

  TextTheme get textTheme => Theme.of(context).textTheme;

  InputBorder inputBorder(Color color) {
    if (widget.removeUnderline != null) {
      if (widget.removeUnderline! == true) {
        return InputBorder.none;
      }
    }
    if (widget.hasBorder) {
      return OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ));
    }
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(widget.borderRadius),
      ),
    );
  }

  Widget get passwordIcon => IconButton(
        icon: SvgPicture.asset(
            obscureText ? ImageAssetPath.eyeOffIcon : ImageAssetPath.eyeOnIcon,
            color: AppColors.primaryGrey),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        color: AppColors.primaryGrey,
        iconSize: Constants.iconSize,
        onPressed: () => setState(() => obscureText = !obscureText),
      );

  @override
  void initState() {
    super.initState();
    controller =
        widget.controller ?? TextEditingController(text: widget.initText);
    obscureText = widget.isPassword;
    focusNode = widget.focusNode;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant TextFieldInput oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode?.unfocus();
    focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.refreshAfterBuild) {
      controller.selection = TextSelection.collapsed(offset: 0);
      controller.text = widget.initText;
      controller.selection =
          TextSelection.collapsed(offset: widget.initText.length);
    }
    return Focus(
      onFocusChange: (hasFocus) {
        if (widget.validateOnFocusChange) {
          _formFieldKey.currentState?.validate();
        }
        widget.onFocusChange?.call(hasFocus);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText == null
              ? Container()
              : RichText(
                  text: TextSpan(
                    style: textTheme.bodyText2,
                    children: <TextSpan>[
                      TextSpan(text: widget.labelText ?? ''),
                      TextSpan(
                          text: widget.isRequired ? Constants.redAsterisk : '',
                          style: textTheme.bodyText2
                              ?.copyWith(color: AppColors.red2)),
                    ],
                  ),
                ),
          FormBuilderTextField(
            key: widget.key ?? _formFieldKey,
            focusNode: focusNode,
            name: widget.name,
            autovalidateMode: widget.autovalidateMode,
            style: textTheme.bodyText2?.copyWith(color: widget.colorText),
            controller: controller,
            enabled: widget.enabled,
            obscureText: obscureText,
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            validator: widget.validator,
            onSaved: widget.onSaved,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters != null &&
                    !widget.inputFormatters!.contains(NoLeadingSpaceFormatter)
                ? widget.inputFormatters
                : widget.inputFormatters
              ?..add(NoLeadingSpaceFormatter()),
            cursorColor: AppColors.primaryBlack80,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: widget.removeDisableHorizontalPadding
                    ? EdgeInsets.symmetric(
                        horizontal: Dimens.size16, vertical: Dimens.size0)
                    : null,
                errorText: widget.errorText,
                errorStyle:
                    textTheme.subtitle2?.copyWith(color: AppColors.accentColor),
                errorMaxLines: widget.errorMaxLines,
                filled: widget.backgroundColor != null || !widget.enabled
                    ? true
                    : false,
                fillColor: !widget.enabled
                    ? AppColors.primaryBlack80
                    : widget.backgroundColor,
                suffixIcon:
                    widget.isPassword ? passwordIcon : Padding(
                      padding: const EdgeInsets.only(right: Dimens.size16),
                      child: widget.suffixIcon,
                    ),
                suffixIconColor: widget.colorText,
                suffixIconConstraints: BoxConstraints(
                    minHeight: 16, maxHeight: 32, minWidth: 16, maxWidth: 32),
                border: inputBorder(widget.colorText),
                enabledBorder: inputBorder(widget.colorText),
                focusedBorder: inputBorder(widget.colorText),
                errorBorder: inputBorder(AppColors.red2),
                focusedErrorBorder: inputBorder(AppColors.red2),
                disabledBorder: inputBorder(widget.colorText),
                hoverColor: Colors.transparent,
                counterText: '',
                prefix: widget.prefix,
                hintStyle: textTheme.bodyText2
                    ?.copyWith(color: widget.colorText),
                hintText: widget.hintText),
          ),
        ],
      ),
    );
  }
}
