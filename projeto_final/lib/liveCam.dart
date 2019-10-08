import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveCam extends StatefulWidget {
  LiveCam({Key key}) : super(key: key);
  
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<LiveCam> {
  VideoPlayerController playerController;
  Future<void> futureController;

  @override
  void initState() {    
    playerController = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    futureController = playerController.initialize();
    playerController.setLooping(true);
    playerController.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Doorbell Live"),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            color: Colors.white,
            icon: Icon(Icons.live_tv),
            onPressed: () {},
          );
        }),
      ),
      body: FutureBuilder(
        future: futureController,
        builder: (context, snapshot) {
          if  (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: playerController.value.aspectRatio,
              child: VideoPlayer(playerController),
            );
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if (playerController.value.isPlaying)
              playerController.pause();
            else
              playerController.play();
          });
        },
        child: Icon(
          playerController.value.isPlaying ? Icons.pause : Icons.play_arrow, 
          color: Colors.white,
        ),
      ),      
    );
  }
}