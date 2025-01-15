import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/mock_repository.dart';
import 'mock_state.dart';

class MockCubit extends Cubit<MockState> with MockRepository {
  MockCubit({MockRepository? mockRepository}) : super(InitState());

}
