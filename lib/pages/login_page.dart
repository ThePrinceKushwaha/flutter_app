import 'package:flutter/material.dart';
import 'package:flutter_app/bg_image.dart';
import 'package:flutter_app/utils/constants.dart';

class LoginPage extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            BgImage(),
            Center(
              child: SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Form(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter Username",
                                  labelText: "Username"),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password")),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomePage(),
                          //     ));
                          //
                          Constants.prefs.setBool("LoggedIn", true);
                          // Navigator.pushNamed(context, "/home");
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        child: Text('Sign In'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
