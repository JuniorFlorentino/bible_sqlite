import 'package:flutter/material.dart';
import 'package:bible_sqlite/bible_sqlite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final BibleSqlite _bibleSqlite = BibleSqlite();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bíblia Sagrada'),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<List<BookModel>>(
          future: _bibleSqlite.getBook(),
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Carregando dados...'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: Text('Carregando dados...'),
                );
              case ConnectionState.active:
                return const Center(
                  child: Text('Carregando dados...'),
                );
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    return Text(snapshot.data![index].name);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
