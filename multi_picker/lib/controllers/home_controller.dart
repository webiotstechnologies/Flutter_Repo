import 'dart:async';
import 'dart:io';
import 'package:just_audio/just_audio.dart';
import '../config.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../routs/index.dart';
// Audio_session

class HomeController extends GetxController {
  VideoPlayerController? videoPlayerController;
  VideoPlayerController? cameraVideoPlayerController;
  ImagePicker picker = ImagePicker();
  bool isPlaying = false;
  AudioPlayer? audioPlayer = AudioPlayer();
  bool isRecorderReady = false;

  double currentPositionInSeconds = 0;
  double songDurationInSeconds = 0;
  String currentPosition = "0:0";
  String songDuration = "0:0";

  Codec codec = Codec.aacMP4;
  String mPath = 'tau_file.mp4';
  FlutterSoundPlayer? mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? mRecorder = FlutterSoundRecorder();
  bool mPlayerIsInited = false;
  bool mRecorderIsInited = false;
  bool mPlaybackReady = false;

  DateTime? date;
  DateTime? time;
  DateTime? dateTime;

  File? audio;
  File? image;
  XFile? pImage;
  File? video;
  File? camera;
  File? file;

  String recordingTime = '0:0';
  bool isRecording = false;

  // record audio
  getRecorderFn() {
    if (!mRecorderIsInited || !mPlayer!.isStopped) {
      return null;
    }
    return mRecorder!.isStopped ? record : stopRecorder;
  }

  // play recorded audio
  getPlaybackFn() {
    if (!mPlayerIsInited || !mPlaybackReady || !mRecorder!.isStopped) {
      return null;
    }
    return mPlayer!.isStopped ? play : stopPlayer;
  }

  /* void recordTime() {
    var startTime = DateTime.now();
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      var diff = DateTime.now().difference(startTime);

      recordingTime =
      '${diff.inHours < 60 ? diff.inHours : 0}:${diff.inMinutes < 60 ? diff.inMinutes : 0}:${diff.inSeconds < 60 ? diff.inSeconds : 0}';

      print(recordingTime);

      if (!isRecording) {
        t.cancel(); //cancel function calling
      }
     update();
    });
    update();
  }*/

  /*record() async{

    if(!isRecorderReady) return;
      await recorder.startRecorder(toFile: '/data/user/0/thai ja');
      update();
  }

    stopRecording () async{

    if(!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    print('path: $path');
    final audioFile = File(path!);
    print("Recorded Audio Path: $audioFile");
    print(File(path));
    update();
  }
*/

  /*// microphone recorder permission
  recorderPermission () async{
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw "Permission Not granted";
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(microseconds: 500));
    update();
  }*/

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
    File imageTemp = File(image.path);
    this.image = imageTemp ;
    pImage = image;
    update();
    var data = {
      "image": pImage,
      "source": source == ImageSource.gallery ? "Gallery" : "Camera",
    };

   Get.back();
    Get.toNamed(routeName.imageScreen,
        arguments: data);
  }

  // Get Video From Gallery & Camera
  Future pickVideo(source) async {
    XFile? pickedFile = (await picker.pickVideo(source: source));
    video = File(pickedFile!.path);
    videoPlayerController = VideoPlayerController.file(video!)
      ..initialize().then((_) {
        videoPlayerController!.play();
        update();
        var data = {
          "video": video,
          "controller": videoPlayerController,
          "source": source == ImageSource.gallery ? "Gallery" : "Camera"
        };
        Get.back();
        Get.toNamed(routeName.videoScreen,arguments: data);
      });
  }

  /*// Get Video From Gallery & Camera
  Future pickVideoCamera() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.camera);
    camera = File(pickedFile!.path);
    cameraVideoPlayerController = VideoPlayerController.file(camera!)
      ..initialize().then((_) {
        cameraVideoPlayerController!.play();
        update();
        Get.back();
      });
  }*/

  // play audio from storage
  playAudioFromLocalStorage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      file = File(result.files.single.path!);
      await audioPlayer?.setUrl(file!.path);
      audioPlayer?.play();
      update();
    }
  }

  // pause audio
  pauseAudio() async {
    await audioPlayer?.pause();
    update();
  }

  // stop audio
  stopAudio() async {
    await audioPlayer?.stop();
    update();
  }

  // date time change method
  onDateTimeChange(val) {
    dateTime = val;
    update();
  }

  // date change method
  onDateChange(val) {
    date = val;
    update();
  }

  // time change method
  onTimeChange(val) {
    time = val;
    update();
  }

  //  permission handler & audio record method
  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await mRecorder!.openRecorder();
    if (!await mRecorder!.isEncoderSupported(codec) && kIsWeb) {
      codec = Codec.opusWebM;
      mPath = 'tau_file.webm';
      if (!await mRecorder!.isEncoderSupported(codec) && kIsWeb) {
        mRecorderIsInited = true;
        return;
      }
    }
    mRecorderIsInited = true;
  }

  // record audio
  void record() {
    mRecorder!.startRecorder(toFile: mPath, codec: codec).then((value) {
      update();
    });
  }

  // stop recording method
  void stopRecorder() async {
    await mRecorder!.stopRecorder().then((value) {
      //var url = value;
      mPlaybackReady = true;
      update();
    });
  }

  // play recorded audio
  void play() {
    assert(mPlayerIsInited &&
        mPlaybackReady &&
        mRecorder!.isStopped &&
        mPlayer!.isStopped);
    mPlayer!
        .startPlayer(
            fromURI: mPath,
            whenFinished: () {
              update();
            })
        .then((value) {
      update();
    });
  }

  // stop player
  void stopPlayer() {
    mPlayer!.stopPlayer().then((value) {
      update();
    });
  }

  @override
  void onReady() {
    mPlayer!.openPlayer().then((value) {
      mPlayerIsInited = true;
      update();
    });

    openTheRecorder().then((value) {
      mRecorderIsInited = true;
      update();
    });

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
    mPlayer!.closePlayer();
    mPlayer = null;
    mRecorder!.closeRecorder();
    mRecorder = null;
    videoPlayerController!.dispose();
    cameraVideoPlayerController!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
