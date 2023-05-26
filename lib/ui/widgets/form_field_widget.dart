import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  const FormFieldWidget({Key? key, required this.title, this.obscureText = false, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input field
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: medium),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              )),
        ),
      ],
    );
  }
}
