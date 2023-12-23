import 'package:final_project_for_flutter_by_jarling/categories/games/game1.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/game2.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/game3.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/game4.dart';
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 36.0,
                    ),
                  ],
                ),
              ),
              Text(
                'THIS IS MENU PAGE 4 BOX HERE',
                style: TextStyle(fontSize: 50.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GamesMenu()));
                    },
                    child: RoundedBox(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AppsMenu()));
                    },
                    child: RoundedBox(),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CrudMenu()));
                    },
                    child: RoundedBox(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MusicMenu()));
                    },
                    child: RoundedBox(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class RoundedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}
