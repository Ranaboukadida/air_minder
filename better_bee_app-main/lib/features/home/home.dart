import 'package:better_buzz/core/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List machines = [
    {
      'title': 'Machine 1',
      'description': FirebaseAuth.instance.currentUser?.email,
      'icon': Icons.biotech,
      'location': 'hive1'
    },
    {
      'title': 'Machine 2',
      'description': FirebaseAuth.instance.currentUser?.email,
      'icon': Icons.biotech,
      'location': 'hive1'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo/framee.png',
          color: Theme.of(context).colorScheme.primary,
          height: 40,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 13),
            child: CircleAvatar(
              radius: 17,
              foregroundImage: NetworkImage(
                  "https://media.discordapp.net/attachments/778000943249096705/1140753767537578035/avatar.png"),
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Text('Here you can check on your machines !',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 3),
              child: Text(
                  'Select one of your devices to learn more about it! and a look on more information or add one!',
                  style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (final machine in machines)
                  Rana(
                    title: machine['title'],
                    description: machine['description'],
                    icon: machine['icon'],
                    location: machine['location'],
                  ),
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shadowColor: Colors.transparent,
                      elevation: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filled(
                            onPressed: () {
                              context.push('/homee');
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 70,
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Rana extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final String location;
  const Rana(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon,
      this.location = "none"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shadowColor: Colors.transparent,
          elevation: 1,
          child: Stack(
            children: [
              Positioned(
                bottom: -75,
                left: -75,
                child: Icon(
                  icon,
                  size: 250,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              const SizedBox(height: 5),
                              Text(description,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: FilledButton.icon(
                              onPressed: () {
                                location == "none"
                                    ? null
                                    : context.push('/$location');
                              },
                              label: const Text(
                                'Check',
                                style: TextStyle(fontSize: 15),
                              ),
                              icon: Icon(
                                icon,
                                size: 20,
                              ),
                              style: FilledButton.styleFrom(
                                minimumSize: const Size(150, 50),
                              )))
                    ],
                  )),
            ],
          )),
    );
  }
}
