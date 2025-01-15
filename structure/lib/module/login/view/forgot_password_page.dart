import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../components/button/button_custom.dart';
import '../../../components/dialog/dialog_custom.dart';
import '../../../components/input/text_form_field.dart';
import '../../../components/text/textlabel.dart';
import '../../../utils/theme_app_custom.dart';
import '../../mock/cubit/mock_cubit.dart';
import '../../mock/cubit/mock_state.dart';
import '../cubit/login_cubit.dart';
import '../model/request/forgot_password_request_model.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with MyDialog {

  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              // context.go('/pin');
              print('dsfffffffffffffffff');
              showDialogMessage(
                context: context,
                message: "ฝากเงินสำเร็จ",
              );
              // context.go('/otp')
            }
            if (state is ErrorState) {
              hideProgressDialog(context);
              showDialogMessage(
                context: context,
                message: state.message,
              );
            }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Semantics(
                    identifier: "ForgotPasswordLogo",
                    label: "ForgotPasswordLogo",
                    child: Image.asset('assets/images/flutter_logo.png', width: 100)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                  child: TextLabel.sizeL(
                    semanticslabel: 'ForgotPasswordText',
                    text: "Enter your registed email address below to receive password reset instructions.",
                    textAlign: TextAlign.start,
                    maxline: 3,
                    fontSize: 18,
                  ),
                ),
                MyTextFormField(
                  semanticslabel: 'EmailController',
                  controller: _emailController,
                  labelHeader: "Email",
                  hintText: "Email",
                  suffixIcon: const Icon(Icons.person_2_outlined, color: Colors.white),
                  textInputType: TextInputType.emailAddress,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(' ')],
                  fillColor: Colors.black
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ButtonCustom(
                    semanticslabel: 'ForgotPasswordButton',
                    label: "Reset Password",
                    foregroundColor: Colors.blue[300],
                    backgroundColor: Colors.blue[600],
                    textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    onPressed: () {
                      // This api cannot call, it's example //
                      _emailController.text = "aaa@aa.aaa";
                      ForgotPasswordRequestModel change = ForgotPasswordRequestModel.fromJson({"email": _emailController.text});
                      context.read<LoginCubit>().forgotPasswordEvent(change);
                    },
                  ),
                ),
                Semantics(
                  identifier: 'BackButton',
                  container: true,
                  child: GestureDetector(
                    onTap: () => context.go('/login'),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 20.0),
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.arrow_back_rounded, color: ThemeAppCustom.primaryColor)
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: TextLabel.sizeS(
                                  text: "Back",
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeAppCustom.primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}