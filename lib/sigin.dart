import "package:flutter/material.dart";

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Map<String, String> routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // print(routeArgs['userName']);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: Column(
        children: [
          const Text("Welcome to SignIn Screen"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            child: const Text("Home"),
          )
        ],
      ),
    );
  }
}
