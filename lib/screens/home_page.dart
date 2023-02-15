import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Welcome",
                style: TextStyle(color: Colors.black),
              )),
          leading: const Padding(
              padding: EdgeInsets.only(left: 15),
              child: InkWell(
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/images/photo.jpg"),
                ),
              )),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 14.0),
              child: Icon(
                Icons.notifications,
                color: Colors.orange,
                size: 30,
              ),
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: SafeArea(child: Text("")),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.travel_explore), label: "Explore"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Messages"),
          ],
        ));
  }
}
