import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/profile_menu_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Profile',
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/img_default_profile.png'))),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: greenColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'SHaynaaaa',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ProfileMenuWidget(
                    urlIcon: 'assets/icons/ic_profile.png',
                    title: 'Edit Profile',
                    onTap: () async {
                      if(await Navigator.pushNamed(context, '/pin') == true){
                        Navigator.pushNamed(context, '/profile-edit');
                      }
                    },
                  ),
                  ProfileMenuWidget(
                    urlIcon: 'assets/icons/ic_pin.png',
                    title: 'My Pin',
                    onTap: () async {
                      if(await Navigator.pushNamed(context, '/pin') == true){
                        Navigator.pushNamed(context, '/profile-edit-pin');
                      }
                    },
                  ),
                  ProfileMenuWidget(
                    urlIcon: 'assets/icons/ic_setting.png',
                    title: 'Wallet Settings',
                    onTap: () {},
                  ),
                  ProfileMenuWidget(
                    urlIcon: 'assets/icons/ic_myreward.png',
                    title: 'My Rewards',
                    onTap: () {},
                  ),
                  ProfileMenuWidget(
                    urlIcon: 'assets/icons/ic_help.png',
                    title: 'Help Center',
                    onTap: () {},
                  ),
                  ProfileMenuWidget(
                    urlIcon: 'assets/icons/ic_logout.png',
                    title: 'Log Out',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 87,
            ),
            CustomTextButton(
              title: 'Report a Problem',
              onPressed: () {},
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
