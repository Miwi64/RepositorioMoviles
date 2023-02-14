import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Center(
            child: Text(
          "Contacto",
          style: TextStyle(fontSize: 25),
        )),
      ), */
      backgroundColor: Colors.teal.shade800,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Column(
              children: const [
                SizedBox(height: 20),
                CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('assets/images/pic.jpg')),
                SizedBox(height: 30),
                Text("Miguel Argote",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text("FLUTTER DEVELOPER",
                    style: TextStyle(
                        fontFamily: 'Lato', fontSize: 22, color: Colors.white)),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(color: Colors.white, thickness: 2, height: 1),
                ),
                SizedBox(height: 30),
              ],
            ),
            Container(
              width: 320,
              height: 70,
              color: Colors.greenAccent,
              child: Row(children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.phone,
                  size: 45,
                  color: Colors.black45,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "646-277-51-08",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Container(
              width: 320,
              height: 70,
              color: Colors.greenAccent,
              child: Row(children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.mail,
                  size: 40,
                  color: Colors.black45,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "miargote@hotmail.com",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
