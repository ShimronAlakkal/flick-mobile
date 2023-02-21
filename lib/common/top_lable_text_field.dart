import 'package:flick/constants/color_palette.dart';
import 'package:flutter/material.dart';

class TopLabelTextField {
  TopLabelTextField();

  Widget topLabelTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required TextInputType keyboardType,
    required bool obscureText,
    required bool requiredField,
    Color? borderColor,
    int? maxLines,
    int? maxLength,
    double? borderRadius,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            // the label above top
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: ColorPalette().secondaryMetalBlack,
              ),
            ),
            requiredField
                ? const Text(' *',
                    style: TextStyle(fontSize: 14, color: Colors.red))
                : const SizedBox(
                    width: 0,
                  ),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: ColorPalette().primaryBlack,
          autocorrect: true,
          autofocus: false,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: borderColor != null
                ? OutlineInputBorder(borderSide: BorderSide(color: borderColor))
                : null,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: borderRadius == null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: ColorPalette().primaryBlack))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: ColorPalette().primaryBlack)),
          ),
        ),
      ],
    );
  }
}
