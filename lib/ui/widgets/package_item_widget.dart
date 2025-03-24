import 'package:dompet_sha/models/data_plan_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/shared/utilities.dart';
import 'package:flutter/material.dart';

class PackageItemWidget extends StatelessWidget {
  final DataPlanModel dataPlanModel;
  final bool isSelected;
  const PackageItemWidget({super.key, required this.dataPlanModel, this.isSelected = false});

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataPlanModel.name.toString(),
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(dataPlanModel.price ?? 0),
            style: greyTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
