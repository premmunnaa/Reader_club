import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    final loginButton =
    Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('LoginPage');
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final signUpButton =Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('SignUppage');
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Sign Up', style: TextStyle(color: Colors.white)),
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
    return Scaffold(
      body:Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('Images/back.jpg'),
                fit: BoxFit.cover
            ),),
        child: new Center(
          child:
          Column(
            children: <Widget>[
              SizedBox(height: 48.0),
              new Container(
                child: logo,
              ),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),
                margin: const EdgeInsets.all(15.0),
                decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.black)
                ),
                child: new Text('Learning to read is about listening and understanding as well as working out what is printed on the page. Through hearing stories, children are exposed to a wide range of words. This helps them build their own vocabulary and improve their understanding when they listen, which is vital as they start to read',
                style: TextStyle(fontSize: 20.0),textAlign: TextAlign.justify,softWrap: true,),
              ),
              loginButton,
              signUpButton,
            ],
          ),
        ),
      ),
    );
  }
}
