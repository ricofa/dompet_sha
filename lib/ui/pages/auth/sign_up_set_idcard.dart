import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/form_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpSetIdCard extends StatefulWidget {
  const SignUpSetIdCard({Key? key}) : super(key: key);

  @override
  State<SignUpSetIdCard> createState() => _SignUpSetIdCardState();
}

class _SignUpSetIdCardState extends State<SignUpSetIdCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/img_logo_black.png'))),
          ),
          Text(
            'Verify Your\nAccount',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: greyBackgroundColor),
                  child: Center(
                    child: Image.asset('assets/icons/ic_upload.png', width: 32),
                  ),
                ),
                // Container(
                //   height: 120,
                //   width: 120,
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           image: AssetImage(
                //               'assets/images/img_default_profile.png'))),
                // ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Passport/ID Card',
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                const SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  title: 'Continue',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomTextButton(
            title: 'Skip for Now',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up-success');
            },
          )
        ],
      ),
    );
  }
}
