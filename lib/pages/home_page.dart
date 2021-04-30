import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import "package:http/http.dart" as http;

// import '../changeName_card.dart';
import '../drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();

  var myText = "Change Me";
  // API url for accessing the data
  // var url = Uri.https('www.jsonplaceholder.typicode.com', '/photos');
  // var url = "https://jsonplaceholder.typicode.com/photos";
  // var url = Uri.https("jsonplaceholder.typicode.com/photos");
  // var uri = Uri.https("www.jsonplaceholder.typicode.com", "/photos");
  var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // var res = await http.get(url);
    // print(res.body);
    // data = jsonDecode(res.body);
    // setState(() {});
    //
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    data = jsonDecode(response.body);
    // print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("LoggedIn", false);
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
      ),
      // body: Container(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(data[index]["title"]),
                      subtitle: Text("ID: ${data[index]["id"]}"),
                      leading: Image.network(data[index]["url"]),
                    ),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      // creates a menu icon
      drawer: MyDrawer(),
      // creates a floation aciton button
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
