import 'package:flutter/material.dart';

void main() {
  TeksUtama teksUtama = TeksUtama();

  runApp(
    MaterialApp(
      title: 'Halo Dunia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halo Dunia'),
        ),
        body: Center(
          child: teksUtama,
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              tooltip: 'Refresh',
              child: Icon(Icons.refresh),
              onPressed: () {
                // Access the state of TeksUtama to update the index
                final teksUtamaState = teksUtama.state;
                teksUtamaState.incrementIndex();
              },
            );
          },
        ),
      ),
    ),
  );
}

class TeksUtama extends StatefulWidget {
  final StateTeksUtama state = StateTeksUtama();

  @override
  StateTeksUtama createState() => state;
}

class StateTeksUtama extends State<TeksUtama> {
  final List<String> listNama = [
    'Niam',
    'Didit',
    'Lukman',
    'Arsyad',
    'Ummu',
  ];

  final List<Color> listWarna = [
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blue,
    Colors.yellow
  ];

  int index = 0;

  void incrementIndex() {
    setState(() {
      index = (index + 1) % listNama.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Apa kabar',
          textDirection: TextDirection.ltr,
        ),
        Text(
          listNama[index % listNama.length],
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: listWarna[index % listWarna.length],
          ),
        ),
      ],
    );
  }
}
