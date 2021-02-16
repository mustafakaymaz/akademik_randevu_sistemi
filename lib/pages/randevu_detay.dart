import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hizli_randevu_sistemi/detay/aciklama.dart';
import 'package:hizli_randevu_sistemi/detay/detay_ogretim_elemani.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_olustur.dart';
class RandevuDetay extends StatefulWidget {

  @override
  _RandevuDetayState createState() => _RandevuDetayState();
}

class _RandevuDetayState extends State<RandevuDetay> {
  DateTime pickedDate;
  TimeOfDay time;
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Randevu Detay"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
        //  color: Colors.grey.shade100,
          child: Column(
            children: [
            /*  Container(
              padding: EdgeInsets.fromLTRB(10,10,10,0),
              //height: 160,
              width: double.maxFinite,
              child: Card(
              elevation: 5.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 15, top: 10,right: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.note_add, color: Colors.yellow,),
                                      Text(
                                          "Fakülte ve Bölüm",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Divider(
                                    height: 2.0,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("FAKÜLTE",style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text(Util.fakulte),
                                      IconButton(
                                        icon: Icon(Icons.arrow_forward_ios,),
                                        color: Colors.blue,
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetayFakulte()));
                                        },
                                      )],
                                  ),

                                  Divider(
                                    height: 2.0,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("BÖLÜM",style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text(Util.fakulte),
                                      IconButton(
                                        icon: Icon(Icons.arrow_forward_ios,),
                                        color: Colors.blue,
                                        onPressed: (){
                                      //    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetayFakulte()));
                                        },
                                      )],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),*/
              Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
               // height: 160,
                width: double.maxFinite,
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top:10,right: 10,bottom: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.person, color: Colors.yellow,),
                                            Text(
                                                "Öğretim Elemanı",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Divider(
                                          height: 2.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text("ÖĞRETİM ELEMANI",style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                        ListTile(
                                          title: Text( Util.ogru, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                                          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,size: 38,),
                                          selected: true,
                                          onTap: (){
                                           // Navigator.pop(context);
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Akademisyen()));
                                          },
                                        ),
                                      ],
                                    ),

                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                // height: 160,
                width: double.maxFinite,
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top:10,right: 10,bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.access_time, color: Colors.yellow,),
                                          Text(
                                              "Tarih ve Saat",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Divider(
                                        height: 2.0,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                            Text("TARİH ",style: TextStyle(color: Colors.grey),),
                                        ],
                                      ),
                                       ListTile(
                                        title:Text(Util.tarih="${pickedDate.day}.${pickedDate.month}.${pickedDate.year}"),
                                        onTap: (){
                                          _pickDate();
                                        }
                                        ),
                                          SizedBox(
                                          height: 5,
                                          ),
                                          Divider(
                                          height: 2.0,
                                          color: Colors.black,
                                          ),
                                          SizedBox(
                                          height: 5,
                                          ),
                                          Row(
                                          children: [
                                          Text("SAAT ",style: TextStyle(color: Colors.grey),),
                                          ],
                                          ),
                                          ListTile(
                                          title: Text(Util.saat="${time.hour}:${time.minute}"),
                                          onTap:(){
                                            pickTime();
                                          },
                                          ),
                                          ],
                                          ),

                                          ),
                                          ],
                                          ),
                                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                // height: 160,
                width: double.maxFinite,
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top:10,right: 20,bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.mode_edit, color: Colors.yellow,),
                                          Text(
                                              "Açıklama",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Divider(
                                        height: 2.0,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text("AÇIKLAMA",style: TextStyle(color: Colors.grey),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Text(Util.aciklama),
                                          IconButton(
                                            icon: Icon(Icons.arrow_forward_ios,),
                                            color: Colors.blue,
                                            onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AciklamaDetay()));
                                            },
                                          )],
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _pickDate() async{
    DateTime date = await showDatePicker(
      locale: const Locale("tr","TR"),
      cancelText: "GERİ",
      confirmText: "TAMAM",
      context: context,
      firstDate: DateTime(DateTime.now().year-5),
      lastDate:  DateTime(DateTime.now().year+5),
      initialDate: pickedDate,
    );
    if(date != null){
      setState(() {
        pickedDate = date;
      });
    }
  }
  pickTime() async{
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time

    );
    if(t != null){
      setState(() {
        time = t;
      });
    }
  }
}
