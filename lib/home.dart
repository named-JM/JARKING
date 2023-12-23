import 'package:final_project_for_flutter_by_jarling/menu.dart';
import 'package:final_project_for_flutter_by_jarling/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    //since the list items are in array we need it for our routes screens
    final screens = [
      MenuPage(),
      HomeScreen(),
      ProfilePage(),
    ];

    //create items that split to list items

    final items = <Widget>[
      Icon(
        Icons.border_all_rounded,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.home_filled,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.person_2_sharp,
        size: 30,
        color: Colors.white,
      ),
    ];

    return Scaffold(
      //this is to call routes/screens
      body: screens[index],

      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade200,
        color: Colors.grey.shade700,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 36.0,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.grey[900],
                      size: 36.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0), // Adjust the left padding as needed
                child: Text(
                  'Welcome\nTo The\nJarling Studio.',
                  style: TextStyle(
                    fontSize: 60.0, // Adjust the font size as needed
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              //Expanded(child: Lottie.asset('Assets/animation-design.json')),
              SizedBox(
                  height: 20), // Add some space between the text and the button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Scroll down to the "About Us" section
                    _scrollController.animateTo(
                      MediaQuery.of(context).size.height,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400], // Change the color as needed
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Checkout our Group!', // Change the text as needed
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),

              SizedBox(height: 500), // Add space for smooth scrolling effect
              // Your "About Us" section goes here
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 50.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Jarling Studios was named after the three members of the COSC30 Final Project.'
                      '\n\nThe three members who made this app are:\n'
                      'Joanna Caguco, Carl Balano, and King Martinez thus the Jarling was made!'
                      '\n\nThis app was made from flutter that contains all the 10 programs.'
                      'Let\'s do our best so that Sir Cooper will grade us perfect.',
                      style: TextStyle(fontSize: 17.9),
                    ),

                    SizedBox(height: 100)
                    // Add more content for the "About Us" section as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.grey[900], // Set the color of the DrawerHeader
              height: 300, // Set the height of the Container
              child: Padding(
                padding: const EdgeInsets.all(
                    20.0), // Add padding around DrawerHeader
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.grey[300],
                          size: 150,
                        ),
                      ),
                      // Text(
                      //   'Profile',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 24,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle the onTap action for the first item in the drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle the onTap action for the second item in the drawer
              },
            ),
            // Add more ListTiles for additional items in the drawer
          ],
        ),
      ),
    );
  }
}
