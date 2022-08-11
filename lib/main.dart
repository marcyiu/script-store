import 'package:flutter/material.dart';
import 'package:adaptive_navigation/adaptive_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _appTitle = 'Script Store';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  changeIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  final _destinations = <AdaptiveScaffoldDestination>[
    const AdaptiveScaffoldDestination(title: 'Home', icon: Icons.home_rounded),
    const AdaptiveScaffoldDestination(
        title: 'Explore', icon: Icons.explore_rounded),
    const AdaptiveScaffoldDestination(
        title: 'Preferences', icon: Icons.settings_rounded),
  ];

  final _screens = [
    Center(child: Text('Home')),
    Center(child: Text('Explore')),
    Center(child: Text('Preferences')),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Row(
          children: const [
            Icon(Icons.store_rounded, size: 30),
            SizedBox(width: 15),
            Text(MyApp._appTitle),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      selectedIndex: _selectedIndex,
      onDestinationSelected: changeIndex,
      destinations: _destinations,
    );
  }
}
