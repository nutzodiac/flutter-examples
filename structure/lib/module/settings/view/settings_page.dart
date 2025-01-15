import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../components/dialog/dialog_custom.dart';
import '../../../components/text/textlabel.dart';
import '../../../utils/colors.dart';
import '../../../utils/theme_app_custom.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_state.dart';

class SettingsPage extends StatelessWidget {

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => SettingsCubit(),
      child: SettingsView(),
    );
  }
}

class SettingsView extends StatefulWidget {

  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with MyDialog {
  
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
        body: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is LoadingState) {
              showProgressDialog(context);
            }
            if (state is SuccessState) {
              hideProgressDialog(context);
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
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('This is a Settings Page'),
                  TextButton(onPressed: () => context.go('/mock/0'), child: Text('Home'))
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}