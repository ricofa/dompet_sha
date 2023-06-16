import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class TopUpSuccessPage extends StatefulWidget {
  const TopUpSuccessPage({Key? key}) : super(key: key);

  @override
  State<TopUpSuccessPage> createState() => _TopUpSuccessPageState();
}

class _TopUpSuccessPageState extends State<TopUpSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Top Up Wallet\nSuccessfully',
              textAlign: TextAlign.center,
              style:
              blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Grow your finance start\ntogether with us',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 50),
            ButtonWidget(
              width: 183,
              title: 'Return To Home',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
