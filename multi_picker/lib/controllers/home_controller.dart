import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config.dart';

class HomeController extends GetxController {
  VideoPlayerController? videoPlayerController;
  VideoPlayerController? cameraVideoPlayerController;
  ImagePicker picker = ImagePicker();
  bool isPlaying = false;
  AudioPlayer? audioPlayer = AudioPlayer();
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  double currentPositionInSeconds = 0;
  double songDurationInSeconds = 0;
  String currentPosition = "0:0:0";
  String songDuration = "0:0:0";


  DateTime? date;
  DateTime? time;
  DateTime? dateTime;

  File? audio;
  File? image;
  File? video;
  File? camera;
  File? file;


  record() async{
    if(!isRecorderReady) return;
      await recorder.startRecorder(toFile: "Codec.mp3");
      update();
  }

  Future stopRecording () async{
    if(!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    print("Recorded Audio Path: $audioFile");
    update();
  }

  recorderPermission () async{
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw "Permission Not granted";
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(microseconds: 500));
    update();
  }

 /* String formatTime (Duration duration) {
           String towDigits (int n)=> n.toString().padLeft(2,'0');
           final hours = towDigits(duration.inHours);
           final minutes = towDigits(duration.inMinutes.remainder(60));
           final seconds = towDigits(duration.inSeconds.remainder(60));

           return [
             if (duration.inHours > 0) hours,
             minutes,
             seconds,
           ].join(":");
  }*/


  // Get Image from Gallery & Camera Method
  Future pickImage(source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    this.image = imageTemp;
    update();
    Get.back();
  }

  // Get Video From Gallery & Camera
  Future pickVideo() async {
    XFile? pickedFile = (await picker.pickVideo(source: ImageSource.gallery)) ;
    video = File(pickedFile!.path);
    videoPlayerController = VideoPlayerController.file(video!)..initialize().then((_) {
      videoPlayerController!.play();
      update();
      Get.back();
    });
  }

  // Get Video From Gallery & Camera
  Future pickVideoCamera() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.camera) ;
    camera = File(pickedFile!.path);
    cameraVideoPlayerController = VideoPlayerController.file(camera!)..initialize().then((_) {
      cameraVideoPlayerController!.play();
      update();
      Get.back();
    });
  }


  playAudioFromLocalStorage() async {

     final result = await FilePicker.platform.pickFiles(type: FileType.audio);
         if(result != null) {
           file = File(result.files.single.path!);
           await audioPlayer?.setUrl(file!.path);
           audioPlayer?.play();
           update();
         }
  }
  pauseAudio() async{

    await audioPlayer?.pause() ;
     update();
  }
  stopAudio() async {

    await audioPlayer?.stop();
    update();
  }



  onDateTimeChange (val) {
    dateTime = val;
    update();
  }

  onDateChange (val) {
     date = val;
     update();
  }

  onTimeChange (val) {
     time = val;
     update();
  }

  @override
  void onReady() {
    recorderPermission();
   /* audioPlayer?.playerStateStream.listen((state) {

    });*/
     /* songDuration = playing!.audio.duration.toString().split(".")[0];
      songDurationInSeconds = playing.audio.duration.inSeconds.toDouble();*/
     audioPlayer?.positionStream.listen((playing) {
       songDuration = playing.toString().split(".")[0];
       songDurationInSeconds = playing.inSeconds.toDouble();
       /*print("songDuration: $songDuration");
       print("songDurationSecond: $songDurationInSeconds");*/
       update();
     });


    audioPlayer?.durationStream.listen((duration) {
      currentPosition = duration.toString().split(".")[0];
      currentPositionInSeconds = duration!.inSeconds.toDouble();
      /*print("songPosition: $currentPosition");
      print("songPositionSecond: $currentPositionInSeconds");*/
      update();
    });

     update();

    // TODO: implement onReady
    super.onReady();
  }


 @override
  void onClose() {
    videoPlayerController!.dispose();
    cameraVideoPlayerController!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
