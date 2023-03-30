import 'package:flutter/material.dart';

void main() =>runApp(MaterialApp(
  home:DabhiCard(),
));
 
class DabhiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
       appBar: AppBar(
         title: Text('Dabhi ID Card'),
         centerTitle: true,
         backgroundColor: Colors.grey[800],
         elevation: 0.0,
       ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/1.jpg'),
                    radius: 40.0,
                  ),
                ),
                Divider(
                  height: 60.0,
                ),
                Text(
                  'First Name',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Ravi',
                    style: TextStyle(
                    color: Colors.lightGreen,
                    letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Last Name',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Dabhi',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'dabhiravi1807@gmail.com',
                      style: TextStyle(
                        color: Colors.limeAccent,
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}