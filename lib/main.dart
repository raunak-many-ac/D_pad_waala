import 'package:android_tv_dpad_basic/button.dart';
import 'package:android_tv_dpad_basic/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Android TV Demo"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class LeftIntent extends Intent {}

class RightIntent extends Intent {}

class UpIntent extends Intent {}

class DownIntent extends Intent {}

class ActionIntent extends Intent {}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Intent? _intentId;
  String? _actionName;
  Color buttonColor = Colors.white;
  Color textFieldColor = Colors.white;
  FocusNode focusNode = new FocusNode();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool keyBoardIsVisible() {
    return MediaQuery.of(context).viewInsets.bottom == 1;
  }

  void _readAction(n, i) {
    print(n);
    print('keyboad == $keyBoardIsVisible()');
    if (n == 'DOWN' && !keyBoardIsVisible()) {
      buttonColor = Colors.red;
      textFieldColor = Colors.white;
      focusNode.unfocus();
    } else if (n == 'UP') {
      buttonColor = Colors.white;
      textFieldColor = Colors.red;
    } else if (n == 'ACTION') {
      if (textFieldColor == Colors.red)
        focusNode.requestFocus();
      else
        print('button click');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select):
            ActionIntent(), // OR could be : ActionIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): UpIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): DownIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): RightIntent(),
      },
      child: Actions(
        actions: {
          LeftIntent: CallbackAction(onInvoke: (Intent i) {
            _readAction('LEFT', i);
            return null;
          }),
          RightIntent: CallbackAction(onInvoke: (Intent i) {
            _readAction('RIGHT', i);
            return null;
          }),
          UpIntent: CallbackAction(onInvoke: (Intent i) {
            _readAction('UP', i);
            return null;
          }),
          DownIntent: CallbackAction(onInvoke: (Intent i) {
            _readAction('DOWN', i);
            return null;
          }),
          ActionIntent: CallbackAction(onInvoke: (Intent i) {
            _readAction('ACTION', i);
            return null;
          }),
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldX(
                  textFieldColor,
                  focusNode,
                ),
                SizedBox(
                  height: 20,
                ),
                Button(buttonColor)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
