import 'dart:io';
import 'package:file_picker/file_picker.dart';

import '../config.dart';

class HomeController extends GetxController {
  VideoPlayerController? videoPlayerController;
  VideoPlayerController? cameraVideoPlayerController;
  ImagePicker picker = ImagePicker();
  bool isPlaying = false;
  AudioPlayer? audioPlayer = AudioPlayer();

  DateTime? date;
  DateTime? time;
  DateTime? dateTime;

  File? audio;
  File? image;
  File? video;
  File? camera;
  File? file;


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
         audioPlayer?.play(file!.path.toString(),isLocal: true);
         print("File: $file");
       }
      update();

  }
  pauseAudio() async{
    int? result = await audioPlayer!.pause() ;
     if(result == 1) {
       print("pause success");
     }
     update();
  }
  stopAudio() async {
    int? result = await audioPlayer!.stop();
    if(result == 1) {
      print("stop success");
    } else {
      print("error While Stopping");
    }
    update();
  }
  resumeAudio() async {
    int? result = await audioPlayer!.resume();
    if(result == 1) {
      print("resume success");
    } else {
      print("error While Resume");
    }
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
  void onClose() {
    videoPlayerController!.dispose();
    cameraVideoPlayerController!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
