import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project_for_flutter_by_jarling/developerCards.dart';
import 'package:final_project_for_flutter_by_jarling/menu.dart';
import 'package:final_project_for_flutter_by_jarling/profile.dart';
import 'package:flutter/material.dart';

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
        Icons.apps_outlined,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.home_outlined,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.account_circle_outlined,
        size: 30,
        color: Colors.white,
      ),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   // shadowColor: const Color.fromARGB(255, 255, 255, 255),
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.grey.shade700,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Menu',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context); // Close the drawer
      //           setState(() {
      //             index = 0; // Set the selected index to the MenuPage
      //           });
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Home',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context); // Close the drawer
      //           setState(() {
      //             index = 1; // Set the selected index to the HomeScreen
      //           });
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Profile',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context); // Close the drawer
      //           setState(() {
      //             index = 2; // Set the selected index to the ProfilePage
      //           });
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Settings',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context); // Close the drawer
      //           setState(() {
      //             index = 2; // Set the selected index to the ProfilePage
      //           });
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'About',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context); // Close the drawer
      //           setState(() {
      //             index = 2; // Set the selected index to the ProfilePage
      //           });
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Developers',
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      //         ),
      //         onTap: () {
      //           Navigator.pop(context); // Close the drawer
      //           setState(() {
      //             index = 2; // Set the selected index to the ProfilePage
      //           });
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      //this is to call routes/screens
      body: screens[index],

      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade200,
        color: Colors.grey.shade800,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/images/blobs/119104210865.png'),
                    fit: BoxFit.none,
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0), // Adjust the left padding as needed
                      child: Text(
                        'Welcome\nTo The\nJarking Studio.',
                        style: TextStyle(
                          fontSize: 50.0, // Adjust the font size as needed
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Expanded(child: Lottie.asset('Assets/animation-design.json')),
              SizedBox(
                  height: 20), // Add some space between the text and the button

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InkWell(
                  onTap: () {
                    // Scroll down to the "About Us" section
                    _scrollController.animateTo(
                      MediaQuery.of(context).size.height,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Change the color as needed
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
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
                      ],
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
                    child: Text(
                      'Checkout our Group!', // Change the text as needed
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Stack(
                  children: [
                    // Background image container
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('Assets/images/blobs/blobBG.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Existing content container
                    Container(
                      height: 350,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'See more works in our Categories!',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              Icon(
                                Icons.arrow_downward,
                                size: 30,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Add Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  Image.asset(
                    'Assets/images/img-carousel/4.png', // Replace with the path to your image
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  Image.asset(
                    'Assets/images/img-carousel/3.png', // Replace with the path to your image
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  Image.asset(
                    'Assets/images/img-carousel/5.png', // Replace with the path to your image
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  // Add more items as needed
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'Assets/images/icons/3143372.png'), // Replace with your image path
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Check out our Team!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeveloperCard()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(5, 5),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-10, -7),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Add space for smooth scrolling effect
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
                      'Jarking Studios was named after the three members of the COSC30 Final Project.'
                      '\n\nThe three members who made this app are:\n'
                      'Joanna Caguco, Carl Balano, and King Martinez thus the Jarking was made!'
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
    );
  }
}
