import 'package:final_project_for_flutter_by_jarling/categories/CRUD/crud.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController imgController = TextEditingController();
final TextEditingController personController = TextEditingController();

void createBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "ADD YOUR ALBUM OF THE DAY!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  hintText: "ex: LMAO Girl LMFAO",
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: imgController,
                decoration: const InputDecoration(
                  labelText: "Image URL",
                  hintText: "Enter image URL",
                ),
              ),
              TextField(
                controller: personController,
                decoration: const InputDecoration(
                  labelText: "By",
                  hintText: "ex: Nicki Minaj/Spongebob",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final id = DateTime.now().microsecond.toString();

                  // Validate the image URL
                  if (!isValidImageUrl(imgController.text.toString())) {
                    // If invalid, show a Toast
                    Fluttertoast.showToast(
                      msg: 'Error: Invalid image URL',
                      backgroundColor: Colors.red,
                    );
                    return; // Stop further execution
                  }

                  // Attempt to add the data to the database
                  try {
                    databaseReference.child(id).set({
                      'name': nameController.text.toString(),
                      'img': imgController.text.toString(),
                      'person': personController.text.toString(),
                      'id': id,
                    });

                    // For clear the controller
                    nameController.clear();
                    imgController.clear();
                    personController.clear();
                    // For Dismiss the keyboard after adding items
                    Navigator.pop(context);
                  } catch (error) {
                    // If another error occurs, show a Toast
                    Fluttertoast.showToast(
                      msg: 'Error: $error',
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: const Text("add"),
              ),
            ],
          ),
        ),
      );
    },
  );
}

bool isValidImageUrl(String url) {
  // Use a simple regular expression to check if the URL is in a valid format
  RegExp regExp = RegExp(
    r'^(https?|ftp):\/\/[^\s\/$.?#].[^\s]*$',
    caseSensitive: false,
    multiLine: false,
  );
  return regExp.hasMatch(url);
}
