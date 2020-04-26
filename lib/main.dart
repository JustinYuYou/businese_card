import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InfoPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String username;
  MyHomePage(this.username);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageURL = 'images/profile.jpg';
  String githubUserName = 'JustinYuYou';
  String phoneNumber = '2083922466';
  String emailAddress = 'chentingyu0117@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(imageURL),
              radius: 70.0,
            ),
            Text(
              widget.username,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DancingScript-VariableFont_wght'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text(emailAddress),
                  onTap: () {
                    launch('mailto:$emailAddress');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 30.0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(phoneNumber),
                  onTap: () {
                    launch('tel:$phoneNumber');
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () =>
                      _launchURL('https://github.com/$githubUserName'),
                  icon: FaIcon(FontAwesomeIcons.github),
                  tooltip: 'Go to my github',
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  tooltip: 'Go to my facebook',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class InfoPage extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My business card'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('What is your name?'),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                  ),
                  onChanged: (String value) {
                    value[0].toUpperCase();
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(myController.text)),
            );
          },
          child: FaIcon(
            FontAwesomeIcons.arrowRight,
          ),
        ),
      ),
    );
  }
}
