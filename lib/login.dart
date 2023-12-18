import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Stack(
        //   children: [
        //     Container(
        //       height: double.infinity,
        //       width: double.infinity,
        //       decoration: const BoxDecoration(
        //           gradient: LinearGradient(colors: [
        //         Color.fromRGBO(247, 134, 112, 1),
        //         Color.fromRGBO(255, 96, 123, 1)
        //       ])),
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 60.0, left: 22),
        //         child: Text(
        //           "Hello\nSign in!",
        //           style: TextStyle(
        //               fontSize: 30,
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(top: 200.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.only(
        //               topRight: Radius.circular(40.0),
        //               topLeft: Radius.circular(40.0)),
        //           color: Colors.white,
        //         ),
        //         height: double.infinity,
        //         width: double.infinity,
        //         child: Column(
        //           children: [],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
