import 'package:flutter/material.dart';
import 'package:forelius/homepage.dart';
import 'package:forelius/loginpage.dart';
import 'package:forelius/registerpage.dart';

class FirstScreen extends StatefulWidget {
  final String username;

  const FirstScreen({super.key, required this.username});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0; 

  void _onBottomNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * 0.3;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: imageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/hometop.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homepage()));
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                ),
              ),
              Positioned(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/profile.png',
                      width: 100,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 150,
                child: Text(
                  "Hi ${widget.username} ...",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 67, 58, 58),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 330,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/working.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Offers for you",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 67, 58, 58),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Action for "See All" button
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
               
                Transform.rotate(
                  angle: -0.2, 
                  child: Container(
                    width: 150, 
                    margin: EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Myntra1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                // Center image
                Container(
                  width: 150, // Adjust the width as needed
                  margin: EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Myntra2.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              
                Transform.rotate(
                  angle: 0.2, 
                  child: Container(
                    width: 150, 
                    margin: EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Myntra3.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTapped,
        selectedItemColor: Colors.black, 
        unselectedItemColor: Colors.grey, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_sharp),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
