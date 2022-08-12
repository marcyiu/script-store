import 'package:flutter/material.dart';

import 'responsive/desktop_scaffold.dart';
import 'responsive/tablet_scaffold.dart';
import 'responsive/handset_scaffold.dart';

// import 'package:adaptive_navigation/adaptive_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String appTitle = 'Script Store';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
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

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > FormFactor.desktop) return DesktopScaffold();
    if (deviceWidth > FormFactor.tablet) return TabletScaffold();
    return HandsetScaffold();
    // if (deviceWidth > FormFactor.handset) return HandsetScaffold();
    // return WatchScaffold();
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   // int _selectedIndex = 0;

//   // changeIndex(int index) {
//   //   _selectedIndex = index;
//   //   setState(() {});
//   // }

//   // final _destinations = <AdaptiveScaffoldDestination>[
//   //   const AdaptiveScaffoldDestination(title: 'Home', icon: Icons.home_rounded),
//   //   const AdaptiveScaffoldDestination(
//   //       title: 'Explore', icon: Icons.explore_rounded),
//   //   const AdaptiveScaffoldDestination(
//   //       title: 'Preferences', icon: Icons.settings_rounded),
//   // ];

//   // final _drawerList = [
//   //   ListTile(title: Text('Home'), leading: Icon(Icons.home_rounded)),
//   //   ListTile(title: Text('Explore'), leading: Icon(Icons.explore_rounded)),
//   //   ListTile(title: Text('Preferences'), leading: Icon(Icons.settings_rounded)),
//   // ];

//   // final _screens = [
//   //   const Center(child: const Text('Home')),
//   //   const Center(child: const Text('Explore')),
//   //   const Center(child: const Text('Preferences')),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   drawer: Drawer(
//     //       child: ListView(
//     //     children: _drawerList,
//     //   )),
//     //   body: AdaptiveNavigationScaffold(
//     //     appBar: AdaptiveAppBar(
//     //       title: Row(
//     //         children: const [
//     //           Icon(Icons.store_rounded, size: 30),
//     //           SizedBox(width: 15),
//     //           Text(MyApp.appTitle),
//     //         ],
//     //       ),
//     //     ),
//     //     body: _screens[_selectedIndex],
//     //     selectedIndex: _selectedIndex,
//     //     onDestinationSelected: changeIndex,
//     //     destinations: _destinations,
//     //   ),
//     // );
//   }
// }
