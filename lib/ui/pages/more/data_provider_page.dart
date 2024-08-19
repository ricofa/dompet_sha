import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/item_data_provider_widget.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
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
                    '8000 2298 1996',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  Text(
                    'Balance Rp 100.000.000',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const ItemDataProviderWidget(
            name: 'Telkomsel',
            imageUrl: 'assets/images/img_tsel.png',
            isSelected: true,
          ),
          const ItemDataProviderWidget(
              name: 'Indosat', imageUrl: 'assets/images/img_indosat.png'),
          const ItemDataProviderWidget(
              name: 'Singtel ID', imageUrl: 'assets/images/img_singtel.png'),
          const SizedBox(
            height: 135,
          ),
          ButtonWidget(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/data-package');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
