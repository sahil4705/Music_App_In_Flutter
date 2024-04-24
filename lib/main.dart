import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/splashscreen.dart';

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
        home: SplashScreen());
  }
}

class MusicList extends StatelessWidget {
  
  final List<Map<String, dynamic>> musicList = [
    {
      'name': 'Hanuman Chalisha',
      'photo': 'assets/aditya gadhavi.jpeg',
      'url':
          'test/Hanuman_Chalisa_(Symphony_Version)___3D_Video___हनुमान_चालीसा___Aditya_Gadhvi___Rahul_M__With_Lyrics(256k).mp3',
    },
    {
      'name': 'Navaratri Garaba',
      'photo': 'assets/navratri garba.jpeg',
      'url':
          'test/New_Hindi_Garba_Song____Garba_Suffle____Vadladi_Varsi_Re____Sarovar_Chhali_Valya____New_Songs(128kbps).mp3',
    },
    {
      'name': 'Rocks Song',
      'photo': 'assets/3844724.png',
      'url': 'test/mixkit-tech-house-vibes-130.mp3',
    },
    {
      'name': 'Radha Ne Shyam Mali jase',
      'photo': 'assets/radha ne syam.jpeg',
      'url':
          'test/RADHA_NE_SHYAM_MALI_JASHE___Sachin-Jigar__Sachin_Sanghvi__Shruti_Pathak_Aadil_Khan_Simran_Natekar(128k).m4a',
    },
    {
      'name': 'Ram Aayenge',
      'photo': 'assets/ram aayenge.jpeg',
      'url':
          'test/રામ_આયેંગે_-_ગીતા_રબારી____RAAM_AAYENGE_-_GEETA_RABARI_2024____ayodhya_ram_mandir_new_song(128k).m4a',
    },
    {
      'name': 'Shivaji Nu Halardu',
      'photo': 'assets/shivaji nu halardu.jpeg',
      'url':
          'test/Shivaji_Nu_Halardu__Rahul_Maheta__RCC__Dandiya__Rass__Garba__Navratri_Special(128k).m4a',
    },
    {
      'name': 'Morbai Than Ghat Kare',
      'photo': 'assets/maru man.jpeg',
      'url':
          'test/Mor_Bani_Thanghat_Kare_by_Osman_Mir___Goliyon_Ki_Raasleela_Ram-Leela___Gujarati_Jalso_2017(128k).m4a',
    },
    {
      'name': 'Dhuni Re Dhakhavi Peli',
      'photo': 'assets/Dhuni re dhakhavi.jpeg',
      'url':
          'test/Dhuni_Re_Dhakhavi____Sachin-Jigar__Sachin_Sanghvi___Nishant_Thacker(128k).m4a',
    },
    {
      'name': 'Dhun Lagi',
      'photo': 'assets/dhun laagi.jpg',
      'url': 'test/Dhun_Laagi(128k).m4a',
    },
    {
      'name': 'Avo Navlakh Nejadhari',
      'photo': 'assets/avo navlakh nejadiyu.jpeg',
      'url':
          'test/Jigrra___Jigardan_Gadhavi___Aavo_Navlakh____Bharatdan_Gadhavi(128k).m4a',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Music List'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                
              },
            ),
          ],
          bottom: const TabBar(
            
            labelColor: Colors.white, 
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Songs'), 
              Tab(text: 'Artists'), 
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.zero,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/Splash screen.png',
                    ), 
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Icon(
                        Icons.verified_user_outlined,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Feedback'),
                leading: const Icon(Icons.feedback),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (BuildContext context, int index) {
                return MusicListItem(
                  musicName: musicList[index]['name'],
                  photo: musicList[index]['photo'],
                  url: musicList[index]['url'],
                );
              },
            ),
            
            Container(
              color: const Color.fromARGB(
                  255, 232, 232, 232),
              child: ListView(
                children: const [
                  ArtistItem(
                    name: 'Aditya Gadhavi',
                    image: 'assets/aditya gadhavi.jpeg',
                    
                  ),
                  ArtistItem(
                    name: 'Sachin-Jigar',
                    image: 'assets/jigardan-gadhavi2.jpg',
                    
                  ),
                  ArtistItem(
                    name: 'Gitaben Rabari',
                    image: 'assets/gitabene rabari.jpg',
                    
                  ),
                  ArtistItem(
                    name: 'Osman Mir',
                    image: 'assets/download.jpeg',
                    
                  ),

                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicListItem extends StatelessWidget {
  final String musicName;
  final String photo;
  final String url;

  MusicListItem({
    super.key,
    required this.musicName,
    required this.photo,
    required this.url,
  });

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], 
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          tileColor: Colors.white, 
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            backgroundImage: AssetImage(photo),
          ),
          title: Text(
            musicName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.play_circle),
                onPressed: () async {
                  var result = await audioPlayer.play(url, isLocal: true);
                  if (result == 1) {}
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop_circle_outlined),
                onPressed: () {
                  audioPlayer.stop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtistItem extends StatelessWidget {
  final String name;
  final String image;

  const ArtistItem({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      title: Text(name),
      onTap: () {
      },
    );
  }
}