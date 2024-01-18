import 'package:final_project_for_flutter_by_jarling/menuCategories/appsMenu.dart';
import 'package:final_project_for_flutter_by_jarling/menuCategories/crudMenu.dart';
import 'package:final_project_for_flutter_by_jarling/menuCategories/gameMenu.dart';
import 'package:final_project_for_flutter_by_jarling/menuCategories/musicMenu.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage(
            //           "Assets/images/119104210865.png"),
            //       fit: BoxFit.cover),
            // ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //add icons or something
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamesMenu()));
                        },
                        child: RoundedBox(label: 'GAMES'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppsMenu()));
                        },
                        child: RoundedBox(label: 'APPS'),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CrudMenu()));
                        },
                        child: RoundedBox(label: 'CRUD'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicMenu()));
                        },
                        child: RoundedBox(label: 'MUSIC'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class RoundedBox extends StatelessWidget {
  final String label;

  const RoundedBox({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            //bottom right shadow is darker
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(5, 5),
              blurRadius: 20,
              spreadRadius: 1,
            ),

            //top left shadow is lighter
            BoxShadow(
              color: Colors.white,
              offset: Offset(-10, -7),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ]),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}
