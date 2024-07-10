import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup/signin.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String email = "";
  String password = "";

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      email = sp.getString("email") ?? "";
      password = sp.getString("password") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Email: $email"),
          Text("Password: $password"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              await sp.clear(); // Clear all stored data
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
            child: Text('Logout'),

          ),

      Container(
        height: 635,
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.teal,
                        child: Image.asset(
                          'lib/assets/flowers.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.teal,
                      child: Image.asset(
                        'lib/assets/flowers.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.teal,
                      child: Image.asset(
                        'lib/assets/flowers.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )
        ],
      ),

    );
  }
}
