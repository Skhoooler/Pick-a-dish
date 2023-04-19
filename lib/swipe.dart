import 'package:flutter/material.dart';
import 'package:pick_a_dish/themes/colors.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      key: _scaffoldKey,

      body: Stack(
        children: [
          IconButton(
            onPressed: () =>
            {
              _scaffoldKey.currentState?.openDrawer(),
            },
            icon: Icon(Icons.menu, color: PADColors.primary),
          ),

          Column(
            children: [
              SizedBox(height: screenHeight * .7),
              Text("Food Name"),
              Text("Person Name"),
            ],
          ),

          // PUT IMAGE HERE
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                title: const Text("Return"),
                onTap: () =>
                {
                  // Return two pages (one to get out of the drawer, and another to get back to the home page
                  Navigator.of(context)
                    ..pop()..pop()
                }),
          ],
        ),
      ),
    );
  }
}
