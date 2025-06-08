import 'package:flutter/material.dart';

class Rana extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String location;

  const Rana({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: ListTile(
        leading: Icon(
          icon, 
          size: 200, 
          color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(location, style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
