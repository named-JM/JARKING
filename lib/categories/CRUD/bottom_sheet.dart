import 'package:final_project_for_flutter_by_jarling/categories/CRUD/crud.dart';
import 'package:flutter/material.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController snController = TextEditingController();
final TextEditingController addressController = TextEditingController();
void createBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              //line 27 para pag nagpop ang keyboard the content sheet will go upward para makita!
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'Create your items',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "eg. Elon",
                  ),
                ),
                TextField(
                  controller: snController,
                  decoration: InputDecoration(
                      labelText: "Namsasae", hintText: "eg. Elon"),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                      labelText: "Address", hintText: "eg. Elon"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      final id = DateTime.now().microsecond.toString();
                      databaseReference.child(id).set({
                        'name': nameController.text.toString(),
                        'sn': snController.text.toString(),
                        'address': addressController.text.toString(),
                        'id': id //gives uniwue id every time
                      });
                    },
                    child: Text('add')),
              ],
            ),
          ),
        );
      });
}
