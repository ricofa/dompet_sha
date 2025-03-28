import 'package:dompet_sha/models/user_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class UserSendWidget extends StatelessWidget {
  final UserModel user;
  const UserSendWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

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
                  fit: BoxFit.cover,
                  image: user.profilePict == null
                      ? const AssetImage(
                          'assets/images/img_default_profile.png')
                      : NetworkImage(user.profilePict!) as ImageProvider),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '${user.name}',
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
