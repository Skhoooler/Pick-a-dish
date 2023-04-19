import 'package:flutter/material.dart';
import 'package:pick_a_dish/swipe.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Pick a Dish", style: Theme.of(context).textTheme.headline1,),
          Text("Your Code: 1234", style: Theme.of(context).textTheme.headline2,),
          Text("David", style: Theme.of(context).textTheme.bodyText1,),
          Text("Anna", style: Theme.of(context).textTheme.bodyText1,),
          Text("Ben", style: Theme.of(context).textTheme.bodyText1,),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SwipePage()))
                  },
              child: Text("Start")),
          Text("Or join another room"),
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter Code Here"),
          ),
        ],
      ),
    );
  }
}
