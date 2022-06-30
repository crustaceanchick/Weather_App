import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Widget __itemBuilder(context, index) {
  return Stack(
    children: <Widget>[
      Container(
        width: 185,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: () {
            print("Tapped on container");
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                    child: Text('City #$index',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.access_alarms_outlined,
                      size: 40,
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 0),
                    child: Text(
                      '+30 C',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // The search area here
          title: Container(
            margin: EdgeInsets.only(top:15),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(

                color: Colors.transparent,
                border: Border.all(width: 1, color: Colors.black26),
                borderRadius: BorderRadius.circular(2)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Enter city here...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 20, bottom: 0, left: 10, right: 10),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 170,
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1,
          ),
          itemBuilder: __itemBuilder,
        ),
      ),
    );
  }
}
