import 'package:flutter/material.dart';

Widget buildTagTile(
    {MaterialColor color = Colors.grey,
    String text = "",
    void Function()? onClose}) {
  return UnconstrainedBox(
    child: Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              IconButton(
                onPressed: onClose == null ? () {} : onClose,
                icon: Icon(Icons.close),
                iconSize: 15,
                splashRadius: 1,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              Text(text),
            ],
          )),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
    ),
  );
}
