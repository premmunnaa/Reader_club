import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
int a,b,c,d;
String x = "Need to work hard";
String y = "Can do better";
String z = "Excelent work";
String k,p;
int level;
_ResultState(){
  firebaseData();
}
String _id;
firebaseData() async{
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  setState(() {
    _id = user.uid;
  });

}
upload(){
  Firestore.instance
      .collection('Marks')
      .document(_id)
      .updateData({
    'Password':p,
  });

}

  Widget _getdata(BuildContext context,DocumentSnapshot ds) {
    a = ds['testMarks'];
    b = ds['testMarks2'];
    c = ds['testMarks3'];
    d = a + b + c;
    if(d>0&&d<30){
      k = x;
    }else if(d>31&&d<50){
      k = y;
    }else if(d>51 && d<71){
      k = z;
    }
    if(d>0&&d<11){
      level =1;
      p='2324';
    }else if(d>10&&d<21){
      level = 2;
      p='3454';
    }else if(d>20 && d<31){
      level = 3;
      p='5645';
    }
    else if(d>30 && d<41){
      level = 4;
      p='9472';
    }
    else if(d>40 && d<51){
      level = 5;
      p='9293';
    }
    else if(d>50 && d<61){
      level = 6;
      p='7694';
    }
    else if(d>60 && d<71){
      level = 7;
      p='2022';
    }
    upload();
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 68.0,
        child: Image.asset('Images/logo4.png'),
      ),
    );

    return Center(
      child: Column(
        children: <Widget>[
          logo,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Total Mark scored in this Trianing  out of 70:',style: TextStyle(fontSize: 25.0),),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),
            margin: const EdgeInsets.all(15.0),
            decoration: new BoxDecoration(
                border: new Border.all(color: Colors.black)
            ),
            child: new Text(d.toString(),
              style: TextStyle(fontSize: 30.0),textAlign: TextAlign.justify,softWrap: true,),
          ),
          Text(k,style: TextStyle(fontSize: 25.0),),
          SizedBox(height: 20.0,),
          Text('Your level is:'),
          Text(level.toString(),style: TextStyle(fontSize: 25.0),),
          Text('Enter this password in assignment'),
          Text(p,style: TextStyle(fontSize: 20.0),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: new AppBar(
        title: Text('Results'),
      ),

    body:StreamBuilder(
              stream: Firestore.instance.collection('Marks').snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text('Loading....');
                }
                return Container(child:
                  _getdata(context,snapshot.data.documents[1]),
                );
              }),
    );
  }
}
