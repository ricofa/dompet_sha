import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if(pinController.text == '123456'){
      Navigator.pop(context, true);
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dompet PIN',
                style:
                    whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
              ),
              const SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  obscureText: true,
                  cursorColor: greyColor,
                  obscuringCharacter: '*',
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                      fontSize: 36, fontWeight: medium, letterSpacing: 16),
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
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
                      addPin('1');
                    },
                  ),
                  InputPinButton(
                    title: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  InputPinButton(
                    title: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  InputPinButton(
                    title: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  InputPinButton(
                    title: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  InputPinButton(
                    title: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  InputPinButton(
                    title: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  InputPinButton(
                    title: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  InputPinButton(
                    title: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  InputPinButton(
                    title: '0',
                    onTap: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
