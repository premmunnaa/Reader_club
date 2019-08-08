import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reader2 extends StatefulWidget {
  @override
  _Reader2State createState() => _Reader2State();
}

class _Reader2State extends State<Reader2> {
  _Reader2State(){
    firebaseData();
  }
  String _id;
  firebaseData() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _id = user.uid;
    });
  }

  int _radioValue1,mark=0,time =5,_radioValue2;
  void something(int e){
    setState(() {
      if(e==1){
        _radioValue1 =1;
      }
      else if(e==2){
        _radioValue1=2;
      }
      else if(e==3){
        _radioValue1 =3;
      }
      else if(e==4){
        _radioValue1 =4;
      }
      else if(e==5){
        _radioValue1 =5;
      }
    });

  }
  void something1(int f){
    setState(() {
      if(f==1){
        _radioValue2 =1;
      }
      else if(f==2){
        _radioValue2=2;
      }
      else if(f==3){
        _radioValue2 =3;
      }
      else if(f==4){
        _radioValue2 =4;
      }
      else if(f==5){
        _radioValue2 =5;
      }
    });

  }
  upload(){

    Firestore.instance
        .collection('Marks')
        .document(_id)
        .updateData({
      'testMarks2': mark,
    });
  }

  cal(){
    if(_radioValue1 == 1){
      mark = mark + 10;
    }
  }
  cal1() {
    if (_radioValue2 == 1) {
      mark = mark + 10;
    }
  }
    void _showpopup(){
      AlertDialog dialog = new AlertDialog(
        content: Row(
          children: <Widget>[
            new Text('Your mark in Stage 2 is '),
            new Text(mark.toString()),
          ],
        ),

        actions: <Widget>[

        ],
      );
      showDialog(context: context ,child: dialog);
    }
  @override
  Widget build(BuildContext context) {
    final nextStage =Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('Reader3');
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Next Stage', style: TextStyle(color: Colors.white)),
      ),
    );
    final submit =Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          cal();
          cal1();
          upload();
          _showpopup();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Submit', style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Stage 2'),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage('Images/back.jpg'),
              fit: BoxFit.cover
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Stage 2',style: TextStyle(fontSize: 30.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Read the passage carefully and answer qestion below:',style: TextStyle(fontSize: 25.0),),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),
              margin: const EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                  border: new Border.all(color: Colors.black)
              ),
              child: new Text('Marie was born in 1867 in Warsaw, Poland, where her father was a Professor of Physics. At an early age, she displayed a brilliant mind and a blithe personality. Her great exuberance for learning prompted her to continue with her studies after high school. She became disgruntled, however, when she learned that the university in Warsaw was closed to women. Determined to receive a higher education, she defiantly left Poland and in 1891 entered the Sorbonne, a French university, where she earned her master.Marie was fortunate to have studied at the Sorbonne with some of the greatest scientists of her day, one of whom was Pierre Curie. Marie and Pierre were married in 1895 and spent many productive years working together in the physics laboratory. A short time after they discovered radium, Pierre was killed by a horse-drawn wagon in 1906. Marie was stunned by this horrible misfortune and endured heartbreaking anguish. Despondently she recalled their close relationship and the joy that they had shared in scientific research. The fact that she had two young daughters to raise by herself greatly increased her distress.',
                style: TextStyle(fontSize: 15.0),textAlign: TextAlign.justify,softWrap: true,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Qestions:',style: TextStyle(fontSize: 25.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('1.Marie had a bright mind and a _________ personality.',style: TextStyle(fontSize: 20.0),),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 1,
                      activeColor: Colors.deepPurpleAccent,
                      groupValue: _radioValue1,
                      onChanged:(int e)=>something(e),
                    ),
                    new Text(
                      'Strong',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                  ],),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 2,
                      activeColor: Colors.deepPurpleAccent,
                      groupValue: _radioValue1,
                      onChanged: (int e)=>something(e),
                    ),
                    new Text(
                      'lighthearted',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                  ],),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 3,
                      groupValue: _radioValue1,
                      activeColor: Colors.deepPurpleAccent,
                      onChanged: (int e)=>something(e),
                    ),
                    new Text(
                      'Humorous',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                  ],),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 4,
                      groupValue: _radioValue1,
                      activeColor: Colors.deepPurpleAccent,
                      onChanged: (int e)=>something(e),
                    ),
                    new Text(
                      'Strange',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                  ],),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('2. When she learned that she could not attend the university in Warsaw, she felt_________',style: TextStyle(fontSize: 20.0),),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          activeColor: Colors.deepPurpleAccent,
                          groupValue: _radioValue2,
                          onChanged:(int f)=>something1(f),
                        ),
                        new Text(
                          'Hopeless ',
                          style: new TextStyle(
                            fontSize: 16.0,
                          ),
                        ),

                      ],),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 2,
                          activeColor: Colors.deepPurpleAccent,
                          groupValue: _radioValue2,
                          onChanged: (int f)=>something1(f),
                        ),
                        new Text(
                          'Annoyed ',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 3,
                          groupValue: _radioValue2,
                          activeColor: Colors.deepPurpleAccent,
                          onChanged: (int f)=>something1(f),
                        ),
                        new Text(
                          'Depressed',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 4,
                          groupValue: _radioValue2,
                          activeColor: Colors.deepPurpleAccent,
                          onChanged: (int f)=>something1(f),
                        ),
                        new Text(
                          'Worried',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),

                  ],
                ),
                submit,nextStage
              ],
            ),
          ],
        ),
      ),
    );
  }
}
