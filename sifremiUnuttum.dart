import 'package:flutter/material.dart';

void main() {
  runApp(sifremiUnuttum());
}

class sifremiUnuttum extends StatefulWidget {
  @override
  _sifremiUnuttumState createState() => _sifremiUnuttumState();
}

class _sifremiUnuttumState extends State<sifremiUnuttum> {
  String eposta;
  final _degeranahtar = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    labelText: "E-posta Adresiniz",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    eposta = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("Gönder"),
                      onPressed: () {
                        _degeranahtar.currentState.save();
                        if (eposta == "") {
                          debugPrint("Form boş gönderilemez!");
                        } else {
                          debugPrint(
                              "$eposta adresine şifre sıfırlama gönderildi");
                          Navigator.pop(context, "/main");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
