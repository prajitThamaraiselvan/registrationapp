import 'package:flutter/material.dart';
import 'package:forelius/loginpage.dart';
import 'package:forelius/registerpage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _LoginPageState();
}

class _LoginPageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * 0.7;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: imageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    
                  },
                  color: Colors.red,
                  icon: Icon(Icons.settings),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: width - 130,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 176, 10, 101), const Color.fromARGB(255, 191, 40, 10)], 
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, 
                  shadowColor: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), 
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15), 
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: width-130,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 176, 10, 101), const Color.fromARGB(255, 191, 40, 10)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
               
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, 
                  shadowColor: Colors.transparent, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), 
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15), 
                ),
                child: Text(
                  'Join us',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              
              
            ),
          )
        ],
      ),
    );
  }
}
