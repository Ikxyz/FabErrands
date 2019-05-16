import 'package:flutter/material.dart';

class BottomNavigationComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_run),
          title: Text('Errands'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          title: Text('Active Errands'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), title: Text('History')),
      ],
    );
  }
}
