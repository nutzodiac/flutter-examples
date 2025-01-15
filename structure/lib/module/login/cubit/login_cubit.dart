import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/storage.dart';
import '../../mock/model/response/login_response_model.dart';
import '../model/response/forgot_password_response_model.dart';
import '../repository/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with LoginRepository {
  LoginCubit({LoginRepository? loginRepository}) : super(InitState());

  Future<void> loginEvent(event) async {
    emit(LoadingState());
    try {
      final response = await login(event);
      if (response.statusCode == 200) {
        LoginResponseModel data = LoginResponseModel.fromJson(response.data);
        if (data.head!.errorflag == "Y") {
          emit(ErrorState(message: data.head!.errordesc.toString()));
        } else {
          if (data.body != null) {
            if (data.body!.result == "Y") {
              await Storage.getInstance().writeStorageData("TOKEN_KEY", data.body!.token ?? "");
              emit(SuccessState(data: data.body!));
            } else {
              emit(ErrorState(message: data.body!.reason.toString()));
            }
          } else {
            emit(ErrorState(message: data.head!.errordesc.toString()));
          }
        }
      } else {
        emit(ErrorState(message: response.statusCode.toString()));
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> forgotPasswordEvent(event) async {
    emit(LoadingState());
    try {
      // This api cannot call, it's example //
      // final response = await forgotPassword(event);
      // if (response.statusCode == 200) {
      //   ForgotPasswordResponseModel data = ForgotPasswordResponseModel.fromJson(response.data);
      //   if (data.head!.errorflag == "Y") {
      //     emit(ErrorState(message: data.head!.errordesc.toString()));
      //   } else {
      //     if (data.body != null) {
      //       if (data.body!.result == "Y") {
      //         emit(SuccessState(data: data.body!));
      //       } else {
      //         emit(ErrorState(message: data.body!.reason.toString()));
      //       }
      //     } else {
      //       emit(ErrorState(message: data.head!.errordesc.toString()));
      //     }
      //   }
      // } else {
      //   emit(ErrorState(message: response.statusCode.toString()));
      // }
      // var response = {
      //   "head": {
      //       "errorflag": "N",
      //       "errorcode": "000",
      //       "errordesc": "Success"
      //   },
      //   "body": {
      //       "result": "Y",
      //       "resultcode": "popup_success",
      //       "reason": "ทำการเปลี่ยนรหัสผ่านเรียบร้อย"
      //   }
      // };
      // ForgotPasswordResponseModel data = ForgotPasswordResponseModel.fromJson(response);
      emit(SuccessState(data: ""));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}