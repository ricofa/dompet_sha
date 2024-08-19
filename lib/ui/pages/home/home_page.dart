import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/shared/utilities.dart';
import 'package:dompet_sha/ui/widgets/latest_transaction_widget.dart';
import 'package:dompet_sha/ui/widgets/menu_services_widget.dart';
import 'package:dompet_sha/ui/widgets/tips_widget.dart';
import 'package:dompet_sha/ui/widgets/user_send_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: whiteColor,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 6,
          elevation: 0,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              elevation: 0,
              selectedItemColor: blueColor,
              unselectedItemColor: blackColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle:
                  blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
              unselectedLabelStyle:
                  blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/ic_overview.png',
                      width: 20,
                      color: blueColor,
                    ),
                    label: 'Overview'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/ic_history.png',
                      width: 20,
                    ),
                    label: 'History'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/ic_statistic.png',
                      width: 20,
                    ),
                    label: 'Statistic'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/ic_reward.png',
                      width: 20,
                    ),
                    label: 'Reward'),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: purpleColor,
          child: Image.asset(
            'assets/icons/ic_add.png',
            width: 24,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            profile(),
            walletCard(),
            levelBar(),
            servicesMenu(),
            latestTransaction(),
            sendAgain(),
            friendlyTips(),
          ],
        ));
  }

  Widget profile() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy,',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Shaynaaaaa',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/img_default_profile.png'))),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget walletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: const DecorationImage(
              image: AssetImage('assets/images/img_card.png'),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hai Shayna',
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '**** **** **** 1234',
            style: whiteTextStyle.copyWith(
                fontSize: 16, fontWeight: medium, letterSpacing: 6),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'Balance',
            style: whiteTextStyle,
          ),
          Text(
            formatCurrency(12500),
            style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
          )
        ],
      ),
    );
  }

  Widget levelBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'level 1',
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
              const Spacer(),
              Text(
                '55%',
                style: greenTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                'of ${formatCurrency(20000)}',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: greyBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget servicesMenu() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuServicesWidget(
                urlIcon: 'assets/icons/ic_topup.png',
                title: 'Top up',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              MenuServicesWidget(
                urlIcon: 'assets/icons/ic_transfer.png',
                title: 'Transfer',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              MenuServicesWidget(
                urlIcon: 'assets/icons/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              MenuServicesWidget(
                urlIcon: 'assets/icons/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const MoreDialog());
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget latestTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                LatestTransactionWidget(
                    urlIcon: 'assets/icons/ic_topup_color.png',
                    title: 'Top Up',
                    time: 'Yesterday',
                    amount: '+ ${formatCurrency(450000, symbol: '')}'),
                LatestTransactionWidget(
                    urlIcon: 'assets/icons/ic_transfer_color.png',
                    title: 'Transfer',
                    time: 'Sep 11',
                    amount: '+ ${formatCurrency(450000, symbol: '')}'),
                LatestTransactionWidget(
                    urlIcon: 'assets/icons/ic_withdraw_color.png',
                    title: 'Top Up',
                    time: 'Yesterday',
                    amount: '+ ${formatCurrency(450000, symbol: '')}'),
                LatestTransactionWidget(
                    urlIcon: 'assets/icons/ic_topup_color.png',
                    title: 'Top Up',
                    time: 'Yesterday',
                    amount: '+ ${formatCurrency(450000, symbol: '')}'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                UserSendWidget(
                    urlImage: 'assets/images/img_friend1.png',
                    userName: 'yuanita'),
                UserSendWidget(
                    urlImage: 'assets/images/img_friend2.png',
                    userName: 'ismail'),
                UserSendWidget(
                    urlImage: 'assets/images/img_friend3.png',
                    userName: 'jamal'),
                UserSendWidget(
                    urlImage: 'assets/images/img_friend4.png',
                    userName: 'meimei'),
                UserSendWidget(
                    urlImage: 'assets/images/img_friend4.png',
                    userName: 'meimei')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget friendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 18,
            children: const [
              TipsWidget(
                urlImage: 'assets/images/img_tips1.png',
                title: 'Coba lakukan tips ini untuk transfer aman',
                urlTips: 'https://www.google.com/',
              ),
              TipsWidget(
                urlImage: 'assets/images/img_tips2.png',
                title: 'Coba lakukan tips ini untuk transfer aman',
                urlTips: 'https://www.google.com/',
              ),
              TipsWidget(
                urlImage: 'assets/images/img_tips3.png',
                title: 'Coba lakukan tips ini untuk transfer aman',
                urlTips: 'https://www.google.com/',
              ),
              TipsWidget(
                urlImage: 'assets/images/img_tips4.png',
                title: 'Coba lakukan tips ini untuk transfer aman',
                urlTips: 'https://www.google.com/',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 326,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: greyBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 29,
              runSpacing: 25,
              children: [
                MenuServicesWidget(
                  urlIcon: 'assets/icons/ic_data.png',
                  title: 'Data',
                  onTap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                MenuServicesWidget(
                  urlIcon: 'assets/icons/ic_water.png',
                  title: 'Water',
                  onTap: () {},
                ),
                MenuServicesWidget(
                  urlIcon: 'assets/icons/ic_stream.png',
                  title: 'Stream',
                  onTap: () {},
                ),
                MenuServicesWidget(
                  urlIcon: 'assets/icons/ic_movie.png',
                  title: 'Movie',
                  onTap: () {},
                ),
                MenuServicesWidget(
                  urlIcon: 'assets/icons/ic_food.png',
                  title: 'Food',
                  onTap: () {},
                ),
                MenuServicesWidget(
                  urlIcon: 'assets/icons/ic_travel.png',
                  title: 'Travel',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
