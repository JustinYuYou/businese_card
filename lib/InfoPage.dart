import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'HomePage.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();
  final gitController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget customizedTextInput(String hint, String text, IconData icon,
      TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: text,
          labelText: '$hint *',
          icon: FaIcon(icon),
        ),
        onChanged: (input) {
          setState(() {});
          print(controller.text);
        },
        validator: (input) => input.isEmpty ? "Please enter $hint" : null,
        onSaved: (_str) => controller.text = _str,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My business card',
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Fill Info",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                customizedTextInput('Name', 'Enter your name',
                    FontAwesomeIcons.user, nameController),
                customizedTextInput('Phone Number', 'Enter your phone number',
                    FontAwesomeIcons.phone, phoneController),
                customizedTextInput('Email Address', 'Enter your email address',
                    Icons.mail, mailController),
                customizedTextInput(
                    'Github Username',
                    'Enter your github username',
                    FontAwesomeIcons.github,
                    gitController),
                IconButton(
                  icon: Icon(Icons.file_upload),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 20,
          onPressed: () {
            var form = _formKey.currentState;

            if (form.validate()) {
              form.save();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(
                        nameController.text,
                        gitController.text,
                        phoneController.text,
                        mailController.text)),
              );
            }
          },
          child: FaIcon(
            FontAwesomeIcons.arrowRight,
          ),
        ),
      ),
    );
  }
}
