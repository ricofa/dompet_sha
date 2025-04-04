import 'package:dompet_sha/models/user_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class RecentUserWidget extends StatelessWidget {
  final UserModel userModel;

  const RecentUserWidget({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: userModel.profilePict == null
                    ? const AssetImage('assets/images/img_default_profile.png')
                    : NetworkImage(userModel.profilePict!) as ImageProvider,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.name.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@${userModel.username}',
                style: greyTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          if (userModel.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: greenColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Verified',
                  style:
                      greenTextStyle.copyWith(fontSize: 11, fontWeight: medium),
                )
              ],
            )
        ],
      ),
    );
  }
}
