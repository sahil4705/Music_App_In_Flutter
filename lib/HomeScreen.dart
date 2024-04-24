import 'package:audioplayers/audioplayers.dart' show AudioPlayer;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String? test;

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> musicList = <Map<String, String>>[
    {
      'title': 'Hanuman Chalisa',
      'artist': 'Aditya Gadhvi',
      'url':
          "test/Hanuman_Chalisa_(Symphony_Version)___3D_Video___हनुमान_चालीसा___Aditya_Gadhvi___Rahul_M__With_Lyrics(256k).mp3",
      'cover': "assets/adityagadhavi.jpeg"
    },
    {
      "Title": "New_Hindi_Garba",
      "artist": "Gujju",
      "url":
          "Uri.parse('test/New_Hindi_Garba_Song____Garba_Suffle____Vadladi_Varsi_Re____Sarovar_Chhali_Valya____New_Songs(128kbps).mp3')",
      "cover": "assets/navratrigarba.jpeg"
    },
  ];

  String currentTitle = "";
  String currentartist = "";
  String currenturl = "";

  IconData btnIcon = Icons.play_arrow;

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentSong = "";

  Duration duration = const Duration();
  Duration currentDuration = const Duration();
  Duration position = const Duration();

  // get index => null;

  void playMusic(String url) async {
    if (isPlaying) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.play_arrow;
        });
      }
    }
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  String searchValue = "";

  Widget customListTitle(
      {required String title,
      required String singer,
      required String cover,
      required Function() onTap}) {
    return ListTile(
      leading: Image.network(cover, width: 80, height: 80, fit: BoxFit.cover),
      title: Text(title),
      subtitle: Text(singer),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredMusicList = musicList
        .where((song) =>
            song["title"]!.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    // String title;
    // var string = String;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            // controller: _controller,
            decoration: const InputDecoration(hintText: 'Search...'),
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.speaker), text: 'Song'),
              Tab(icon: Icon(Icons.person), text: 'Artists'),
              Tab(icon: Icon(Icons.album), text: 'Album'),
              Tab(icon: Icon(Icons.folder), text: 'Folder'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Music App'),
              ),
              ListTile(
                  title: const Text('Feedback'),
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  title: const Text('Setting'),
                  onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Placeholder(),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredMusicList.length,
                  itemBuilder: (context, index) => customListTitle(
                        onTap: () {
                          (String? musicList) {}(musicList[index]['url']);
                          setState(() {
                            currentTitle = filteredMusicList[index]["title"]!;
                            currentartist = filteredMusicList[index]["artist"]!;
                            currenturl = filteredMusicList[index]["cover"]!;
                          });
                        },
                        title: filteredMusicList[index]['title']!,
                        singer: filteredMusicList[index]['artist']!,
                        cover: filteredMusicList[index]['cover']!,
                      )),
            ),
      
            Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0x55212121),
                  blurRadius: 8.0,
                ),
              ]),
              child: Column(
                children: [
                  Slider.adaptive(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            // Corrected to lowercase 'd'
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  currenturl), // Added fit property for better image fit
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentTitle,
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                                overflow:
                                    TextOverflow.ellipsis, // Handle long titles
                              ),
                              Text(
                                currentartist, // Display the singer name
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    color:
                                        Colors.grey), // Styling for singer text
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                currenturl,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (isPlaying) {
                              audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.pause;
                                isPlaying = false;
                              });
                            } else {
                              audioPlayer.resume();
                              setState(() {
                                btnIcon = Icons.play_arrow;
                                isPlaying = true;
                              });
                            }
                          },
                          iconSize: 42.0,
                          icon: Icon(btnIcon),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
