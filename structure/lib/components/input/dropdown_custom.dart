import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../module/mock/model/response/mock_response_model.dart';
import '../../utils/colors.dart';
import '../../utils/theme_app_custom.dart';

class DropdownButtonSearch extends StatelessWidget {
  final String semanticslabel;
  final String? hint;
  final dynamic value;
  final List<DropdownMenuItem>? dropdownItems;
  final ValueChanged<dynamic>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;
  final TextEditingController controller;
  final FocusNode? focus;
  final FocusNode? searchFocus;
  final String? page;

  const DropdownButtonSearch({
    super.key,
    required this.semanticslabel,
    this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    required this.controller,
    required this.focus,
    required this.searchFocus,
    this.page
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.pinkDogwood,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: MyColors.pinkLight,
          width: 0
        )
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          alignment: Alignment.center,
          focusNode: focus,
          isDense: false,
          isExpanded: true,
          items: dropdownItems,
          value: value,
          onChanged: onChanged,
          selectedItemBuilder: selectedItemBuilder,
          buttonStyleData: ButtonStyleData(
            height: buttonHeight ?? 50,
            width: buttonWidth ?? MediaQuery.of(context).size.width,
            padding: buttonPadding ?? const EdgeInsets.symmetric(horizontal: 10),
            decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
            elevation: buttonElevation,
          ),
          iconStyleData: IconStyleData(
            icon: icon ?? const Icon(Icons.arrow_drop_down),
            iconSize: iconSize ?? 24,
            iconEnabledColor: iconEnabledColor ?? ThemeAppCustom.primaryColor,
            iconDisabledColor: iconDisabledColor,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            padding: dropdownPadding,
            decoration: dropdownDecoration ?? BoxDecoration(
              color: ThemeAppCustom.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: dropdownElevation ?? 8,
            offset: offset,
            scrollbarTheme: ScrollbarThemeData(
              radius: scrollbarRadius ?? const Radius.circular(40),
              thickness: scrollbarThickness != null
                  ? WidgetStateProperty.all<double>(scrollbarThickness!)
                  : null,
              thumbVisibility: scrollbarAlwaysShow != null
                  ? WidgetStateProperty.all<bool>(scrollbarAlwaysShow!)
                  : null,
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 50,
          ),
          underline: const SizedBox(height: 0),
          dropdownSearchData: DropdownSearchData(
            searchController: controller,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: Semantics(
                identifier: semanticslabel,
                label: semanticslabel,
                child: TextFormField(                  
                  controller: controller,
                  focusNode: searchFocus,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for an item...',
                    hintStyle: const TextStyle(fontSize: 12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              if (page == "province") {
                ProvinceDetail province = item.value as ProvinceDetail;
                return (province.provinceEn.toString().toLowerCase().contains(searchValue.toLowerCase()));
              }
              return (item.value.toString().toLowerCase().contains(searchValue.toLowerCase()));
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              controller.clear();
            }
          },
        ),
      ),
    );
  }
}