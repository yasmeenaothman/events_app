import 'package:events_app/modules/phone_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../model/login_form_state.dart';
import '../riverpod/providers/auth_providers.dart';
import '../riverpod/providers/login_form_notifier_provider.dart';
import 'open_email_app_page.dart';

final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class HomePage extends HookConsumerWidget {
  static String routeName = "/HomePage";
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginFormNotifierProvider);
    final notifier = ref.watch(loginFormNotifierProvider.notifier);
    final firebaseAuthProvider = ref.watch(firebaseAuthStateProvider.notifier);
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    String? phoneNumber;
    ref.listen(loginFormNotifierProvider, (previous, next) {
      if (next.emailSent) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const OpenEmailAppPage(),));
      } else if (next.smsSent) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneVerificationPage(),));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Form(
        key: loginFormKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoSegmentedControl<LoginMethod>(
                groupValue: state.loginMethod,
                children: const {
                  LoginMethod.email: Text(' Email '),
                  LoginMethod.phone: Text(' Phone ')
                },
                onValueChanged: (value) {
                  notifier.changeLoginMethod(value);
                },
              ),
              if (state.loginMethod == LoginMethod.email)
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: notifier.validateEmail,
                ),
              if (state.loginMethod == LoginMethod.phone)
                IntlPhoneField(
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  dropdownIcon: const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.black,
                  ),
                  controller: phoneController,
                  initialCountryCode: 'PS',
                  disableLengthCheck: true,
                  dropdownTextStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  dropdownIconPosition: IconPosition.trailing,
                  textInputAction: TextInputAction.go,
                  autofocus: false,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  flagsButtonPadding: const EdgeInsets.only(left: 8),
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber.trim();
                    print(phone.completeNumber);
                  },
                ),
              const SizedBox(height: 32),
              ElevatedButton(
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      if (state.loginMethod == LoginMethod.email) {
                        notifier.handleEmailLogin(emailController.text);
                      } else {
                        notifier.handlePhoneLogin(context,phoneNumber!,firebaseAuthProvider);
                      }
                    }
                  },
                  child: state.submitting
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ))
                      : Text(notifier.submitButtonText))
            ],
          ),
        ),
      ),
    );
  }
}
