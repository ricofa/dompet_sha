import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/form_field_widget.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormFieldWidget(
                  title: 'Username',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                // input full name
                FormFieldWidget(
                  title: 'Full Name',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                // input email address
                FormFieldWidget(
                  title: 'Email Address',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                // input password
                FormFieldWidget(
                  title: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  title: 'Update',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/profile-success', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
