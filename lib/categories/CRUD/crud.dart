import 'package:final_project_for_flutter_by_jarling/categories/CRUD/bottom_sheet.dart';
import 'package:final_project_for_flutter_by_jarling/categories/CRUD/update.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

final databaseReference = FirebaseDatabase.instance.ref("StoreData");

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "ALBUM SIMPLE CRUD",
        ),
      ),

      //HERE IS FOR READING DISPLAY
      body: Column(
        children: [
          SizedBox(height: 15),
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context, snapshot, animation, index) {
                final heroTag = "heroTag_${snapshot.key}";
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  title: Text(
                    snapshot.child("name").value.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    snapshot.child("person").value.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  leading: Hero(
                    tag: heroTag,
                    child: InkWell(
                      onTap: () {
                        _showFullImageDialog(
                            // this function is to make the image doesnt have uneccesray background
                            context,
                            snapshot.child("img").value.toString());
                      },
                      child: Container(
                        width: 55,
                        height: 50,
                        child: Stack(
                          children: [
                            // Image.network with loading indicator controlled manually
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.network(
                                snapshot.child("img").value.toString(),
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    // Image is fully loaded, hide the loading indicator
                                    return child;
                                  } else {
                                    // Image is still loading, show the loading indicator
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  trailing: PopupMenuButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    itemBuilder: (context) => [
                      //UPDATE FUNCTION HERE
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            updateBottomSheet(
                              context,
                              snapshot.child("name").value.toString(),
                              snapshot.child("id").value.toString(),
                              snapshot.child("img").value.toString(),
                              snapshot.child("person").value.toString(),
                            );
                          },
                          leading: const Icon(Icons.edit),
                          title: const Text("Edit"),
                        ),
                      ),
                      //FOR DELETE HERE!!!
                      PopupMenuItem(
                        value: 2,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context); //auto hide pag nagclick
                            databaseReference
                                .child(snapshot.child('id').value.toString())
                                .remove();
                          },
                          leading: const Icon(Icons.delete),
                          title: const Text("Delete"),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      //TO OPEN THE MODAL BOTTOM SHEET
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => createBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showFullImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Hero(
                tag: "fullscreenHeroTag",
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
