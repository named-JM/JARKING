import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project_for_flutter_by_jarling/developerCards.dart';
import 'package:final_project_for_flutter_by_jarling/menu.dart';
import 'package:final_project_for_flutter_by_jarling/menuCategories/gameMenu.dart';
import 'package:final_project_for_flutter_by_jarling/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1; // STARTS AT THE CENTER OR WHAT INDEX WILL GO DEFAULT!
  @override
  Widget build(BuildContext context) {
    //ITEM ROUTES FOR THE NAVIGATION BAR
    final screens = [
      MenuPage(),
      HomeScreen(),
      ProfilePage(),
    ];

    //ITEMS FOR THE BOTTOM NAVIGATION BAR

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
      body: screens[index], //TO CALL SCREEN OR ROUTE BY THE INDEX
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.grey.shade900,
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

// ==--> HOME SCREEN DISPLAY HERE!!! <---==

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
                height: 80,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/images/icons/jarcrown.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Stack(
                children: [
                  // Background image container

                  //TEXT WELCOME
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Welcome\nTo The\nJarking Studio.',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //CHECK OUT GROUP FUNCTION AUTO SCROLL DOWN!!
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
                  //Neumorph designing
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
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
              SizedBox(height: 50),
              //THIS IS THE PART OF SEE MORE WORKS IN OUR CATEGORIES
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

              //CAROUSEL SLIDER PART HERE!!!
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
                    'Assets/images/img-carousel/4.png',
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  Image.asset(
                    'Assets/images/img-carousel/3.png',
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  Image.asset(
                    'Assets/images/img-carousel/5.png',
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  Image.asset(
                    'Assets/images/img-carousel/1.png',
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  Image.asset(
                    'Assets/images/img-carousel/2.png',
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GamesMenu()));
                    },
                    child: Image.asset(
                      'Assets/images/img-carousel/6.png',
                      fit: BoxFit.cover,
                      height: 200.0,
                    ),
                  ),
                  // Add more items as needed
                ],
              ),

              SizedBox(height: 20),
              //PERSONS IMAGE DISPLAY DESIGN
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/images/icons/3143372.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              //PART WHERE GOING TO THE DEVELOPER CARDS!!!
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

              SizedBox(height: 20),

              // ABOUT US SECTION HERE!!!!
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
                      style: TextStyle(
                          fontSize: 17.9,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
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
