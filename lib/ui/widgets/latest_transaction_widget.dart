import 'package:dompet_sha/models/transaction_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/shared/utilities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestTransactionWidget extends StatelessWidget {
  final TransactionModel transaction;
  const LatestTransactionWidget({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/ic_withdraw_color.png',
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
                  transaction.transactionType!.name.toString(),
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(transaction.amount ?? 0,
                symbol:
                    transaction.transactionType?.action == 'cr' ? '+ ' : '- '),
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          )
        ],
      ),
    );
  }
}
