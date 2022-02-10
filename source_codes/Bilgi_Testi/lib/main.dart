import 'package:bilgi_testi/constants.dart';
import 'package:flutter/material.dart';

import 'test_veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({Key? key}) : super(key: key);

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri test_1 = TestVeri();
  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      setState(() {
        if (test_1.getSoruYaniti() == secilenButon) {
          secimler.add(kDogruIconu);
          test_1.puanVer(10);
        } else {
          secimler.add(kYanlisIconu);
        }
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sorular Bitti"),
              content: Text("Tebrikler, puanınız=${test_1.getPuan()}"),
              actions: <Widget>[
                TextButton(
                    child: Text("Tekrar Dene"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        test_1.puanSifirla();
                        secimler = [];
                        test_1.sifirla();
                      });
                    }),
              ],
            );
          });
    } else {
      setState(() {
        if (test_1.getSoruYaniti() == secilenButon) {
          secimler.add(kDogruIconu);
          test_1.puanVer(10);
        } else {
          secimler.add(kYanlisIconu);
        }
        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(children: secimler),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              butonFonksiyonu(true);
                            });
                          },
                        ))),
              ])),
        ),
      ],
    );
  }
}
