// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';

class LoginScreen extends StatelessWidget {
  late String phoneNumber;

  LoginScreen({Key? key}) : super(key: key);

  Widget _buildIntroTexts() {
    return Column(
      children: [
        Text(
          'What is your phone number?',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            'Please enter your phone number to verify your account',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        )
      ],
    );
  }

  Widget _buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: MyColors.lightGrey),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Text(
                generateCountryFlag() + '+20',
                style: TextStyle(fontSize: 18, letterSpacing: 2.0),
              ),
            )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: MyColors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: TextFormField(
                  autofocus: true,
                  style: TextStyle(fontSize: 18, letterSpacing: 2.0),
                  decoration: InputDecoration(border: InputBorder.none),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number!';
                    } else if (value.length < 11) {
                      return 'Too short for a phone number!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value!;
                  },
                )))
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Next',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(110, 50),
            primary: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: UniqueKey(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntroTexts(),
                SizedBox(
                  height: 110,
                ),
                _buildPhoneFormField(),
                SizedBox(
                  height: 70,
                ),
                _buildNextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
