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
  String firstName = "";
  late TextEditingController controller;
  bool switchValue = true;
  double sliderValue = 50;
  bool check = false;
  Map<String, bool> articles = {
    "Carrots" : false,
    "Onion" : true,
    "Abricot": false,
  };
  int groupValue = 1;
  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
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
            TextButton(
                onPressed: updateAppBar,
                child: textButtonText(),
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  shadowColor: Colors.green,
                )),
            ElevatedButton(
                onPressed: (() => showDate(context)),
                child: Text('$initialDate'),
                onLongPress: () {
                  print('Long press');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    elevation: 10,
                    shadowColor: Colors.red)),
            IconButton(
              onPressed: setIcon,
              icon: Icon(icon),
              color: Colors.pink,
              splashColor: Colors.pinkAccent,
            ),
            TextField(
                obscureText: false,
                decoration: InputDecoration(
                    hintText: "Enter your first name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (newString) {
                  setState(() {
                    firstName = newString;
                  });
                }),
            Text(firstName),
            TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "Enter your last name"),
                onChanged: ((newValue) => setState(() => print("Done")))),
            Text(controller.text),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text((switchValue) ? "I like cats" : "Cats are evil"),
                Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                  inactiveThumbColor: Colors.redAccent,
                  value: switchValue,
                  onChanged: ((bool) {
                    setState(() {
                      switchValue = bool;
                    });
                  }),
                ),
              ],
            ),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: ((newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              }),
              thumbColor: Colors.deepPurple,
              inactiveColor: Colors.brown,
              activeColor: Colors.yellow,
            ),
            Text("Value: ${sliderValue.toInt()}"),
            Checkbox(value: check, onChanged: ((newBool) => setState(() => check = newBool ?? false))),
            checks(),
radios(),
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

  Column checks() {
    List<Widget> items = [];
    articles.forEach((article, purchased){
  Widget row = Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(article),
      Checkbox(value: purchased, onChanged: ((newValue) {
setState(() {
  articles[article] = newValue ?? false;
});
      }))
    ],
  );
  items.add(row);
    });
    return Column(children: items);
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 5; i++) {
      Radio r = Radio(
        value: i,
        groupValue: groupValue,
        onChanged: ((newValue) {
          setState(() {
            groupValue = newValue;
          });
        }
        ),
      );
      radios.add(r);
    }
  return Row(children: radios);
  }

  showDate(BuildContext context){
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1992),
      lastDate: DateTime(2090),
    ).then((value) => {
      if (value != null){
        setState(() {
          initialDate = value;
        })
      }
    });
  }
}
