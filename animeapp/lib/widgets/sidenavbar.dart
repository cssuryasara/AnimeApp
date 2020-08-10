import 'package:flutter/material.dart';

//packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
Widget sidenavbar() {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 500,
              width: 350,
              color: Color(0xffc4c4c4),
              child: Expanded(
                child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                   Image.asset('assests/drawer.jpg'),
                    ListTile(
                      leading: Icon(Icons.search),
                      title: Text('Search Anime'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Log Out'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }