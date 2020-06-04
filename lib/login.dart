import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey();
  String email;
  String password;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _onLoginPressed() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    this.isLoading = true;
    this.setState(() {});

    await Future.delayed(Duration(seconds: 4), () {});
    this.setState(() {
      this.isLoading = false;
    });
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text("email: $email password: $password"),
    // ));
    _key.currentState.showSnackBar(SnackBar(
      content: Text("email: $email password: $password"),
    ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(
              userList: User.getDummyUser(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              bottom: 0,
              left: 8,
              right: 8,
              child: Image.asset("images/yipl-logo.png")),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(32),
              color: Color(0x66000000),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Colors.green, fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      validator: (value) {
                        return value.isEmpty ? "Please enter email" : null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.green, fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      validator: (value) =>
                          value.isEmpty ? "Please enter password" : null,
                      onSaved: (value) => password = value,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    this.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            color: Color(0xffF06924),
                            onPressed: () {
                              this._onLoginPressed();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
