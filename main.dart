import 'package:flutter/material.dart';
import 'anaSayfa.dart';
import 'uyeOl.dart';
import 'sifremiUnuttum.dart';

void main() {
  runApp(koksalVize());
}

class koksalVize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/anaSayfa": (context) => anaSayfa(),
        "/uyeOl": (context) => uyeOl(),
        "/sifremiUnuttum": (context) => sifremiUnuttum(),
      },
      home: new loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String kadi;
  String sifre;
  final _degeranahtar = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _degeranahtar,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adınız:",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    kadi = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Parolanız",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    sifre = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("Giriş"),
                      onPressed: () {
                        _degeranahtar.currentState.save();
                        if (kadi == "demo" && sifre == "demo") {
                          Navigator.pushNamed(context, "/anaSayfa");
                        } else {
                          debugPrint("Kullanıcı adınız veya şifre hatalı");
                        }
                      },
                    ),
                    MaterialButton(
                      child: Text("Şifre Al"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/sifremiUnuttum");
                      },
                    ),
                    MaterialButton(
                      child: Text("Üye Ol"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/uyeOl");
                      },
                    ),
                  ],
                ),
SizedBox(height: 5),

                (
                    child: Text('Köksal ÖRS',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.red))),

                SizedBox(height: 20),

               

              ],
            ),
          ),
        ),
      ),
    );
  }
}
