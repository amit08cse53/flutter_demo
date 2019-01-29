import 'package:flutter/material.dart';

class MyThreeOptions extends StatefulWidget {
  @override
  _MyThreeOptionsState createState() => _MyThreeOptionsState();
}

class _MyThreeOptionsState extends State<MyThreeOptions> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        3,
        (int index) {
          return InputChip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                /*child: Text('AB')*/
              ),
              label: Text('Item $index'),
              /*onPressed: () {
                print('I am the one thing in life.');
              },*/
              selected: _value == index,
              onSelected: (bool selected) {
            setState(() {
              _value = selected ? index : null;
            });
          }
          );



          /*return ChoiceChip(
            avatar: new CircleAvatar(child: new Text("")),
            label: Text('Item $index'),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );*/
        },
      ).toList(),
    );
  }
}
