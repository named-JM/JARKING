import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class DeveloperCard extends StatefulWidget {
  const DeveloperCard({Key? key}) : super(key: key);

  @override
  State<DeveloperCard> createState() => _DeveloperCardState();
}

class _DeveloperCardState extends State<DeveloperCard> {
  final List<Developer> developers = [
    Developer(
      'Joanna Caguco',
      'Project Manager & UI/UX Designer',
      'Assets/images/profile-img/joanna_image.jpg',
      //age: 20,
      education: '3rd Year Computer Science Major',
      skills: [
        'Flutter',
        'Java',
        'HTML',
        'CSS',
        'JS',
        'Excel',
        'Bootstrap',
        'Photoshop',
      ],
    ),
    Developer(
      'Carl Balano',
      'Game Developer & Lead Programmer',
      'Assets/images/profile-img/carl_image.jpg',
      //age: 21,
      education: '3rd Year Computer Science Major',
      skills: [
        'Flutter',
        'Java',
        'C',
        'HTML',
        'CSS',
        'JS',
        'Bootstrap',
        'Excel',
        'MS Office'
      ],
    ),
    Developer(
      'King Martinez',
      'IT Assistant',
      'Assets/images/profile-img/king_image.jpg',
      //age: 25,
      education: '3rd Year Computer Science Major',
      skills: [
        'Flutter',
        'Java',
        'C',
        'HTML',
        'CSS',
        'JS',
        'Excel',
        'Hardware'
      ],
    ),
    // Add more developers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            // Image.asset(
            //   'Assets/images/blobs/4907578.jpg',
            //   width: double.infinity,
            //   height: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //padding: const EdgeInsets.all(.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Add navigation logic
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "Meet our team!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Swiper(
                    itemCount: developers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DeveloperCardItem(developer: developers[index]);
                    },
                    viewportFraction: 0.8,
                    scale: 0.9,
                    pagination: SwiperPagination(),
                    control: SwiperControl(
                      color: Colors.black,
                      iconNext: Icons
                          .arrow_forward_ios, // Change the right arrow icon
                      iconPrevious: Icons.arrow_back_ios,
                    ),
                  ),
                ),
                Container(
                  height: 100.0, // Adjust the height of the space at the bottom
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Developer {
  final String name;
  final String role;
  final String image;
  // final int age;
  final String education;
  final List<String> skills;

  Developer(
    this.name,
    this.role,
    this.image, {
    required this.education,
    required this.skills,
  });
}

// Modify the DeveloperCardItem widget to display the additional details
class DeveloperCardItem extends StatelessWidget {
  final Developer developer;

  const DeveloperCardItem({required this.developer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          //bottom right shadow is darker
          BoxShadow(
            color: Colors.grey.shade600,
            offset: Offset(5, 5),
            blurRadius: 5,
            //spreadRadius: 0,
          ),

          //top left shadow is lighter
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(developer.image),
                ),
                const SizedBox(height: 35),
                Text(
                  developer.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
                Text(
                  developer.role,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  developer.education,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 5.0,
                  runSpacing: 0.0,
                  children: developer.skills
                      .map((skill) => Chip(
                            label: Text(skill),
                          ))
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
