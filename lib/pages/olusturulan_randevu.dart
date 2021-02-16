import 'package:flutter/material.dart';
import 'package:hizli_randevu_sistemi/detay/randevularim_detay.dart';
class OlusturulanRandevularim extends StatefulWidget {
  @override
  _OlusturulanRandevularimState createState() => _OlusturulanRandevularimState();
}

class _OlusturulanRandevularimState extends State<OlusturulanRandevularim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RandevularimDetay(),
    );
  }
}
