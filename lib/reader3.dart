import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reader3 extends StatefulWidget {
  @override
  _Reader3State createState() => _Reader3State();
}

class _Reader3State extends State<Reader3> {


  _Reader3State(){
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
      'testMarks3': mark,
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
    final Result =Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('Result');
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Final Result', style: TextStyle(color: Colors.white)),
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
        title:new Text('Stage 3'),),
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
              child: Text('Stage 3',style: TextStyle(fontSize: 30.0),),
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
              child: new Text('When another old cave is discovered in the south of France, it is not usually news. Rather, it is an ordinary event. Such discoveries are so frequentthese days that hardly anybody pays heed to them.However, when the Lascaux cave complex was discovered in 1940, the world was amazed. Painteddirectly on its walls were hundreds of scenes showinghow people lived thousands of years ago. The scenesshow people hunting animals, such as bison or wildcats. Other images depict birds and, most noticeably,horses, which appear in more than 300 wall images,by far outnumbering all other animals.Early artists drawing these animals accomplisheda monumental and difficult task. They did not limitthemselves to the easily accessible walls but carriedtheir painting materials to spaces that required climbing steep walls or crawling into narrow passages in theLascaux complex. Unfortunately, the paintings havebeen exposed to the destructive action of water andtemperature changes, which easily wear the image saway. Because the Lascaux caves have manyentrances, air movement has also damaged theimages inside. ',
                style: TextStyle(fontSize: 15.0),textAlign: TextAlign.justify,softWrap: true,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Qestions:',style: TextStyle(fontSize: 25.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('1.Which title best summarizes the main idea of the passage?',style: TextStyle(fontSize: 20.0),),
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
                      'Wild Animals in Art',
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
                      'Hidden Prehistoric Paintings',
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
                      'Exploring Caves Respectfully',
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
                      'Determining the Age of French Caves',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                  ],),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('2.In line 4, the words pays heed to are closest in meaning to _______',style: TextStyle(fontSize: 20.0),),
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
                          'discovers',
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
                          'watches',
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
                        new Text('notices',
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
                          'buys',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                      ],),

                  ],
                ),
                submit,Result
              ],
            ),
          ],
        ),
      ),
    );
  }
}
