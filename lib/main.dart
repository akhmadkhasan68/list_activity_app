import 'package:flutter/material.dart';

Color mainColor = Color(0xff0a0e21);
Color secondaryColor = Color(0xff171d2d);
Color primaryColor = Color(0xff5702e9);
Color lightColor = Color(0xfffefefe);

// String codeDialog;
String valueText;
List<String> lists = ['Sun', 'Moon', 'Star'];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Alert Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            title: Text(
              'Tambah Tugas',
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              style: TextStyle(
                color: Color(0xff757575),
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: "Masukkan Nama Tugas",
                hintStyle: TextStyle(color: Color(0xff757575)),
                filled: true,
                fillColor: Color(0xffe8e8e8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Cancel'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: primaryColor,
                textColor: lightColor,
                child: Text('OK'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    lists.insert(0, valueText);
                    _textFieldController.clear();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          'List App',
          style: TextStyle(color: lightColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: BodyLayout(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        label: const Text(
          'TAMBAH',
          style: TextStyle(
            color: Color(0xfffefefe),
            fontWeight: FontWeight.w800,
          ),
        ),
        icon: const Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }
}

class BodyLayout extends StatefulWidget {
  @override
  BodyLayoutState createState() {
    return new BodyLayoutState();
  }
}

class BodyLayoutState extends State<BodyLayout> {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }

  Widget _myListView() {
    return lists.isNotEmpty
        ? ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text(
                    lists[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: lightColor,
                    ),
                  ),
                  onLongPress: () {
                    setState(() {
                      lists.removeAt(index);
                    });
                  },
                ),
              );
            },
          )
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(20.0),
            height: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Tugas Kosong!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: lightColor,
                  ),
                )
              ],
            ),
          );
  }
}
