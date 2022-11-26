import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Center(
                child: GestureDetector(
                  child: const Text('Home'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                ),
              ))
        ],
      ),
    );
  }
}
