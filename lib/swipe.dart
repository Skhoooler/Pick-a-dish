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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          IconButton(
            onPressed: () => {
              _scaffoldKey.currentState?.openDrawer(),
            },
            icon: Icon(Icons.menu, color: PADColors.primary),
            alignment: Alignment.topRight,
          ),

          Column(
            children: [
              SizedBox(height: screenHeight * .83),
              Text(
                "Food Name",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                "Person Name",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),

          // PUT IMAGE HERE
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .05,),
            ListTile(
                title: Text(
                  "Home",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 32),
                ),
                onTap: () => {
                      // Return two pages (one to get out of the drawer, and another to get back to the home page
                      Navigator.of(context)
                        ..pop()
                        ..pop()
                    }),
          ],
        ),
      ),
    );
  }
}
