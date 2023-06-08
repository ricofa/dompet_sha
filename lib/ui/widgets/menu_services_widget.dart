import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class MenuServicesWidget extends StatelessWidget {
  final String urlIcon;
  final String title;
  final VoidCallback? onTap;
  const MenuServicesWidget(
      {Key? key, required this.urlIcon, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: whiteColor),
          child: Center(
            child: Image.asset(
              urlIcon,
              width: 26,
            ),
          ),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: medium),
        )
      ],
    );
  }
}
