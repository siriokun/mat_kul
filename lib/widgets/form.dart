import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
// Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
// Handles text onchange
  TextEditingController nameController;
  TextEditingController dosenController;
  AppForm({this.formKey, this.nameController, this.dosenController});
  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  String _validateName(String value) {
    if (value.length < 6) return 'Minimal 5 karakter';
    return null;
  }

  String _validateAge(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Kode dosen berupa angka';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.dosenController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Kode Dosen'),
            validator: _validateAge,
          ),
        ],
      ),
    );
    ;
  }
}
