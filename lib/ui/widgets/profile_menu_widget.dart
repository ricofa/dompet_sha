import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String urlIcon;
  final String title;
  final VoidCallback? onTap;
  const ProfileMenuWidget(
      {Key? key, required this.urlIcon, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(
              urlIcon,
              width: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium),
            )
          ],
        ),
      ),
    );
  }
}
