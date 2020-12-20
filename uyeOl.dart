import 'package:flutter/material.dart';

void main() {
  runApp(uyeOl());
}

class uyeOl extends StatefulWidget {
  @override
  _uyeOlState createState() => _uyeOlState();
}

class _uyeOlState extends State<uyeOl> {
  String eposta;
  String kadi;
  String sifre;
  String tsifre;
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adınız",
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
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Tekrar Parolanız",
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    tsifre = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("Vazgeç"),
                      onPressed: () => Navigator.pop(context, "/main"),
                    ),
                    RaisedButton(
                      child: Text("Kaydol"),
                      onPressed: () {
                        _degeranahtar.currentState.save();
                        if (eposta.isEmpty ||
                            kadi.isEmpty ||
                            sifre.isEmpty ||
                            tsifre.isEmpty) {
                          debugPrint("Bilgi alanları boş bırakılamaz!");
                        } else if (sifre != tsifre) {
                          debugPrint(
                              "Parola ve Parola Tekrarınız Birbiri İle Uyuşmuyor.");
                        } else {
                          debugPrint("E-posta Adresiniz: $eposta");
                          debugPrint("Parolanız: $sifre");
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
