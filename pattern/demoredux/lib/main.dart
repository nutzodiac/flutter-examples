import 'package:demoredux/middleware_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:demoredux/reducer_counter.dart';
import 'package:demoredux/state_counter.dart';
import 'package:demoredux/view_model_counter.dart';

void main() {
  Store<CounterState> store = Store<CounterState>(                            
    counterReducer,
    middleware: [ CounterMiddleware() ],  // add here
    initialState: CounterState(0)
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {

  final Store<CounterState>? store;

  const MyApp({Key? key, this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: store!,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

buildIncreaseButton() {
  return Container(
    padding: EdgeInsets.all(16),
    child: StoreConnector<CounterState, CounterViewModel>(
      converter: (store) {
        return CounterViewModel(
          state: store.state,
          onIncreaseCounter: () => store.dispatch(CounterActions.Increment));
      },
      builder: (context, CounterViewModel model) => FloatingActionButton(
        onPressed: model.onIncreaseCounter,
        child: Icon(Icons.add),
      )
    )
  );
}

buildDecreaseButton() {
  return Container(
    padding: EdgeInsets.all(16),
    child: StoreConnector<CounterState, CounterViewModel>(
      converter: (store) {
        return CounterViewModel(
          state: store.state,
          onDecreaseCounter: () => store.dispatch(CounterActions.Decrement));
      },
      builder: (context, CounterViewModel model) => FloatingActionButton(
        onPressed: model.onDecreaseCounter,
        child: Icon(Icons.remove),
      )
    )
  );
}

buildResetButton() {
  return Container(
    padding: EdgeInsets.all(16),
    child: StoreConnector<CounterState, CounterViewModel>(
      converter: (store) {
        return CounterViewModel(
          state: store.state,
          onResetCounter: () => store.dispatch(CounterActions.ResetCounter)
        );
      },
      builder: (context, CounterViewModel model) => FloatingActionButton(
        onPressed: model.onResetCounter,
        child: Icon(Icons.refresh),
      )
    )
  );
}

class MyHomePage extends StatelessWidget {
  final String? title;

  const MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<CounterState, CounterViewModel>(
              converter: (store) {
                // Get state from store by action reducer.
                return CounterViewModel(state: store.state);
              },
              builder: (context, CounterViewModel model) {
                // build UI.
                print("build Text");
                return Text(
                  model.state!.counter.toString(),
                  style: const TextStyle(fontSize: 36),
                );
              }
            ),
            Row(
              children: [
                buildIncreaseButton(),
                buildDecreaseButton(),
                buildResetButton(),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: StoreConnector<CounterState, CounterViewModel>(
      //   converter: (store) {
      //     // Get state from store by action reducer.
      //     return CounterViewModel(onIncreaseCounter: () => store.dispatch(CounterActions.Increment));
      //   },
      //   builder: (context, CounterViewModel model) {
      //     // build UI.
      //     return FloatingActionButton(
      //       onPressed: model.onIncreaseCounter,
      //       child: const Icon(Icons.add),
      //     );
      //   }
      // ),
    );
  }
}