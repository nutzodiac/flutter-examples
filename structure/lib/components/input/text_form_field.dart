import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';
import '../../utils/theme_app_custom.dart';
import '../text/textlabel.dart';

class MyTextFormField extends StatelessWidget {
  final String semanticslabel;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final String? labelHeader;
  final TextStyle? headerStyle;
  final bool? isReqire;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String? value;
  final GestureTapCallback? onTab;
  final bool? enabled;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? errorText;
  final TextAlign? textAlign;
  final bool? readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool setFocus;
  final Function? onTapTextField;
  final BorderRadius? borderRadius;
  final String? counterText;
  final Color? fillColor;
  final FocusNode? setFocusNode;
  final FocusNode? nextFocusNode;
  const MyTextFormField(
      {super.key,
      required this.semanticslabel,
      this.hintText,
      this.hintTextStyle,
      this.labelHeader,
      this.headerStyle,
      this.isReqire,
      this.controller,
      this.textInputType,
      this.obscureText,
      this.value,
      this.onTab,
      this.enabled,
      this.prefixIcon,
      this.textInputAction,
      this.suffixIcon,
      this.onChanged,
      this.errorText,
      this.textAlign,
      this.readOnly,
      this.maxLength,
      this.inputFormatters,
      this.setFocus = false,
      this.onTapTextField,
      this.borderRadius,
      this.counterText,
      this.fillColor,
      this.setFocusNode,
      this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelHeader != null
        ? Container(
            padding: const EdgeInsets.only(left: 5, bottom: 5),
            child: TextLabel.custom(
              semanticslabel: 'HeaderText$semanticslabel',
              text: labelHeader ?? "",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              fontSize: 15
            ),
          )
        : const SizedBox(),
        Semantics(
          identifier: semanticslabel,
          label: semanticslabel,
          child: TextFormField(
            autofocus: setFocus,
            focusNode: setFocusNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            },
            readOnly: readOnly ?? false,
            onChanged: (String text) {
              if (onChanged != null) {
                onChanged!(text);
              }
            },
            onTap: () {
              if (onTapTextField != null) {
                onTapTextField!();
              }
            },
            maxLength: maxLength,
            textInputAction: textInputAction,
            enabled: enabled,
            obscureText: obscureText == null || obscureText == false ? false : true,
            keyboardType: textInputType ?? TextInputType.text,
            controller: controller,
            cursorColor: ThemeAppCustom.primaryColor,
            initialValue: value,
            inputFormatters: inputFormatters ?? <TextInputFormatter>[
              FilteringTextInputFormatter.deny(RegExp(r'(\u0020|[\u00a1-\u00a9]|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
            ],
            textAlign: textAlign ?? TextAlign.start,
            style: TextStyle(
              color: ThemeAppCustom.primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontFamily: "IBMPlexSansThai"
            ),
            decoration: InputDecoration(
              isDense: true,
              errorText: enabled == true || enabled == null ? errorText : null,
              suffixIcon: suffixIcon != null
                ? IconTheme(
                    data: IconThemeData(color: ThemeAppCustom.primaryColor),
                    child: suffixIcon ?? Container())
                : null,
              prefixIcon: prefixIcon != null
                ? IconTheme(
                    data: IconThemeData(color: ThemeAppCustom.primaryColor),
                    child: prefixIcon ?? Container())
                : null,
              hintText: hintText,
              hintStyle: hintTextStyle ?? TextStyle(color: MyColors.silverLight, fontSize: 17, fontWeight: FontWeight.w600, fontFamily: "IBMPlexSansThai"),
              filled: true,
              fillColor: readOnly == true ? MyColors.greyBrightDisable : fillColor ?? Colors.white,
              contentPadding: const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: MyColors.greyLight, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: MyColors.greyLight, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: MyColors.greyBrightDisable, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                borderSide: BorderSide(color: ThemeAppCustom.primaryColor, width: 1.5),
              ),
              counterText: counterText ?? ""
            ),
          ),
        ),
      ],
    );
  }
}


class TextFormatterLasercode extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String formatted = formatString(newValue.text.toUpperCase());
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String formatString(String input) {
    // Remove any non-numeric characters
    String cleanedInput = input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    // Limit input to 12 characters
    if (cleanedInput.length > 12) {
      cleanedInput = cleanedInput.substring(0, 12);
    }

    // Define the format positions and lengths
    List<int> positions = [3, 10];
    List<int> lengths = [3, 7, 2];

    // Check if input length matches the expected total length
    if (cleanedInput.length != positions.last + lengths.last) {
      return cleanedInput; // Return original if lengths don't match
    }

    // Construct the formatted string
    String formattedString = '${cleanedInput.substring(0, positions[0])}-${cleanedInput.substring(positions[0], positions[1])}-${cleanedInput.substring(positions[1], positions[1] + lengths[2])}';

    return formattedString;
  }
}