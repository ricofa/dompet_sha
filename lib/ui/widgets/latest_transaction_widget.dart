import 'package:dompet_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class LatestTransactionWidget extends StatelessWidget {
  final String urlIcon;
  final String title;
  final String time;
  final String amount;
  const LatestTransactionWidget(
      {Key? key,
      required this.urlIcon,
      required this.title,
      required this.time,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            urlIcon,
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  time,
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          )
        ],
      ),
    );
  }
}
