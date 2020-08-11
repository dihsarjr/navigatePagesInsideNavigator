// Flutter code sample for Navigator

// The following example demonstrates how a nested [Navigator] can be used to
// present a standalone user registration journey.
//
// Even though this example uses two [Navigator]s to demonstrate nested
// [Navigator]s, a similar result is possible using only a single [Navigator].
//
// Run this example with `flutter run --route=/signup` to start it with
// the signup flow instead of on the home page.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> _widgets = <Widget>[Screen1(), Screen2Builder()];
  int _defaultIndex = 0;
  int _selectedIndex;

  void _onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    super.initState();
    _selectedIndex = _defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widgets[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Screen1.icon), title: Text(Screen1.name)),
            BottomNavigationBarItem(
                icon: Icon(Screen2.icon), title: Text(Screen2.name))
          ],
          onTap: _onTapHandler,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key key}) : super(key: key);

  static String name = "Screen 1";
  static IconData icon = Icons.looks_one;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Screen5()));
        },
      ),
    );
  }
}

class Screen2Builder extends StatelessWidget {
  const Screen2Builder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'screen2',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'screen2':
            return MaterialPageRoute(
                builder: (context) => Screen2(), settings: settings);
            break;

          case 'screen3':
            return MaterialPageRoute(
                builder: (context) => Screen3(), settings: settings);
            break;

          default:
            throw Exception("Invalid route");
        }
      },
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static String name = "Screen 2";
  static IconData icon = Icons.ac_unit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("screen3");
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.teal,
        child: Text(name),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key key}) : super(key: key);

  static String name = "Screen 3";
  static IconData icon = Icons.access_alarm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: RaisedButton(onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen4()));
          }),
        ));
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key key}) : super(key: key);

  static String name = "Screen 4";
  static IconData icon = Icons.access_alarm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {},
          ),
        ),
        body: Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: Text(name),
        ));
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({Key key}) : super(key: key);

  static String name = "Screen 5";
  static IconData icon = Icons.access_alarm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {},
          ),
        ),
        body: Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: Text(name),
        ));
  }
}
