import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import "./providers/signup.provider.dart";

class SignUP extends HookWidget {
  const SignUP({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(1);
    final counter = useRef(10);
    final signupProvider =
        useRef(Provider.of<SignupProvider>(context, listen: true));
    final isOpen = useState<bool>(false);
    final isLoading = useState<bool>(true);
    final userList = useState([]);
    useEffect(() {
      print(count.value);
      Future<void> fetchData() async {
        isLoading.value = true;
        try {
          final data = await signupProvider.value.fetchData(count.value);
          userList.value = data['data'];
          isLoading.value = false;
        } catch (e) {
          print(e);
        }
      }

      fetchData();
      return null;
    }, [count.value]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hooks'),
      ),
      body: isLoading.value
          ? Column(
              children: const [
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Text(count.value.toString()),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Theme.of(context).colorScheme.onSecondary
                  ),
                  onPressed: () {
                    // count.value = count.value + 1;
                    signupProvider.value.increment();
                  },
                  child: const Text('Click Me'),
                ),
                // TextField(
                //   onChanged: (value) => count.value = value,
                // ),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(
                        userList.value[index]["email"],
                        style:Theme.of(context).textTheme.titleSmall
                      ),
                    ),
                    itemCount: userList.value.length,
                  ),
                ),
                Text(signupProvider.value.count.toString()),
              ],
            ),
    );
  }
}
// class SignUP extends StatefulWidget {
//   SignUP({super.key});
//   @override
//   State<SignUP> createState() => _SignUPState();
// }

// class _SignUPState extends State<SignUP> {
//   int count=0;
//   int myCount = 10;
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // SignupProvider signupProvider =
//     //     Provider.of<SignupProvider>(context, listen: false);
//     int counter = Provider.of<SignupProvider>(context, listen: false).count;
//     print('didChangeDependencies ==> ${counter}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     SignupProvider signupProvider =
//         Provider.of<SignupProvider>(context, listen: true);
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text('SignUP')),
//         body: Column(
//           children: [
//             Text(signupProvider.count.toString()),
//             ElevatedButton(
//               child: Text('Increase'),
//               onPressed: () {
//                 signupProvider.increment();
//                 // setState(() {
//                 //   count = count + 1;
//                 // });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SignUp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SignupProvider signupProvider =
//         Provider.of<SignupProvider>(context, listen: true);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("SignUp"),
//       ),
//       body: Column(
//         children: [
//           Text(signupProvider.count.toString()),
//           ElevatedButton(
//             onPressed: () async{
//               try {
//                 final resData = await signupProvider.fetchData();
//                 print(resData['data']);
//               } catch (e) {
//                 print(e);
//               }
//               // signupProvider.increment();
//               //  Navigator.of(context).pushNamed('/signin',arguments: {"userName":"Abhishek Singh"});
//             },
//             child: const Text("SignIn"),
//           )
//         ],
//       ),
//     );
//   }
// }
