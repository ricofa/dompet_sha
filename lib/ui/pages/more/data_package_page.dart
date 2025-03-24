import 'package:dompet_sha/blocs/auth/auth_bloc.dart';
import 'package:dompet_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:dompet_sha/models/data_plan_form_model.dart';
import 'package:dompet_sha/models/data_plan_model.dart';
import 'package:dompet_sha/models/operator_card_model.dart';
import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/shared/utilities.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:dompet_sha/ui/widgets/form_field_widget.dart';
import 'package:dompet_sha/ui/widgets/package_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCardModel;

  const DataPackagePage({super.key, required this.operatorCardModel});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
              AuthUpdateBalance(
                selectedData!.price! * -1,
              ),
            );

            Navigator.pushNamedAndRemoveUntil(
                context, '/data-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
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
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 14,
                ),
                FormFieldWidget(
                  title: '+62',
                  isShowTitle: false,
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Package',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 17,
                  runSpacing: 17,
                  children: widget.operatorCardModel.dataPlans!.map((
                      dataPlan) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedData = dataPlan;
                          });
                        },
                        child: PackageItemWidget(
                          dataPlanModel: dataPlan,
                          isSelected: dataPlan.id == selectedData?.id,
                        ));
                  }).toList(),
                ),
                const SizedBox(
                  height: 57,
                ),
              ],
            ),
            floatingActionButton:
            (selectedData != null && phoneController.text.isNotEmpty)
                ? Container(
              margin: const EdgeInsets.all(24),
              child: ButtonWidget(
                title: 'Continue',
                onPressed: () async {
                  if (await Navigator.pushNamed(context, '/pin') == true) {
                    final authState = context
                        .read<AuthBloc>()
                        .state;
                    String pin = '';
                    if (authState is AuthSuccess) {
                      pin = authState.user.pin!;
                    }
                    context.read<DataPlanBloc>().add(
                      DataPlanPost(
                        DataPlanFormModel(
                          dataPlanId: selectedData!.id,
                          phoneNumber: phoneController.text,
                          pin: pin,
                        ),
                      ),
                    );
                  }
                },
              ),
            )
                : Container(),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat,
          );
        },
      ),
    );
  }
}
