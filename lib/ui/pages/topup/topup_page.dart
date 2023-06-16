import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/select_bank_widget.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8000 8000 8888',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Rico FA',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          SelectBankWidget(
              title: 'Bank BCA', imageUrl: 'assets/images/img_bca.png', isSelected: true,),
          SelectBankWidget(
              title: 'Bank BNI', imageUrl: 'assets/images/img_bni.png'),
          SelectBankWidget(
              title: 'Bank Mandiri', imageUrl: 'assets/images/img_mandiri.png'),
          SelectBankWidget(
              title: 'Bank OCBC', imageUrl: 'assets/images/img_ocbc.png'),
          const SizedBox(height: 12,),
          ButtonWidget(title: 'Continue', onPressed: (){
            Navigator.pushNamed(context, '/topup-amount');
          },),
          const SizedBox(height: 57,)
        ],
      ),
    );
  }
}
