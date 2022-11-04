import 'package:flutter/material.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title: Text('http://'),
        subtitle: Text('Id: 1'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () => print('abre algo'),
      ),
    );
  }
}
