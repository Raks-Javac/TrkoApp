import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm delete"),
      content: Text("Are you sure you want to delete this item ?"),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Yes"),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text("No"),
        ),
      ],
    );
  }
}
