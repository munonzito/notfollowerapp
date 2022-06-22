import 'package:flutter/material.dart';

class ViewNotFollowers extends StatefulWidget {
  const ViewNotFollowers({Key? key}) : super(key: key);

  @override
  State<ViewNotFollowers> createState() => _ViewNotFollowersState();
}

class _ViewNotFollowersState extends State<ViewNotFollowers> {
  @override
  Widget build(BuildContext context) {
    dynamic _data = ModalRoute.of(context)!.settings.arguments;
    final users = _data["not_followers"];
    return Scaffold(
        appBar: AppBar(
          title: Text("Not Followers"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return buildListTile("@${users[index]}");
              }),
        ));
  }
}

Widget buildListTile(String title) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        radius: 20,
        child: Icon(Icons.person),
      ),
      title: Text(title),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
