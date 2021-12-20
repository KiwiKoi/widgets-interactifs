import 'package:flutter/material.dart';

class InteractivePage extends StatefulWidget {
  @override
  InteractivePageState createState() => InteractivePageState();
}

class InteractivePageState extends State<InteractivePage> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  bool textButtonPressed = false;
  IconData icon = Icons.favorite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(updateAppBarText()),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: updateAppBar, child: textButtonText(),
            style: TextButton.styleFrom(
              primary: Colors.blue,
              shadowColor: Colors.green,
            ) ),
            ElevatedButton(
                onPressed: () {
                  print("Salut");
                },
                child: const Text('Elevated'),
              onLongPress: () {
                print('Long press');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                elevation: 10,
                shadowColor: Colors.red
              )
            ),
            IconButton(
              onPressed: setIcon,
              icon: Icon(icon),
              color: Colors.pink,
              splashColor: Colors.pinkAccent,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateColors,
        child: Icon(Icons.build),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  updateColors() {
    setState(() {
      backgroundColor =
          (backgroundColor == Colors.white) ? Colors.black : Colors.white;
    });
  }

  String updateAppBarText() {
    return (textButtonPressed) ? "I know a bit" : "The interactives";
  }

  updateAppBar() {
    setState(() => textButtonPressed = !textButtonPressed);
  }

  Text textButtonText() {
    return const Text(
      "I am a TextButton",
      style: TextStyle(),
    );
  }

  setIcon() {
    setState(() {
      icon = (icon == Icons.favorite) ? Icons.favorite_border : Icons.favorite;
    });
  }
}
