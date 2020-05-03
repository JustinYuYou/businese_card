import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  final String username;
  final String githubUserName;
  final String phoneNumber;
  final String emailAddress;

  MyHomePage(
      this.username, this.githubUserName, this.phoneNumber, this.emailAddress);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageURL = 'images/profile.jpg';

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
                  title: Text(widget.emailAddress),
                  onTap: () {
                    launch('mailto:${widget.emailAddress}');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 30.0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(widget.phoneNumber),
                  onTap: () {
                    launch('tel:${widget.phoneNumber}');
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () =>
                      _launchURL('https://github.com/${widget.githubUserName}'),
                  icon: FaIcon(FontAwesomeIcons.github),
                  tooltip: 'Go to my github',
                ),
                IconButton(
                  onPressed: () {},
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
