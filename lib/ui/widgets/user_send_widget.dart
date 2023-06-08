import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class UserSendWidget extends StatelessWidget {
  final String urlImage;
  final String userName;
  const UserSendWidget(
      {Key? key, required this.urlImage, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(urlImage))),
          ),
          Text(
            '@$userName',
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 12),
          )
        ],
      ),
    );
  }
}
