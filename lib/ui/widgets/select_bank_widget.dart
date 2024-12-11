import 'package:dompet_sha/models/payment_method_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class SelectBankWidget extends StatelessWidget {
  final PaymentMethodModel paymentMethodModel;
  final bool isSelected;
  const SelectBankWidget(
      {Key? key, this.isSelected = false, required this.paymentMethodModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
          border:
              Border.all(width: 2, color: isSelected ? blueColor : whiteColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            paymentMethodModel.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethodModel.name.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 mins',
                style: greyTextStyle.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
