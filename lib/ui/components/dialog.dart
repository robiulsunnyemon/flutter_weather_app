import 'package:flutter/material.dart';

showTextInputDialog(
    {required BuildContext context,
    required TextEditingController textFieldController}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search Location'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: "search by city,zip"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  if (textFieldController.text.isEmpty) {
                    return;
                  }
                  Navigator.pop(context, textFieldController.text);
                }),
          ],
        );
      });
}
