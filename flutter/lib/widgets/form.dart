import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
// Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
// Handles text onchange
  TextEditingController kodeController;
  TextEditingController nameController;
  TextEditingController sksController;
  TextEditingController semesterController;
  TextEditingController dosenController;
  AppForm({this.formKey, this.kodeController, this.nameController, this.sksController, this.semesterController, this.dosenController});
  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  String _validateInput(String value) {
    if (value.length < 6) return 'Minimal 5 karakter';
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
            controller: widget.dosenController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Kode Mata Kuliah'),
            validator: _validateInput,
          ),
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Nama Mata Kuliah'),
            validator: _validateInput,
          ),
          TextFormField(
            controller: widget.sksnController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'SKS'),
            validator: _validateInput,
          ),
          TextFormField(
            controller: widget.semesterController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Semester'),
            validator: _validateInput,
          ),
          TextFormField(
            controller: widget.dosenController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Dosen'),
            validator: _validateInput,
          ),
        ],
      ),
    );
    ;
  }
}
