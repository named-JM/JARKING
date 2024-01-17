import 'package:final_project_for_flutter_by_jarling/categories/CRUD/crud.dart';
import 'package:flutter/material.dart';

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
                    onPressed: () {
                      final id = DateTime.now().microsecond.toString();
                      databaseReference.child(id).set({
                        'name': nameController.text.toString(),
                        'img': imgController.text.toString(),
                        'person': personController.text.toString(),
                        'id': id //It's give the unique id every time.
                      });
                      // For clear the controller
                      nameController.clear();
                      imgController.clear();
                      personController.clear();
                      //For Dismiss the keyboard afte adding items
                      Navigator.pop(context);
                    },
                    child: const Text("add"))
              ],
            ),
          ),
        );
      });
}
