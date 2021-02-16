import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hizli_randevu_sistemi/pages/olusturulan_randevu.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_olustur.dart';
import 'package:hizli_randevu_sistemi/pages/sifremi_unuttum.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int secilenSayfa = 0;
  void sayfaDegistir(int index){
    setState(() {
      secilenSayfa=index;
    });
  }
Widget sayfaGoster(int secilenSayfa){
    if(secilenSayfa == 0){
      return RandevuOlustur();
    }else if(secilenSayfa == 1){
      return OlusturulanRandevularim();
    }
  }
  TabController tabController;
  @override
  void initState() {
    super.initState();
    sayfaGoster(secilenSayfa);
    tabController= TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("AnaSayfa"),
        backgroundColor: Colors.white,
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: secilenSayfa,
          onTap: sayfaDegistir,
          fixedColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets),
              title: Text('Randevu Oluştur'),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_available),
              title: Text('Oluşturulmuş Randevular'),
            ),
          ],

        ),
        drawer: Drawer(
            child: Container(
              color: Colors.white,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Mustafa Kaymaz"),
                    accountEmail: Text("m.zmyk19@gmail.com"),
                    decoration: BoxDecoration(

                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text(
                        "M",
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                    ),

                  ),
                  Divider(
                    height: 3,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.home), title: Text("Anasayfa"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings), title: Text("Ayarlar"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts), title: Text("İletişim"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        body: sayfaGoster(secilenSayfa),
    );

  }
}


