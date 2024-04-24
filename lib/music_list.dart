import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicList(),
    );
  }
}

class MusicList extends StatelessWidget {
  // Dummy data for music list
  final List<Map<String, dynamic>> musicList = [
    {
      'name': 'Song 1',
      'photo': 'assets/song1.jpg',
    },
    {
      'name': 'Song 2',
      'photo': 'assets/song2.jpg',
    },
    {
      'name': 'Song 3',
      'photo': 'assets/song3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music List'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MusicListItem(
            musicName: musicList[index]['name'],
            photo: musicList[index]['photo'],
          );
        },
      ),
    );
  }
}

class MusicListItem extends StatelessWidget {
  final String musicName;
  final String photo;

  const MusicListItem({
    super.key,
    required this.musicName,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(photo),
      ),
      title: Text(musicName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              // Implement play functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
              // Implement stop functionality
            },
          ),
        ],
      ),
    );
  }
}
