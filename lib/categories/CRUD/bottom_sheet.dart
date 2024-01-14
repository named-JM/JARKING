import 'package:flutter/material.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController snController = TextEditingController();
final TextEditingController addController = TextEditingController();
void createBottomSheet(BuildContext context) {
  showModalBottomSheet(
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
            padding: const EdgeInsets.all(20.0),
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
                  controller: addController,
                  decoration: InputDecoration(
                      labelText: "Address", hintText: "eg. Elon"),
                ),
                ElevatedButton(onPressed: () {}, child: Text('add'))
              ],
            ),
          ),
        );
      });
}
