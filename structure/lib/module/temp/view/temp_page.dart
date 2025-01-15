import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/dialog/dialog_custom.dart';
import '../cubit/temp_cubit.dart';
import '../cubit/temp_state.dart';

class SettingsPage extends StatelessWidget {

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TempCubit>(
      create: (context) => TempCubit(),
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
        body: BlocConsumer<TempCubit, TempState>(
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
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}