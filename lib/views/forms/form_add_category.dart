import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/category.dart';
import 'package:food_ordering_app/service/category_service.dart';

class FormAddCategory extends StatefulWidget {
  const FormAddCategory({Key? key}) : super(key: key);

  @override
  _FormAddCategoryState createState() => _FormAddCategoryState();
}

class _FormAddCategoryState extends State<FormAddCategory> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

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
                  primary: Colors.green[400],
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Category category = Category(
                        name: nameController.text,
                        description: descriptionController.text,
                        img: "",
                        index: 0);
                    CategoryService().addCategory(category);
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
