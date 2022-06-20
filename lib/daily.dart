import 'package:flutter/material.dart';
import 'package:hrm_app/desc.dart';

class Dailies extends StatefulWidget {
  const Dailies({Key? key}) : super(key: key);

  @override
  State<Dailies> createState() => _DailiesState();
}

class _DailiesState extends State<Dailies> {
  final List<List<String>> dailies = [
    ['Task 1', 'Task 1 description'],
    ['Task 2', 'Task 2 description'],
    ['Task 3', 'Task 3 description'],
    ['Task 4', 'Task 4 description'],
    ['Task 5', 'Task 5 description'],
    ['Task 6', 'Task 6 description'],
    ['Task 7', 'Task 7 description'],
    ['Task 8', 'Task 8 description'],
    ['Task 9', 'Task 9 description'],
    ['Task 10', 'Task 10 description'],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text('Dailies')),
          body: Center(child: dailiesList(dailies))),
    );
  }
}

Widget dailiesList(list) {
  return ListView.separated(
      itemBuilder: (BuildContext context, int i) {
        return Card(
          child: ListTile(
            title: Text(list[i][0]),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Desc(
                          daily: list[i],
                        ))),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int i) => const Divider(),
      itemCount: list.length);
}
