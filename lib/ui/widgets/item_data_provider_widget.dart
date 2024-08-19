import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ItemDataProviderWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isSelected;
  const ItemDataProviderWidget({super.key, required this.name, required this.imageUrl, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        border: isSelected ? Border.all( width: 2, color: blueColor) : null
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              Text(
                'Available',
                style: greyTextStyle.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
