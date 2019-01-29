import 'package:flutter/material.dart';

class ActorFilterEntry {
  const ActorFilterEntry(this.name, this.initials);
  final String name;
  final String initials;
}

class CastFilter extends StatefulWidget {
  @override
  State createState() => new CastFilterState();
}

class CastFilterState extends State<CastFilter> {
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Aaron Burr', 'AB'),
    const ActorFilterEntry('Alexander Hamilton', 'AH'),
    const ActorFilterEntry('Eliza Hamilton', 'EH'),
    const ActorFilterEntry('James Madison', 'JM'),
  ];
  List<String> _filters = <String>[];
  static const Color _selectedBackgroundColor = const Color(0x1f0000ff);
  static const Color _unselectedLabelColor = const Color(0xde000000);
  static const Color _selectedLabelColor = const Color(0xde0000ff);

  Iterable<Widget> get actorWidgets sync* {
    ChipThemeData currentTheme = ChipTheme.of(context);
    for (ActorFilterEntry actor in _cast) {
      bool selected = _filters.contains(actor.name);
      yield new Padding(
        padding: const EdgeInsets.all(4.0),
        child: ChipTheme(
          data: currentTheme.copyWith(
            selectedColor: _selectedBackgroundColor,
            labelStyle: currentTheme.labelStyle.copyWith(
              color: selected ? _selectedLabelColor : _unselectedLabelColor,
            ),
          ),
          child: new ChoiceChip(
            avatar: selected ? new CircleAvatar(child: new Text("s")) : new CircleAvatar(child: new Text("f")) ,
            label: new Text(actor.name),
            selected: selected,
            onSelected: (bool value) {
              setState(() {
                if (value) {
                  _filters.add(actor.name);
                } else {
                  _filters.removeWhere((String name) {
                    return name == actor.name;
                  });
                }
              });
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Wrap(
          children: actorWidgets.toList(),
        ),
        new Text('Look for: ${_filters.join(', ')}'),
      ],
    );
  }
}
/*
class ActorFilterEntry {
  const ActorFilterEntry(this.name, this.initials);
  final String name;
  final String initials;
}

class CastFilter extends StatefulWidget {
  @override
  State createState() => CastFilterState();
}

class CastFilterState extends State<CastFilter> {
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Aaron Burr', 'AB'),
    const ActorFilterEntry('Alexander Hamilton', 'AH'),
    const ActorFilterEntry('Eliza Hamilton', 'EH'),
    const ActorFilterEntry('James Madison', 'JM'),
  ];
  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (ActorFilterEntry actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
//          avatar: CircleAvatar(child: Text(actor.initials)),
          avatar: CircleAvatar(backgroundColor: Color(0xFFFFFFFF)),
          label: Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: actorWidgets.toList(),
        ),
        Text('Look for: ${_filters.join(', ')}'),
      ],
    );
  }
}*/
