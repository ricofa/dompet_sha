import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/form_field_widget.dart';
import 'package:dompet_sha/ui/widgets/package_item_widget.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatefulWidget {
  const DataPackagePage({super.key});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          FormFieldWidget(
            title: '+62',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              PackageItemWidget(amountData: 10, price: 100000),
              PackageItemWidget(
                amountData: 25,
                price: 200000,
                isSelected: true,
              ),
              PackageItemWidget(amountData: 20, price: 150000),
              PackageItemWidget(amountData: 30, price: 300000),
            ],
          ),
          const SizedBox(
            height: 85,
          ),
          ButtonWidget(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/data-success', (route) => false);
              }
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
