import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:video_player_demo/screens/home_screen/home_screen.dart';
import 'package:video_player_demo/screens/home_screen/video_player_screen.dart';

class VideoListWidget extends StatefulWidget {
  VideoData videoData;
  VideoListWidget({super.key, required this.videoData});

  @override
  State<VideoListWidget> createState() => _VideoListWidgetState();
}

class _VideoListWidgetState extends State<VideoListWidget> {
  var isDownloading = false;
  @override
  void initState() {
    getApplicationDocumentsDirectory().then((value) {
      File outFile = File('${value.path}/${widget.videoData.id}.mp4');
      outFile.exists().then((value) {
        if (value) {
          setState(() {
            widget.videoData.isDownloaded = true;
          });
        }
      });
    });

    super.initState();
  }

  Future<void> encryptFile(String savedFilePath, String fileName) async {
    String secretKey = '996b352bbeb95628a61d4f0fbb72844e';

    File inFile = File('$savedFilePath/$fileName.mp4');
    File outFile = File('$savedFilePath/$fileName.aes');

    bool outFileExists = await outFile.exists();

    if (!outFileExists) {
      await outFile.create();
    }

    final videoFileContents = inFile.readAsStringSync(encoding: latin1);

    final key = Encrypt.Key.fromUtf8(secretKey);
    final iv = Encrypt.IV.fromLength(16);

    final encrypter = Encrypt.Encrypter(Encrypt.AES(key));

    final encrypted = encrypter.encrypt(videoFileContents, iv: iv);
    await outFile.writeAsBytes(encrypted.bytes);
    print('enc done');
  }

  Future<void> downloadVideo(String videoUrl, String savePath) async {
    final response = await http.get(Uri.parse(videoUrl));

    if (response.statusCode == 200) {
      final File videoFile = File(savePath);
      await videoFile.writeAsBytes(response.bodyBytes);
      print('Video downloaded to $savePath');
    } else {
      print("response.statusCode: ${response.statusCode}");
      throw Exception('Failed to download video: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        if (!widget.videoData.isDownloaded) {
          setState(() {
            isDownloading = true;
          });
          final appDocumentsDirectory =
              await getApplicationDocumentsDirectory();
          final localPath = appDocumentsDirectory.path;
          var videoUrl = widget.videoData.url;
          final savePath = localPath;

          await downloadVideo(videoUrl, '$savePath/${widget.videoData.id}.mp4');
          await encryptFile(savePath, widget.videoData.id.toString());
          setState(() {
            widget.videoData.isDownloaded = true;
            isDownloading = false;
          });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(
                    localVideoName: '${widget.videoData.id}')),
          );
        }
      },
      title: Text(widget.videoData.name),
      trailing: isDownloading
          ? const SizedBox(
              width: 20, height: 20, child: CircularProgressIndicator())
          : Icon(widget.videoData.isDownloaded
              ? Icons.play_arrow
              : Icons.download),
    );
  }
}
