import 'package:dompet_sha/blocs/auth/auth_bloc.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/shared/utilities.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/profile_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is AuthInitial) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sign-in', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is AuthSuccess) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 22),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: state.user.profilePict == null
                                    ? const AssetImage(
                                        'assets/images/img_default_profile.png')
                                    : NetworkImage(state.user.profilePict!)
                                        as ImageProvider),
                          ),
                          child: state.user.verified == 1 ? Align(
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
                          ) : null,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          state.user.name.toString(),
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
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              Navigator.pushNamed(context, '/profile-edit');
                            }
                          },
                        ),
                        ProfileMenuWidget(
                          urlIcon: 'assets/icons/ic_pin.png',
                          title: 'My Pin',
                          onTap: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
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
                          onTap: () {
                            context.read<AuthBloc>().add(AuthLogout());
                          },
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
              );
            }
            return Container();
          },
        ));
  }
}
