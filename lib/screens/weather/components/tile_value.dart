import 'package:flutter/material.dart';

class TileValue extends StatelessWidget {
  const TileValue({
    Key? key,
    this.label,
    this.value,
    this.iconData,
  }) : super(key: key);

  final String? label;
  final String? value;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label ?? "",
          style: TextStyle(color: Theme.of(context).accentColor.withAlpha(80)),
        ),
        SizedBox(
          height: 5,
        ),
        this.iconData != null
            ? Icon(
                this.iconData,
                color: Theme.of(context).accentColor,
                size: 20,
              )
            : SizedBox(),
        SizedBox(
          height: 10,
        ),
        Text(
          value ?? '',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ],
    );
  }
}
