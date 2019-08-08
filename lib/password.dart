import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class pass extends StatefulWidget {
  @override
  _passState createState() => _passState();
}

class _passState extends State<pass> {
  final GlobalKey<ScaffoldState> _sbkey = new GlobalKey<ScaffoldState>();
  String _pass,dbdata;
  auth(){
    if(_pass == dbdata){
      Navigator.of(context).pushNamed('Assign');
  }
  }


  @override
  Widget build(BuildContext context) {
    final password = Form(
      child:TextFormField(
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value)=> value.isEmpty ? 'Password cannot be empty ': null,
        onSaved: (value) => _pass = value,
      ),
    );
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 68.0,
        child: Image.asset('Images/logo4.png'),
      ),
    );
    final loginButton =
    Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          auth();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Attend Assignment', style: TextStyle(color: Colors.white)),
      ),
    );
    Widget _getdata(BuildContext context,DocumentSnapshot ds) {
      dbdata = ds['password'];
      print(dbdata);
    }
    return Scaffold(
      key: _sbkey,
      body:new Column(children: <Widget>[
        StreamBuilder(
            stream: Firestore.instance.collection('Marks').snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return Text('Loading....');
              }
              return Container(child:
              _getdata(context,snapshot.data.documents[1]),
              );
            }),
        new Center(
          child:new Column(
            children: <Widget>[
              logo,
              SizedBox(height: 100.0,),
              password,
              loginButton
            ],
          )
      ),],),

    );

  }
}
