import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) =>
      ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w700),
        ),
        onTap: tapHandler,
      );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking App',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed('/')),
          buildListTile(
              'Filters',
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextButton(
              //     onPressed: _launchURL,
              //     child: Icon(
              //       Icons.facebook,
              //       size: 30,
              //       color: Colors.blue,
              //     )),
              IconButton(
                  icon: Image.asset("../../assets/Icon//facebook.png"),
                  hoverColor: Colors.white,
                  onPressed: () =>
                      _launchURL('https://www.facebook.com/cloud283')),
              IconButton(
                icon: Image.asset(
                  "../../assets/Icon/instagram.png",
                ),
                hoverColor: Colors.white,
                onPressed: () =>
                    _launchURL('https://www.instagram.com/softwarecloud283/'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

_launchURL(url) async {
  // const url = 'https://www.facebook.com/cloud283';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
