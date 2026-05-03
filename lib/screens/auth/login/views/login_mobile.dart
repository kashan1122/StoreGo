import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_assets_path.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/custom_button.dart';
import 'package:myapp/core/custom_widgets/custom_field.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/text.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conPasswordController = TextEditingController();
  bool isSignUp = false;
  bool isForgotPassword = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomText(
              isSignUp?AppString.createAnAcc:
              isForgotPassword?AppString.forgotPass:AppString.welcomeBack,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    hint: "Email Address",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  isForgotPassword?const SizedBox.shrink():CustomTextField(
                    hint: "Password",
                    isPassword: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Minimum 6 characters required";
                      }
                      return null;
                    },
                  ),
                  isSignUp
                      ? CustomTextField(
                          hint: "ConfirmPassword",
                          isPassword: true,
                          controller: conPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Minimum 6 characters required";
                            }
                            return null;
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            Align(
              alignment:
                  isSignUp ? Alignment.centerLeft : Alignment.centerRight,
              child: isSignUp
                  ? RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff676767),
                        ),
                        children: [
                          const TextSpan(
                            text: "\nBy clicking the ",
                          ),
                          TextSpan(
                            text: "Register",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate or action
                                print("Register clicked");
                              },
                          ),
                          const TextSpan(
                            text: " button, you agree\nto the public offer\n\n",
                          ),
                        ],
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          isForgotPassword = true;
                        });
                      },
                      child: const Text(
                        AppString.forgotPassword,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 0.1),
                      ),
                    ),
            ),
            CustomButton(
              text: isSignUp?
              AppString.createAccount:
              isForgotPassword?AppString.submit:AppString.login,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // Your save logic here
                  print("Form Submitted");
                }
              },
            ),
            isForgotPassword?const SizedBox.shrink():Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: CustomText(
                    "- OR Continue with -",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    circularContainer(image: AppAssets.google),
                    const SizedBox(
                      width: 10,
                    ),
                    circularContainer(image: AppAssets.fb),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                            isSignUp?
                            AppString.already:
                            AppString.createAnAccount,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text:    isSignUp?
                            " ${AppString.login}":" ${AppString.signUp}",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate or action
                                if(isSignUp){
                                  setState(() {
                                    isSignUp = false;
                                  });
                                }
                                else{
                                  setState(() {
                                    isSignUp = true;
                                  });
                                }

                              },
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xffF83758),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget circularContainer({image}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xffFCF3F6),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xffF83758), width: 1)),
      child: Image.asset(
        image,
        scale: 3,
      ),
    );
  }
}
