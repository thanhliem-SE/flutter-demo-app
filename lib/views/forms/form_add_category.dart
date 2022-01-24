import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/service/category_service.dart';
import 'package:image_picker/image_picker.dart';

class FormAddCategory extends StatefulWidget {
  final Function(Category) notifyAddFrom;
  const FormAddCategory({Key? key, required this.notifyAddFrom})
      : super(key: key);

  @override
  _FormAddCategoryState createState() => _FormAddCategoryState();
}

class _FormAddCategoryState extends State<FormAddCategory> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  late XFile? _image;

  Future getImagefromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future getImagefromcamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FloatingActionButton(
                onPressed: getImagefromGallery,
                tooltip: "Pick Image",
                child: Icon(Icons.image),
                backgroundColor: Colors.amber[200],
              ),
            ),
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter category name';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter category name',
                prefixIcon: Icon(Icons.category_rounded),
              ),
            ),
            TextFormField(
              controller: descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter category description';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter category description',
                prefixIcon: Icon(Icons.description_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[300],
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Category category = Category(
                        name: nameController.text,
                        description: descriptionController.text,
                        img: "",
                        index: 0);
                    CategoryService().addCategory(category);
                    widget.notifyAddFrom(category);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
