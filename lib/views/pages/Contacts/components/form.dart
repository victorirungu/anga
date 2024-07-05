import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  final double width;
  const ContactForm({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width * .55,
        child: Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                  text: 'Get in Touch',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: primaryColor()),
              const SizedBox(height: 30),
              const CustomTextField(
                hint: 'Name*',
              ),
              const SizedBox(height: 30),
              const CustomTextField(
                hint: 'Email*',
              ),
              const SizedBox(height: 30),
              const CustomTextField(
                hint: 'Phone Number*',
              ),
              const SizedBox(height: 30),
              const CustomTextField(
                hint: 'Comments/Message*',
                maxLines: 3,
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomElevatedButton(
                    onPressed: () {},
                    text: "Submit",
                    width: 110.0,
                    bgColor: primaryColor(),
                    borderRadius: 10.0,
                    color: primaryColor(),
                    style: TextStyle(
                        color: darkColor(),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900),
                    height: 40.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const CustomTextField({super.key, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: primaryForeGround(),
        labelText:
            hint, // Use labelText to show the label outside the TextField
        labelStyle: TextStyle(color: primaryBackGround(), fontSize: 20.0),
        // hintText: hint,
        // hintStyle: TextStyle(color: primaryForeGround()),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
