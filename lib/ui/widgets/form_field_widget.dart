import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyboardType;
  final VoidCallback? onToggleVisibility;
  final Function(String)? onFieldSubmitted;
  const FormFieldWidget(
      {Key? key,
      required this.title,
      this.obscureText = false,
      this.controller,
      this.onToggleVisibility,
      this.isShowTitle = true,
      this.keyboardType,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input field
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed:
                        onToggleVisibility, // Memanggil callback untuk toggle
                  )
                : null,
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
