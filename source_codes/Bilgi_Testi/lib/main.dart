import 'package:bilgi_testi/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
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
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  int soruIndex = 0;
  List<Soru> soruBankasi = [
    Soru('1.Titanic gelmiş geçmiş en büyük gemidir', false),
    Soru('2.Dünyadaki tavuk sayısı insan sayısından fazladır', true),
    Soru('3.Kelebeklerin ömrü bir gündür', false),
    Soru('4.Dünya düzdür', false),
    Soru('5.Kaju fıstığı aslında bir meyvenin sapıdır', true),
    Soru('6.Fatih Sultan Mehmet hiç patates yememiştir', true),
    Soru('7.Fransızlar 80 demek için, 4 - 20 der', true),
    Soru("null", false)
  ];
  int puan = 0;
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
                soruIndex <= 6
                    ? soruBankasi[soruIndex].soruMetni
                    : "Sorular Bitti Puanın=$puan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(children: secimler),
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
                            bool dogruYanit = soruBankasi[soruIndex].soruYaniti;

                            setState(() {
                              if (soruIndex <= 6) {
                                if (dogruYanit == false) {
                                  secimler.add(kDogruIconu);
                                  puan = puan + 10;
                                } else {
                                  secimler.add(kYanlisIconu);
                                }
                                soruIndex++;
                              }
                            });
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
                              bool dogruYanit =
                                  soruBankasi[soruIndex].soruYaniti;
                              if (soruIndex <= 6) {
                                if (dogruYanit == true) {
                                  secimler.add(kDogruIconu);
                                  puan = puan + 10;
                                } else {
                                  secimler.add(kYanlisIconu);
                                }
                                soruIndex++;
                              }
                            });
                          },
                        ))),
              ])),
        ),
      ],
    );
  }
}

class Soru {
  String soruMetni;
  bool soruYaniti;
  Soru(@required this.soruMetni, @required this.soruYaniti);
}
