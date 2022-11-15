import 'dart:async';
import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:just_audio/just_audio.dart';
import '../config.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeController extends GetxController {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

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
  TimeOfDay? noonTime;
  TimeOfDay? morningTime;
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

  // Video Play Method
  onVideoPlay() {
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        looping: true);
  }

  // record audio
  getRecorderFn() { if(mPlayer != null ) {
    if (!mRecorderIsInited || !mPlayer!.isStopped) {
      return null;
    }
  }
    return mRecorder!.isStopped ? record : stopRecorder;
  }

  // play recorded audio
  getPlaybackFn() {
    if (!mPlayerIsInited || !mPlaybackReady || !mRecorder!.isStopped) {
      return null;
    }
    return mPlayer != null ? mPlayer!.isStopped ? play : stopPlayer : play;
  }

  // Video Play & Pause Method
  onPlayPause() {
    if (isPlaying == true) {
      audioPlayer?.pause();
      isPlaying = false;
      update();
    } else {
      audioPlayer?.play();
      isPlaying = true;
      update();
    }
    update();
  }

  // Slider Change Method
  onSliderChange(val) {
    audioPlayer?.seek(Duration(seconds: val.toInt()));
    val = val;
    update();
  }

  // Get Image from Gallery & Camera Method
  Future pickImage(source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File imageTemp = File(image.path);
    this.image = imageTemp;
    pImage = image;
    update();
    var data = {
      "image": pImage,
      "source": source == ImageSource.gallery ? "Gallery" : "Camera",
    };
    Get.back();
    Get.toNamed(routeName.imageScreen, arguments: data);
  }

  // Get Video From Gallery & Camera
  Future pickVideo(source) async {
    XFile? pickedFile = (await picker.pickVideo(source: source));
    video = File(pickedFile!.path);
    videoPlayerController = VideoPlayerController.file(video!)
      ..initialize().then((_) {
        onVideoPlay();
        update();
        var data = {
          "controller": chewieController,
          "source": source == ImageSource.gallery ? "Gallery" : "Camera"
        };
        Get.back();
        Get.toNamed(routeName.videoScreen, arguments: data);
      });
  }

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
    morningTime = TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute);
    update();
  }

  // date change method
  onDateChange(val) {
    date = val;
    update();
  }

  // time change method
  onTimeChange(val) {
    print(val);
    time = val;
    noonTime = TimeOfDay(hour: time!.hour, minute: time!.minute);
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

    // Song Duration
    audioPlayer?.positionStream.listen((playing) {
      songDuration = playing.toString().split(".")[0];
      songDurationInSeconds = playing.inSeconds.toDouble();
      update();
    });
     // Song Position
    audioPlayer?.durationStream.listen((duration) {
      currentPosition = duration.toString().split(".")[0];
      currentPositionInSeconds = duration!.inSeconds.toDouble();
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
    file = null;
    mRecorder!.closeRecorder();
    mRecorder = null;
    audioPlayer?.dispose();
    audioPlayer?.stop();
    chewieController?.dispose();
    videoPlayerController?.dispose();

    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    chewieController?.dispose();
    videoPlayerController?.dispose();
    file = null;
    audioPlayer?.dispose();
    audioPlayer?.stop();

    mPlayer!.closePlayer();
    mPlayer = null;
    mRecorder!.closeRecorder();
    mRecorder = null;
    // TODO: implement dispose
    super.dispose();
  }
}
