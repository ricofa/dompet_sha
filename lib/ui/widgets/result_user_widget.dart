import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ResultUserWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;
  final bool isSelected;
  const ResultUserWidget(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.username,
      this.isVerified = false,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      width: 155,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2
        )
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(imageUrl))),
            child: isVerified
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '@$username',
            style: greyTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
