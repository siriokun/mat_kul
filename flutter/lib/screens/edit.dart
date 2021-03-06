import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../env.dart';
import '../models/student.dart';
import '../widgets/form.dart';

class Edit extends StatefulWidget {
  final Student student;
  Edit({this.student});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
// This is  for form validations
  final formKey = GlobalKey<FormState>();
// This is for text onChange
  TextEditingController kodeController;
  TextEditingController nameController;
  TextEditingController sksController;
  TextEditingController semesterController;
  TextEditingController dosenController;
// Http post request
  Future editStudent() async {
    return await http.post(
      "${Env.URL_PREFIX}/update.php",
      body: {
        "id": widget.student.id.toString(),
        "kode": kodeController.text,
        "name": nameController.text,
        "sks": sksController.text,
        "semester": semesterController.text,
        "dosen": dosenController.text
      },
    );
  }

  void _onConfirm(context) async {
    await editStudent();
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.student.name);
    dosenController = TextEditingController(text: widget.student.dosen.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text('CONFIRM'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            _onConfirm(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              dosenController: dosenController,
            ),
          ),
        ),
      ),
    );
  }
}
