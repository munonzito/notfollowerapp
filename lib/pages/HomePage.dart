import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unfollowapp/widgets/Loading.dart';
import 'package:unfollowapp/services/getUserData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    dynamic _loginData = ModalRoute.of(context)!.settings.arguments as Map;
    return FutureBuilder(
        future: getUserData(_loginData["username"], _loginData["pw"]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            dynamic _userData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text("NotFollowers Instagram"),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(_userData["profilePic"]),
                    ),
                    SizedBox(height: 15),
                    Text(
                      _loginData["username"],
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      children: [
                        Column(
                          children: [
                            Text(_userData["posts"]),
                            Text(
                              "Posts",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(_userData["followers"]),
                            Text("Followers", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(_userData["following"]),
                            Text("Following", style: TextStyle(fontSize: 15)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/notFollowers',
                              arguments: {
                                "not_followers": _userData["not_followers"]
                              });
                        },
                        child: Text("View not Followers")),
                  ]),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
