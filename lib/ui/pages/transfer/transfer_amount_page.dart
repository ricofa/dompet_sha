import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({Key? key}) : super(key: key);

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
  TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(text.replaceAll('.', '')),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              'Total Amount',
              style:
              whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                cursorColor: greyColor,
                enabled: false,
                style:
                whiteTextStyle.copyWith(fontSize: 36, fontWeight: medium),
                decoration: InputDecoration(
                  prefixIcon: Text('Rp ',
                      style: whiteTextStyle.copyWith(
                          fontSize: 36, fontWeight: medium)),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 66,
          ),
          Wrap(
            runSpacing: 40,
            spacing: 40,
            children: [
              InputPinButton(
                title: '1',
                onTap: () {
                  addAmount('1');
                },
              ),
              InputPinButton(
                title: '2',
                onTap: () {
                  addAmount('2');
                },
              ),
              InputPinButton(
                title: '3',
                onTap: () {
                  addAmount('3');
                },
              ),
              InputPinButton(
                title: '4',
                onTap: () {
                  addAmount('4');
                },
              ),
              InputPinButton(
                title: '5',
                onTap: () {
                  addAmount('5');
                },
              ),
              InputPinButton(
                title: '6',
                onTap: () {
                  addAmount('6');
                },
              ),
              InputPinButton(
                title: '7',
                onTap: () {
                  addAmount('7');
                },
              ),
              InputPinButton(
                title: '8',
                onTap: () {
                  addAmount('8');
                },
              ),
              InputPinButton(
                title: '9',
                onTap: () {
                  addAmount('9');
                },
              ),
              const SizedBox(
                width: 60,
                height: 60,
              ),
              InputPinButton(
                title: '0',
                onTap: () {
                  addAmount('0');
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: numberBgColor,
                  ),
                  child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      )),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ButtonWidget(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/transfer-success', (route) => false);
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextButton(
            title: 'Terms and Conditions',
            onPressed: () {},
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
