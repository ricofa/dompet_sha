import 'package:dompet_sha/blocs/auth/auth_bloc.dart';
import 'package:dompet_sha/blocs/transaction/transaction_bloc.dart';
import 'package:dompet_sha/blocs/user/user_bloc.dart';
import 'package:dompet_sha/models/transfer_form_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/shared/utilities.dart';
import 'package:dompet_sha/ui/pages/transfer/transfer_amount_page.dart';
import 'package:dompet_sha/ui/widgets/latest_transaction_widget.dart';
import 'package:dompet_sha/ui/widgets/menu_services_widget.dart';
import 'package:dompet_sha/ui/widgets/tips_widget.dart';
import 'package:dompet_sha/ui/widgets/user_send_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            profile(context),
            walletCard(),
            levelBar(),
            servicesMenu(),
            latestTransaction(),
            sendAgain(),
            friendlyTips(),
          ],
        ));
  }

  Widget profile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                      state.user.username.toString(),
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: state.user.profilePict == null
                              ? const AssetImage(
                                  'assets/images/img_default_profile.png')
                              : NetworkImage(state.user.profilePict!)
                                  as ImageProvider),
                    ),
                    child: state.user.verified == 1
                        ? Align(
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
                          )
                        : null,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget walletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                  state.user.name.toString(),
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
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
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24),
                )
              ],
            ),
          );
        }
        return Container();
      },
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
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(TransactionGet()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccess) {
                    return Column(
                      children: state.transactions
                          .map((transaction) =>
                              LatestTransactionWidget(transaction: transaction))
                          .toList(),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
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
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecent()),
            child: BlocBuilder<UserBloc, UserState>(
              builder: ((context, state) {
                if (state is UserSuccess) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.users.map((user) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransferAmountPage(
                                  data:
                                      TransferFormModel(sendTo: user.username),
                                ),
                              ),
                            );
                          },
                          child: UserSendWidget(user: user),
                        );
                      }).toList(),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
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
