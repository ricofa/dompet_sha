import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/form_field_widget.dart';
import 'package:dompet_sha/ui/widgets/recent_user_widget.dart';
import 'package:dompet_sha/ui/widgets/result_user_widget.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          FormFieldWidget(
            title: 'by username',
            isShowTitle: false,
          ),
          recentUser(),
          resultsUser(),
          const SizedBox(
            height: 274,
          ),
          ButtonWidget(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget recentUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          RecentUserWidget(
              imageUrl: 'assets/images/img_friend1.png',
              name: 'Yuannn',
              username: 'yuamikami',
              isVerified: true),
          RecentUserWidget(
            imageUrl: 'assets/images/img_friend2.png',
            name: 'Rodri',
            username: 'rodrigo',
          ),
          RecentUserWidget(
            imageUrl: 'assets/images/img_friend3.png',
            name: 'Vini',
            username: 'vinijr',
          ),
        ],
      ),
    );
  }

  Widget resultsUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result Users',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              ResultUserWidget(
                  imageUrl: 'assets/images/img_friend1.png',
                  name: 'Yuannn',
                  username: 'yuamikami',
                  isVerified: true),
              ResultUserWidget(
                imageUrl: 'assets/images/img_friend2.png',
                name: 'Rodri',
                username: 'rodrigo',
                isSelected: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
