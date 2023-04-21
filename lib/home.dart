import 'package:flutter/material.dart';
import 'package:pick_a_dish/swipe.dart';
import 'package:pick_a_dish/themes/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final GlobalKey<FormState> codeKey = GlobalKey<FormState>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              width: double.infinity,
              height: screenHeight * .25,
              color: PADColors.primary,
              child: Center(
                child: Text(
                  "Pick a Dish",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "1234",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
            child: Container(
              width: screenWidth * .85,
              height: screenHeight * .5,
              decoration: BoxDecoration(
                  color: PADColors.panel,
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              "or",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: PADColors.primary,
                    fontSize: 20,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 8),
            child: SizedBox(
              width: screenWidth * .45,
              child: TextFormField(
                key: codeKey,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Use A Friend's Code",
                ),
                validator: (String? value) {
                  if (value != null ) {
                    return validateCode(value);
                  }

                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0, top: 8.0),
            child: SizedBox(
              width: screenWidth * .4,
              height: screenHeight * .05,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SwipePage()))
                },
                child: const Center(
                  child: Text("Start"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? validateCode(String value) {
    return null;
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 4,
        size.height - 40,
        size.width / 2,
        size.height - 20,
      )
      ..quadraticBezierTo(
        3 / 4 * size.width,
        size.height,
        size.width,
        size.height - 30,
      )
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
