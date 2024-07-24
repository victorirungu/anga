import 'package:anga/controllers/data.dart';
import 'package:anga/views/pages/Authentication/components/check_box.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/inputs/text_field.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  final double width;
  SignUpForm({super.key, required this.width});
  final CheckboxController controller = Get.put(CheckboxController());
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width > 800 ? width * .55 : width * .75,
        child: Padding(
          padding: EdgeInsets.only(top: width > 800 ? 110.0 : 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                  text: 'Create an Anga Cinemas account',
                  fontSize: width * .04 > 32.0
                      ? 32.0
                      : width * .04 < 18
                          ? 18
                          : width * .04,
                  fontWeight: FontWeight.w800,
                  color: secondaryColor()),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomText(
                      text: 'Username',
                      fontSize: width * .03 > 22.0
                          ? 22.0
                          : width * .03 < 16
                              ? 16
                              : width * .03,
                      color: primaryForeGround(),
                    ),
                  ),
                  const CustomTextField(
                    fillColor: true,
                    hint: 'Name',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomText(
                      text: 'Email Address',
                      fontSize: width * .03 > 22.0
                          ? 22.0
                          : width * .03 < 16
                              ? 16
                              : width * .03,
                      color: primaryForeGround(),
                    ),
                  ),
                  const CustomTextField(
                    fillColor: true,
                    hint: 'Email Address',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomText(
                      text: 'Phone number',
                      fontSize: width * .03 > 22.0
                          ? 22.0
                          : width * .03 < 16
                              ? 16
                              : width * .03,
                      color: primaryForeGround(),
                    ),
                  ),
                  const CustomTextField(
                    fillColor: true,
                    hint: 'Phone number',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomText(
                      text: 'Password',
                      fontSize: width * .03 > 22.0
                          ? 22.0
                          : width * .03 < 16
                              ? 16
                              : width * .03,
                      color: primaryForeGround(),
                    ),
                  ),
                  const CustomTextField(
                    fillColor: true,
                    hint: 'Password',
                  ),
                ],
              ),
              SizedBox(
                height: width * .04 > 30.0
                    ? 30.0
                    : width * .04 < 20
                        ? 20
                        : width * .03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomText(
                      text: 'Confirm Password',
                      fontSize: width * .03 > 22.0
                          ? 22.0
                          : width * .03 < 16
                              ? 16
                              : width * .03,
                      color: primaryForeGround(),
                    ),
                  ),
                  const CustomTextField(
                    hint: 'Confirm Password',
                    fillColor: true,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Transform.scale(
                      scale: 1.6, // Increase the scale as needed
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              3.0), // Adjust the radius as needed
                          side: BorderSide(
                              strokeAlign: 0.0,
                              width: .1,
                              color: secondaryColor()), // Remove the border
                        ),
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return primaryColor(); // Replace with your desired color
                          }
                          return secondaryColor(); // Replace with the unchecked color
                        }),
                        value: false,
                        onChanged: controller.onCheckboxChanged,
                      ),
                    ),
                  ),
                  CustomText(
                    text: 'I agree to terms & policy.',
                    fontSize: width * .03 > 22.0
                        ? 22.0
                        : width * .03 < 14.0
                            ? 14.0
                            : width * .03,
                    color: primaryForeGround(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account |",
                    fontSize: width * .03 > 22.0
                        ? 22.0
                        : width * .03 < 14.0
                            ? 14.0
                            : width * .03,
                    color: primaryForeGround(),
                  ),
                  TextButton(
                    onPressed: () {
                      dataController.signIn.value = true;
                    },
                    child: CustomText(
                        text: 'Log in',
                        fontSize: width * .03 > 22.0
                            ? 22.0
                            : width * .03 < 14.0
                                ? 14.0
                                : width * .03,
                        color: primaryForeGround().withOpacity(.65),
                        selectableText: false),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: CustomElevatedButton(
                    onPressed: () {},
                    text: "SIGN UP",
                    width: 140.0,
                    bgColor: secondaryColor(),
                    borderRadius: 30.0,
                    color: secondaryColor(),
                    style: TextStyle(
                        color: lightColor(),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900),
                    height: 45.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
