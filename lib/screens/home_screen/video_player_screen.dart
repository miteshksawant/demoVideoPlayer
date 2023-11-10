import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:path_provider/path_provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  String localVideoName;
  VideoPlayerScreen({super.key, required this.localVideoName});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  BetterPlayerController? _betterPlayerController;
  String secretKey = '996b352bbeb95628a61d4f0fbb72844e';

  String path = "";
  @override
  void initState() {
    super.initState();

    decryptFile().then((value) {
      setState(() {
        path = value.path;
      });
      // BetterPlayerDataSource betterPlayerDataSource =
      //     BetterPlayerDataSource(BetterPlayerDataSourceType.file, value.path);
      // _betterPlayerController = BetterPlayerController(
      //     const BetterPlayerConfiguration(),
      //     betterPlayerDataSource: betterPlayerDataSource);
    });
  }

  Future<File> decryptFile() async {
    // File inFile = File("videoenc.aes");
    // File outFile = File("videodec.mp4");

    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final localPath = appDocumentsDirectory.path;

    File outFile = File('$localPath/${widget.localVideoName}.mp4');
    File inFile = File('$localPath/${widget.localVideoName}.aes');

    bool outFileExists = await outFile.exists();

    if (!outFileExists) {
      await outFile.create();
    }

    final videoFileContents = inFile.readAsBytesSync();

    final key = Encrypt.Key.fromUtf8(secretKey);
    final iv = Encrypt.IV.fromLength(16);

    final encrypter = Encrypt.Encrypter(Encrypt.AES(key));

    final encryptedFile = Encrypt.Encrypted(videoFileContents);
    final decrypted = encrypter.decrypt(encryptedFile, iv: iv);

    final decryptedBytes = latin1.encode(decrypted);
    return await outFile.writeAsBytes(decryptedBytes);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer.file(
        path,
        betterPlayerConfiguration: const BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
