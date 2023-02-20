import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import '../firebase_servises/repo/auth_repo.dart';
import '../utils/static_method.dart';

class LoginWithEmailLink extends StatefulWidget {
  LoginWithEmailLink({Key? key}) : super(key: key);

  @override
  State<LoginWithEmailLink> createState() => _LoginWithEmailLinkState();
}

class _LoginWithEmailLinkState extends State<LoginWithEmailLink> with WidgetsBindingObserver{
  final emailController = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('fffffffffffff${state}');
    if (state == AppLifecycleState.resumed) {
      getDynamicLink(fromColdState: false);
    }
    super.didChangeAppLifecycleState(state);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.phone,
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('Submit'),
          ),

        ],
      ),
    );
  }


/// these methods will be on the statemanagment
  sendSignInWithEmailLink() async {
    if(emailController.text.isNotEmpty){
      await AuthRepo.sendSignInWithEmailLink(emailController.text.trim());
    }
    else{
      StaticMethods.showToast('please...fill field');
    }
  }

  Future<void> getDynamicLink({required bool fromColdState}) async {

    final PendingDynamicLinkData? data =  fromColdState?await FirebaseDynamicLinks.instance.getInitialLink()
        :await FirebaseDynamicLinks.instance.onLink.first;
    print('hhhhhhhhhhhhhh$data');
    if(data!=null){
      final String link = data.link.toString();
      print('mmmmmmmmmmmmmmmmmmmmm$link');
      bool isAccepted = await AuthRepo.signInWithEmailLink(emailController.text.trim(), link);
      if(isAccepted){
        //executeWhenUserAccepted();
      }
    }
    else{
      print('mmmmmmmmmmmmmmmmmmmmm no Credentials were found');
    }

  }
}
