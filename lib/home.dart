import "package:flutter/material.dart";
import './homeDrawer.dart';
import './sigin.dart';
import './signup.dart';
import './home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _onTap(int index) {
    setState(() {
      _screenIndex = index;
    });
  }
  final List _screen = [SignIn(), SignUP()];
  int _screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: _screen[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.amber,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.amber,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.amber,
              ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
             color: Colors.amber,
            ),
            label: "Home",
          )
        ],
      ),
    );
  }
}
