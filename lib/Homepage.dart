import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  navigate(){
    Navigator.of(context).pushNamed('initial');
  }

  @override
  Widget build(BuildContext context) {
    final logo1 = Hero(
      tag: 'hero1',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('Images/first.png'),
      ),
    );

    final StartButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('Reader');
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Start Reading', style: TextStyle(color: Colors.white)),
      ),
    );
    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Reader Club'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Premkumar'),
              accountEmail: new Text('premmano982gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('P'),
              ),
            ),
            new ListTile(
              title: new Text('Home'),
              trailing: Icon(Icons.photo),
              onTap: ()=>Navigator.of(context).pushNamed('homepage'),
            ),
            new Divider(),
            new ListTile(
              title: new Text('My Ranking'),
              trailing: Icon(Icons.score),
              onTap: ()=>Navigator.of(context).pushNamed('Result'),
            ),
            new Divider(),
            new ListTile(
              title: new Text('Instructions'),
              trailing: Icon(Icons.filter_frames),
            ),
            new Divider(),
            new ListTile(
              title: new Text('Assignments'),
              trailing: Icon(Icons.assessment),
              onTap: ()=>Navigator.of(context).pushNamed('pass'),
            ),
            new Divider(),
            new ListTile(
                title: new Text('Log Out'),
                trailing: Icon(Icons.close),
                onTap:(){
                  FirebaseAuth.instance.signOut().then(navigate());
                }
            ),
          ],
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage('Images/back.jpg'),
              fit: BoxFit.cover
          ),),
        child: new Center(
          child: ListView( children: <Widget>[
              logo1,
               new Container(
                 padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),
                 margin: const EdgeInsets.all(15.0),
                 decoration: new BoxDecoration(
                     border: new Border.all(color: Colors.black)
                 ),
                 child: new Text('Rules and Regulations :    You must give yourself enough time,        When you are in hurry, swerve wherever needed, Anticipate what may lie ahead, and improvise accordingly,      Most important. Enjoy your drive',
                   style: TextStyle(fontSize: 20.0),textAlign: TextAlign.justify,softWrap: true,),
               ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StartButton,
              ],
            ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Winner will be published in these social media',style: TextStyle(fontSize: 20.0),),
              ),
              SizedBox(height: 15.0,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                Image.asset('Images/fb.png',height: 60.0,width: 60.0,),
                Image.asset('Images/insta.png',height: 60.0,width: 60.0,),
                Image.asset('Images/twitter.png',height: 60.0,width: 60.0,),
              ],),

          ],
          ),
        ),
      ),


    );
  }
}
