import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/dialog/dialog_custom.dart';
import '../../../components/text/textlabel.dart';
import '../../../utils/colors.dart';

class MockPageTab2 extends StatefulWidget {
  const MockPageTab2({super.key});

  @override
  State<MockPageTab2> createState() => _MockPageTab2State();
}

class _MockPageTab2State extends State<MockPageTab2> with MyDialog {

  XFile? _mediaFile;
  final ImagePicker picker = ImagePicker();

  void _setImageFile(XFile? value) {
    if (value != null) {
      setState(() {
        _mediaFile = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _mediaFile = null;
                    MyDialog().showImagePickerDialog(
                      context: context,
                      setImageFile: _setImageFile
                    );
                  },
                  child: DottedBorder(
                    color: MyColors.greyLight,
                    radius: const Radius.circular(12.0),
                    strokeWidth: 2,
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.image_search),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextLabel.custom(
                            semanticslabel: 'UploadButton',
                            text: "Upload Image or Camera",
                          ),
                        )
                      ],
                    )
                  ),
                ),
                _mediaFile != null ? Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Semantics(
                    identifier: 'ImageFile',
                    child: Image.file(File('${_mediaFile?.path}'), width: 100)
                  ),
                ) : const SizedBox(),
              ]
            ),
          ),
          Column(
            children: [
              Text(
                'Name: ${_mediaFile?.name ?? ""}'
              ),
              Text(
                'Path: ${_mediaFile?.path ?? ""}'
              ),
            ],
          ),
        ],
      ),
    );
  }
}