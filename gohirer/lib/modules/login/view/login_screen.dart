import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/image/image_custom.dart';
import '../../../components/input/input_custom.dart';
import '../../../components/text/text_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? forceErrorText;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length != value.replaceAll(' ', '').length) {
      return 'Username must not contain any spaces';
    }
    if (int.tryParse(value[0]) != null) {
      return 'Username must not start with a number';
    }
    if (value.length <= 2) {
      return 'Username should be at least 3 characters long';
    }
    return null;
  }

  void onChanged(String value) {
    // Nullify forceErrorText if the input changed.
    if (forceErrorText != null) {
      setState(() {
        forceErrorText = null;
      });
    }
  }

  Future<void> onSave() async {
    // Providing a default value in case this was called on the
    // first frame, the [fromKey.currentState] will be null.
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    setState(() => isLoading = true);
    final String? errorText = await validateUsernameFromServer(emailController.text);

    if (context.mounted) {
      setState(() => isLoading = false);

      if (errorText != null) {
        setState(() {
          forceErrorText = errorText;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/flutter_logo.png', width: 100),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MyInputCustom(
                        controller: emailController,
                        hintText: 'Email',
                        forceErrorText: forceErrorText,
                        validator: validator,
                        onChanged: onChanged,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: MyInputCustom(
                          controller: emailController,
                          hintText: 'Password',
                          forceErrorText: forceErrorText,
                          validator: validator,
                          onChanged: onChanged,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: MyTextButtonCustom(
                          onPressed: () {},
                          text: 'Forgot password',
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      if (isLoading)
                        const CircularProgressIndicator()
                      else
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6,
                                spreadRadius: 3,
                                offset: Offset(1, 2)
                              )
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {}, 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.yellow[700],
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                            ),
                            child: const Text('SIGN IN', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold, letterSpacing: 3))
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: MyTextButtonCustom(
                          onPressed: () {},
                          text: 'Register new account',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/4),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Sign in as:', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/4),
                      const MySvgPictureCustom(
                        assetName: 'assets/icons/facebook.svg',
                        semanticsLabel: 'Facebook'
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: MySvgPictureCustom(
                          assetName: 'assets/icons/gmail.svg',
                          semanticsLabel: 'Gmail'
                        ),
                      ),
                      const MySvgPictureCustom(
                        assetName: 'assets/icons/instagram.svg',
                        semanticsLabel: 'Instagram'
                      )
                    ],
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


Future<String?> validateUsernameFromServer(String username) async {
  final Set<String> takenUsernames = <String>{'jack', 'alex'};

  await Future<void>.delayed(const Duration(seconds: 3));

  final bool isValid = !takenUsernames.contains(username);
  if (isValid) {
    return null;
  }

  return 'Username $username is already taken';
}
