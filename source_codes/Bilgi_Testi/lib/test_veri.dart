import 'package:bilgi_testi/soru.dart';

class TestVeri {
  int _soruIndex = 0;
  int _puan = 0;
  List<Soru> _soruBankasi = [
    Soru('1.Titanic gelmiş geçmiş en büyük gemidir', false),
    Soru('2.Dünyadaki tavuk sayısı insan sayısından fazladır', true),
    Soru('3.Kelebeklerin ömrü bir gündür', false),
    Soru('4.Dünya düzdür', false),
    Soru('5.Kaju fıstığı aslında bir meyvenin sapıdır', true),
    Soru('6.Fatih Sultan Mehmet hiç patates yememiştir', true),
    Soru('7.Fransızlar 80 demek için, 4 - 20 der', true),
  ];
  String getSoruMetni() {
    return TestVeri()._soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return TestVeri()._soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex + 1 < _soruBankasi.length) {
      _soruIndex++;
    }
  }

  bool testBittiMi() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void sifirla() {
    _soruIndex = 0;
  }

  void puanSifirla() {
    _puan = 0;
  }

  void puanVer(int puan) {
    _puan = puan + _puan;
  }

  int getPuan() {
    return _puan;
  }
}
