import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Assign extends StatefulWidget {
  @override
  _AssignState createState() => _AssignState();
}

class _AssignState extends State<Assign> {


  _AssignState(){
    firebaseData();
  }
  String _id;
  firebaseData() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _id = user.uid;
    });
  }

  int _radioValue1,mark=0,time =5,_radioValue2,_radioValue3;
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
  void something2(int g){
    setState(() {
      if(g==1){
        _radioValue3 =1;
      }
      else if(g==2){
        _radioValue3=2;
      }
      else if(g==3){
        _radioValue3 =3;
      }
      else if(g==4){
        _radioValue3 =4;
      }
    });

  }

  upload(){

    Firestore.instance
        .collection('Marks')
        .document(_id)
        .updateData({
      'AssignMark': mark,
    });
  }

  cal(){
    if(_radioValue1 == 2){
      mark = mark + 10;
    }
  }
  cal1(){
    if(_radioValue2 == 3){
      mark = mark +10;
    }
  }
  call2(){
    if(_radioValue2 == 4){
      mark = mark +10;
    }
  }
  void _showpopup(){
    AlertDialog dialog = new AlertDialog(
      content: Row(
        children: <Widget>[
          new Text('Your mark in Stage 1 is '),
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
    final submit =Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          cal();
          cal1();
          call2();
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
        title: new Text('Assignment-1'),
      ),
      body:Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage('Images/back.jpg'),
              fit: BoxFit.cover
          ),),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Assignment',style: TextStyle(fontSize: 30.0),),
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
              child: new Text('Myths are stories, the products of fertile imagination, sometimes simple, often containing profound truths. They are not meant to be taken too literally. Details may sometimes appear childish, but most myths express a cultures most serious beliefs about human beings, eternity, and God.The Reading Comprehension test is designed to measure how well you understand what you read. It contains 20 questions. Some questions refer to reading passages of various lengths. Some passages are 75 words in length, while others are longer. Other questions are of the sentence relationship type, in which you must choose how two sentences are related.',
                style: TextStyle(fontSize: 15.0),textAlign: TextAlign.justify,softWrap: true,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Qestions:',style: TextStyle(fontSize: 25.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('1.What does the second sentence do? ?',style: TextStyle(fontSize: 20.0),),
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
                      'It restates the idea found in the first.',
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
                      'It states an effect',
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
                      ' indefensible',
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
                      ' immutable',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                  ],),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 5,
                      groupValue: _radioValue1,
                      activeColor: Colors.deepPurpleAccent,
                      onChanged: (int e)=>something(e),
                    ),
                    new Text(
                      'Totally wrong',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                  ],),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('2.The author’s argument that destroying bot-flies and mosquitoes would be a beneficial action is most weakened by all of the following except',style: TextStyle(fontSize: 20.0),),
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
                          ' Descriptive to analytical',
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
                          ' Objective to narrative',
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
                          'Sarcastically humorous',
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
                          'Sarcastically critical to suggestive',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 5,
                          groupValue: _radioValue2,
                          activeColor: Colors.deepPurpleAccent,
                          onChanged: (int f)=>something1(f),
                        ),
                        new Text(
                          'Ironically sarcastic to negative',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('3.Marie ________ by leaving Poland and travelling to France to enter the Sorbonne.',style: TextStyle(fontSize: 20.0),),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          activeColor: Colors.deepPurpleAccent,
                          groupValue: _radioValue3,
                          onChanged:(int g)=>something2(g),
                        ),
                        new Text(
                          'Challenged authority ',
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
                          groupValue: _radioValue3,
                          onChanged: (int g)=>something2(g),
                        ),
                        new Text(
                            'Showed intelligence'
                        ),

                      ],),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 3,
                          groupValue: _radioValue3,
                          activeColor: Colors.deepPurpleAccent,
                          onChanged: (int g)=>something2(g),
                        ),
                        new Text('Behaved',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),
                    Row(
                      children: <Widget>[
                        new Radio(
                          value: 4,
                          groupValue: _radioValue3,
                          activeColor: Colors.deepPurpleAccent,
                          onChanged: (int g)=>something2(g),
                        ),
                        new Text(
                          'Was distressed',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),

                  ],
                ),
                submit,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
