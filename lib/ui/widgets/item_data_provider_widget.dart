import 'package:dompet_sha/models/operator_card_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ItemDataProviderWidget extends StatelessWidget {
  final OperatorCardModel operatorCardModel;
  final bool isSelected;
  const ItemDataProviderWidget({super.key, required this.operatorCardModel, this.isSelected = false});

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
          Image.network(
            operatorCardModel.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operatorCardModel.name.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              Text(
                operatorCardModel.status.toString(),
                style: greyTextStyle.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
