import 'package:flutter/material.dart';
import 'package:script_store/main.dart';
import 'package:script_store/screens/list.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  int _selectedIndex = 0;
  bool _extended = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.store_rounded, size: 35),
            SizedBox(width: 15),
            Text(MyApp.appTitle)
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            extended: _extended,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.explore_rounded),
                label: Text('Explore'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.access_time_rounded),
                label: Text('Latest'),
              ),
            ],
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _extended = !_extended;
                      });
                    },
                    icon: const Icon(Icons.chevron_right_rounded),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: ListScreen(),
          )
        ],
      ),
    );
  }
}
