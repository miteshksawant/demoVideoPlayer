import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/home_screen/widget/video_list_widget.dart';
import 'package:video_player_demo/screens/setting_screen/setting_screen.dart';
import 'package:video_player_demo/widget/app_cached_network_image.dart';
import 'package:video_player_demo/widget/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static String id = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<VideoData> listVideo = [
    VideoData(
      id: 1,
      name: "Video 1",
      url: "https://download.samplelib.com/mp4/sample-5s.mp4",
    ),
    VideoData(
      id: 2,
      name: "Video 2",
      url: "https://download.samplelib.com/mp4/sample-5s.mp4",
    ),
    VideoData(
      id: 3,
      name: "Video 3",
      url: "https://download.samplelib.com/mp4/sample-5s.mp4",
    ),
    VideoData(
      id: 4,
      name: "Video 4",
      url:
          "https://statuslagao.in/wp/vid/new/new-whatsapp-status-video-768.mp4",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("mitesh"),
                accountEmail: Text("miteshksawant@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile_image.jpg"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_pin),
                title: const Text('Profile'),
                onTap: () {
                  // Handle the onTap action
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Get.to(() => const SettingScreen());
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  // Handle the onTap action
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Video Player'),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: Get.height * 0.50,
                  width: Get.width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Icon(Icons.person_pin)),
            )
          ],
        ),

        body: ListView.builder(
            itemCount: listVideo.length,
            itemBuilder: (BuildContext context, int index) {
              return VideoListWidget(
                videoData: listVideo[index],
              );
            }));
  }
}

class VideoData {
  String name;
  String url;
  bool isDownloaded;
  int id;
  VideoData(
      {required this.id,
      required this.name,
      required this.url,
      this.isDownloaded = false});
}
