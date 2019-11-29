import 'package:flutter/material.dart';
import 'package:flutter_json/offices.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Json'),
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
  
  Future<OfficesList> officelist;
  
  @override
  void initState() {
    super.initState();
    officelist = getOfficeList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<OfficesList>(
          future: officelist,
          builder: (context, snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                return ListView.builder(
                    itemCount: snapshot.data.offices.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          leading: Image.network('${snapshot.data.offices[index].image}'),
                          title: Text('${snapshot.data.offices[index].name}'),
                          subtitle: Text(
                              '${snapshot.data.offices[index].address}'
                          ),
                          isThreeLine: true,
                        ),
                      );
                });
            }
            return null;
          })
     );
  }
}
