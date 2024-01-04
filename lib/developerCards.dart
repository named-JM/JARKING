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
      'Project Manager/UI Designer',
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
        'Figma'
      ],
    ),
    Developer(
      'Carl Balano',
      'Mobile App Developer',
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
      'App Developer',
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
      backgroundColor: Colors.grey.shade900,
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
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade200,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Add navigation logic
                        },
                      ),
                      SizedBox(width: 20),
                      // Text(
                      //   'Meet our Team!',
                      //   style: TextStyle(
                      //     fontSize: 35,
                      //     color: Colors.grey,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                    ],
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
                    control: SwiperControl(),
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
    // this.age = 0,
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
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 240,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.asset(
                developer.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
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
              SizedBox(
                  height:
                      10), // Adjust the space between role and additional details
              // Text(
              //   "${developer.age} Years old",
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // ),
              Text(
                developer.education,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                  height: 30), // Adjust the space between education and skills
              Wrap(
                spacing: 5.0, // Adjust the spacing between skills
                runSpacing: 1.0,
                children: developer.skills
                    .map((skill) => Chip(label: Text(skill)))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
