import 'package:demoredux/state_counter.dart';

class CounterViewModel{
  final CounterState? state;
  final Function()? onIncreaseCounter;
  final Function()? onDecreaseCounter;
  final Function()? onResetCounter;

  CounterViewModel({this.state, this.onIncreaseCounter, this.onDecreaseCounter, this.onResetCounter});
}