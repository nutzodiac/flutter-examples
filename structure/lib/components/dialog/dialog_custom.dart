import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/colors.dart';
import '../../utils/log.dart';
import '../../utils/storage.dart';
import '../../utils/theme_app_custom.dart';
import '../button/button_custom.dart';
import '../input/text_form_field.dart';
import '../text/textlabel.dart';

mixin class MyDialog {

  showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: ThemeAppCustom.primaryColor,
          ),
        );
      }
    );
  }

  hideProgressDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  showDialogMenu({
    required BuildContext context,
    required TabController controller
  }) async {
    final int? selectedTab = await showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: Curves.easeInOut.transform(animation.value),
          child: Opacity(
            opacity: animation.value,
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.transparent, width: 1)
                ),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(0.0),
                        icon: Container(alignment: Alignment.centerLeft, child: Icon(Icons.menu, color: Colors.black, semanticLabel: 'PopIconMenu')),
                      ),
                      TextLabel.custom(
                        semanticslabel: 'DialogMenuHeaderProfile',
                        text: 'XXX', textAlign: 
                        TextAlign.left, 
                        fontWeight: FontWeight.bold
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ItemMenu(
                                semanticLabel: 'PopMenuHome',
                                onTapMenu: () {
                                  Navigator.of(context).pop(0);
                                },
                                icon: Icons.home_filled,
                                text: 'Home'
                              ),
                              ItemMenu(
                                semanticLabel: 'PopMenuSearch',
                                onTapMenu: () {
                                  Navigator.of(context).pop(1);
                                },
                                icon: Icons.search,
                                text: 'Search'
                              ),
                              ItemMenu(
                                semanticLabel: 'PopMenuPort',
                                onTapMenu: () {
                                  Navigator.of(context).pop(2);
                                },
                                icon: Icons.wb_cloudy,
                                text: 'Port'
                              ),
                              ItemMenu(
                                semanticLabel: 'PopMenuMore',
                                onTapMenu: () {
                                  Navigator.of(context).pop(3);
                                },
                                icon: Icons.more_outlined,
                                text: 'More'
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: TextLabel.custom(
                                  semanticslabel: 'DialogMenuHeaderAccount',
                                  text: 'ACCOUNT', 
                                  textAlign: TextAlign.left, 
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              ItemMenu(
                                semanticLabel: 'PopMenuProfile',
                                onTapMenu: () => context.go('/'),
                                icon: Icons.account_circle,
                                text: 'Profile'
                              ),
                              ItemMenu(
                                semanticLabel: 'PopMenuSettings',
                                onTapMenu: () => context.go('/settings'),
                                icon: Icons.settings,
                                text: 'Settings'
                              ),
                              Divider(),
                              ItemMenu(
                                semanticLabel: 'PopMenuLogout',
                                onTapMenu: () {
                                  Storage.getInstance().logout;
                                  context.go('/');
                                },
                                icon: Icons.exit_to_app,
                                text: 'Logout'
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextLabel.sizeSS(
                          semanticslabel: 'DialogMenuVersion',
                          text: "Version 0.0.1"
                        )
                      ),
                    ],
                  ),
                ),
              ),
            )
          )
        );
      },
    );
    if (selectedTab != null) {
      controller.animateTo(selectedTab);
      if (context.mounted) {
        context.go('/mock/${controller.index}');
      }
    }
  }
  
  showDialogDefaultMessage({
    required BuildContext context,
  }) => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          side: BorderSide(color: MyColors.greyLightDivider, width: 1),
        ),
        child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextLabel.sizeS(
                  semanticslabel: 'DialogDefaultErrorMessage',
                  text: "An error occurred. Please try again.",
                  textAlign: TextAlign.center,
                  maxline: 1,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.blue,
                    elevation: 0,
                  ),
                  child: TextLabel.sizeSS(
                    semanticslabel: 'DialogDefaultErrorButton',
                    text: "OK",
                    color: MyColors.blueTextDialog,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  Future<void> showDialogMessage({
    required BuildContext context,
    Widget? icon,
    String? title,
    Color? titleColor,
    double? titleSize,
    String? message,
    double? messageSize,
    String? buttonLabel,
    bool? barrierDismissible,
    GestureTapCallback? callback,
    DialogMessageType type = DialogMessageType.INFORMATION,
    String? buttonLabel2,
    GestureTapCallback? callback2,
    final TextEditingController? controller,
  }) async => await showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible ?? false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          side: BorderSide(color: MyColors.greyLightDivider, width: 1),
        ),
        child: Padding(
          padding: type == DialogMessageType.TEXTFIELD ? const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0) : const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: type == DialogMessageType.TEXTFIELD ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: <Widget>[
              icon ?? const SizedBox(),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: message != null ? 5.0 : 10.0),
                child: TextLabel.custom(
                  semanticslabel: 'DialogErrorTitle',
                  text: title ?? "Error",
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? MyColors.black78,
                  fontSize: titleSize ?? 18,
                  textAlign: TextAlign.left,
                ),
              ),
              message != null
              ? Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 15.0),
                child: TextLabel.custom(
                  semanticslabel: 'DialogErrorMessage',
                  text: message,
                  fontSize: messageSize ?? 16,
                  maxline: 2,
                ),
              ) : const SizedBox(),
              type == DialogMessageType.TEXTFIELD
              ? Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: MyTextFormField(
                  semanticslabel: 'TextFieldController',
                  controller: controller, 
                  obscureText: true, 
                  textInputType: TextInputType.name, 
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(' ')]
                ),
              ) : const Divider(
                color: MyColors.greyLightDivider,
                height: 0,
                thickness: 1,
                endIndent: 0,
              ),
              type == DialogMessageType.TEXTFIELD
              ? Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: ButtonCustomNoShadow(
                          semanticslabel: "TextFieldButton",
                          setWidth: 100,
                          label: buttonLabel ?? "OK",
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                            color: ThemeAppCustom.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            callback?.call();
                          },
                          borderColor: MyColors.greyLight,
                        ),
                      ),
                      ButtonCustomNoShadow(
                        semanticslabel: "TextFieldButton2",
                        setWidth: 100,
                        label: buttonLabel2 ?? "",
                        foregroundColor: ThemeAppCustom.primaryColor,
                        backgroundColor: ThemeAppCustom.primaryColor,
                        textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        onPressed: () {
                          callback2?.call();
                        },
                      ),
                    ],
                  ),
                ) : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: type == DialogMessageType.WARNING ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    padding: const EdgeInsets.only(top: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        callback?.call();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.blue,
                        elevation: 0,
                      ),
                      child: TextLabel.custom(
                        semanticslabel: 'InformationButton',
                        text: buttonLabel ?? "OK",
                        fontWeight: FontWeight.bold,
                        color: MyColors.blueTextDialog,
                      ),
                    ),
                  ),
                  type == DialogMessageType.WARNING
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          callback2?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.red,
                          elevation: 0,
                        ),
                        child: TextLabel.custom(
                          semanticslabel: 'WarningButton2', 
                          text: buttonLabel2 ?? "",
                          fontWeight: FontWeight.bold,
                          color: MyColors.red,
                        ),
                      ),
                    )
                  : const SizedBox()
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  showImagePickerDialog({
    required BuildContext context,
    required Function(XFile?) setImageFile
  }) => showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 6,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
                width: MediaQuery.of(context).size.width / 3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: TextLabel.custom(
                  semanticslabel: 'DialogImagePickerTitle',
                  text: "Choose",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.gallery).whenComplete(() {
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    });
                    dynamic fileStat = await FileStat.stat('${imageFile?.path}');
                    if (fileStat.size >= 5 * 1024 * 1024) {
                      if (context.mounted) {
                        MyDialog().showDialogDefaultMessage(context: context);
                      }
                    } else {
                      setImageFile(imageFile);
                    }
                  } catch (e) {
                    Log.d(e);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextLabel.custom(
                    semanticslabel: 'DialogChooseImage',
                    text: "Image",
                    textAlign: TextAlign.center,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                )
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.camera).whenComplete(() {
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    });
                    dynamic fileStat = await FileStat.stat('${imageFile?.path}');
                    if (fileStat.size >= 5 * 1024 * 1024) {
                      if (context.mounted) {
                        MyDialog().showDialogDefaultMessage(context: context);
                      }
                    } else {
                      setImageFile(imageFile);
                    }
                  } catch (e) {
                    Log.d(e);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextLabel.custom(
                    semanticslabel: 'DialogChooseCamera',
                    text: "Camera",
                    textAlign: TextAlign.center,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}

class ItemMenu extends StatelessWidget {
  final String semanticLabel;
  final GestureTapCallback onTapMenu;
  final IconData icon;
  final String text;

  const ItemMenu({
    super.key,
    required this.semanticLabel,
    required this.onTapMenu,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapMenu,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Semantics(
          identifier: semanticLabel,
          child: MergeSemantics(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(icon, color: Colors.black),
                ),
                TextLabel.sizeSS(semanticslabel: semanticLabel, text: text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DialogMessageType {
  INFORMATION, //ตกลง
  WARNING, // ยกเลิกยืนยัน
  TEXTFIELD // pin
}

// // DialogMessageType.INFORMATION
// showDialogMessage(
//   context: context,
//   message: "กรุณากรอกรหัสผ่าน",
// );
// // DialogMessageType.TEXTFIELD
// showDialogMessage(
//   context: context,
//   title: "Please input PIN",
//   buttonLabel: "Cancel",
//   buttonLabel2: "Confirm",
//   type: DialogMessageType.TEXTFIELD
// );
// // DialogMessageType.WARNING
// showDialogMessage(
//   context: context,
//   title: "Confirm cancel order",
//   message: "All orders will be cancelled",
//   buttonLabel: "Cancel",
//   buttonLabel2: "Confirm",
//   type: DialogMessageType.WARNING
// );