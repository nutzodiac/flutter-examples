import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../components/button/button_custom.dart';
import '../../../components/dialog/dialog_custom.dart';
import '../../../components/input/text_form_field.dart';
import '../../../components/text/textlabel.dart';
import '../../../utils/storage.dart';
import '../../mock/cubit/mock_cubit.dart';
import '../../mock/cubit/mock_state.dart';
import '../../mock/model/request/login_request_model.dart';
import '../cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MyDialog {

  Storage storage = Storage();
  
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
      },
      child: Scaffold(
        body: BlocConsumer<MockCubit, MockState>(
          listener: (context, state) {
            if (state is LoadingState) {
              showProgressDialog(context);
            }
            if (state is SuccessState) {
              hideProgressDialog(context);
              context.go('/pin');
            }
            if (state is ErrorState) {
              hideProgressDialog(context);
              showDialogMessage(
                context: context,
                message: state.message,
              );
            }
            if (state is DepositSuccessState) {
              hideProgressDialog(context);
              showDialogMessage(
                context: context,
                message: "ฝากเงินสำเร็จ",
              );
            }
        }, builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Semantics(
                        identifier: "LoginLogo",
                        label: "LoginLogo",
                        child: Image.asset('assets/images/flutter_logo.png', width: 100)
                      ),
                    ),
                    MyTextFormField(
                      semanticslabel: 'UsernameController',
                      controller: _usernameController,
                      labelHeader: "Username",
                      hintText: "Username",
                      suffixIcon: const Icon(Icons.person_2_outlined, color: Colors.white),
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(' ')],
                      fillColor: Colors.black
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: MyTextFormField(
                        semanticslabel: 'PasswordController',
                        controller: _passwordController,
                        labelHeader: "Password",
                        hintText: "Password",
                        suffixIcon: const Icon(Icons.lock, color: Colors.white),
                        obscureText: true,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(' ')],
                        fillColor: Colors.black
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ButtonCustom(
                        semanticslabel: 'LogInButton',
                        label: "Log In",
                        foregroundColor: Colors.blue[300],
                        backgroundColor: Colors.blue[600],
                        textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        onPressed: () async {
                          _usernameController.text = "test.ann";
                          _passwordController.text = "ann02";
                          Map<String, String> tempJson = {
                            "username": _usernameController.text,
                            "password": _passwordController.text,
                            "ip": "127.0.0.1",
                            "device": Platform.isIOS ? "i" : "a",
                          };
                          LoginRequestModel change = LoginRequestModel.fromJson(tempJson);
                          context.read<LoginCubit>().loginEvent(change);
                          // bool exists = await storage.existsStorageData(Storage.pinKey);
                          // context.go('/pin', extra: PinArguments(pinType: exists ? PinType.LOGIN : PinType.SETNEW));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ButtonCustom(
                        semanticslabel: 'RegisterButton',
                        label: "Register",
                        foregroundColor: Colors.purple[300],
                        backgroundColor: Colors.purple[600],
                        textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        onPressed: () {
                          context.go('/register');
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go('/forgot_password'),
                      child: TextLabel.sizeS(
                        semanticslabel: 'ForgotPasswordButton',
                        text: "Forgot Password?",
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}