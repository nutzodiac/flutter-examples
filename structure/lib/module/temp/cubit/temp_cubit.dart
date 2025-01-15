import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/temp_repository.dart';
import 'temp_state.dart';

class TempCubit extends Cubit<TempState> {
  TempCubit({TempRepository? tempRepository}) : super(InitState());
}