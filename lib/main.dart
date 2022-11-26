import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import './custom_button.dart';
import './sigin.dart';
import './providers/signup.provider.dart';
import './home.dart';
import './signup.dart';

final ThemeData theme = ThemeData();
void main() => runApp(
      MediaQuery(
        data: const MediaQueryData(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<SignupProvider>(
              create: (BuildContext context) => SignupProvider(),
            )
          ],
          child: MaterialApp(
            theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                  secondary: Colors.red,
                  primary: const Color(0xFFFF9000),
                  tertiary: const Color.fromARGB(255, 82, 78, 88),
                  onSecondary: Colors.yellow,
                  ),
                  textTheme: const TextTheme(
                    titleSmall: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    )
                  )
            ),
            routes: {
              "/": (context) => SignUP(),
              "/signin": (context) => SignIn(),
              "/home": (context) => const Home(),
            },
          ),
        ),
      ),
    );

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: Column(
        children: [
          Text('The height is ${_size.height.toString()}'),
          Text('The width is ${_size.width.toString()}'),
          Text(_textEditingController.text),
          Padding(
            padding: EdgeInsets.all(40),
            child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    label: Text("Name"),
                    helperText: "Enter your name ",
                    hintText: "Your Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textEditingController.clear();
                        },
                        icon: Icon(Icons.person)))),
          )
        ],
      ),
    );
  }
}

class ShowScore extends StatefulWidget {
  @override
  State<ShowScore> createState() {
    return ShowScoreState();
  }
}

class ShowScoreState extends State<ShowScore> {
  int count = 0;
  void _onPressed() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        Expanded(
            child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        )),
      ],
    );
  }
}
//https://www.youtube.com/watch?v=9iQiVUmLXyI