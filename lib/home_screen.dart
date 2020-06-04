import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'user.dart';
import 'login.dart';

class HomeScreen extends StatelessWidget {
  // HomeScreen();
  final List<User> userList;

  const HomeScreen({Key key, @required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LoginScreen()));
        },
      ),
      drawer: Container(),
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        title: Text(
          "Life@Yi",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Log out"),
                )
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return _buildUserItem(userList[index]);
          }),
    );
  }

  Widget _buildUserItem(User user) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: Row(children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(user.image),
          // child: Image.network(
          //   "https://storage.googleapis.com/yipl-site/staffs/Umesh.jpg",
          //   height: 80,
          //   width: 80,
          // ),
        ),
        // SizedBox(
        //   width: 20,
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                user.position,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                user.company,
                style: TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
