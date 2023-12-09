import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_color.dart';

class NameField extends StatelessWidget {
  final String? title;
  final String? hintTxt;
  final double? height;
  final double? width;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool expands;

  const NameField(
      {Key? key,
      this.height,
      this.minLines,
      this.maxLines,
      this.title,
      this.contentPadding,
      this.keyboardType,
      this.maxLength,
      this.controller,
      this.width,
      this.validator,
      this.hintTxt,
      this.onTap,
      this.expands = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: height,
            child: TextFormField(
              onTap: onTap,
              controller: controller,
              minLines: minLines ?? 1,
              maxLines: maxLines ?? 1,
              // cursorHeight: 20,
              //cursorColor: AppColor.primary,
              maxLength: maxLength,
              keyboardType: keyboardType ?? TextInputType.text,
              validator: validator,
              //textInputAction: TextInputAction.newline,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 1,),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey)),
                  hintText: hintTxt,
                  //isDense: true,
                  contentPadding:
                      contentPadding ?? EdgeInsets.symmetric(horizontal: 10),
                  counterText: ''),
              expands: expands,
            ),
          ),
        ),
      ],
    );
  }
}
