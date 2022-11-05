import 'dart:developer';

import '../config.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isShow = false;
  int selectIndex = 0;
  int sizeIndex = 0;
  int colorIndex = 0;
  List<dynamic> productList = appArray.listImages;
  List items = [];
  String gender = "";
  String size = "";
  String color = "";

  onChanges() {
    isShow = !isShow;
    update();
  }

  onGenderChange(int index) {
    selectIndex = index;
    update();
  }

  onSizeChange(int index) {
    sizeIndex = index;
    update();
  }

  onColorChange(int index) {
    colorIndex = index;
    update();
  }

  onFinal(value, gender, size, color, {bool his = false}) {
    items = [];
    update();
    for (var i = 0; i < productList.length; i++) {
      if (productList[i]["title"].toString().toLowerCase().contains(value) &&
          productList[i]["color"].toString().toLowerCase().contains(value) &&
          (productList[i]["type"] == gender &&
              productList[i]["size"] == size &&
              productList[i]["color"] == color) &&
          (his
              ? productList[i].sort((a, b) => a["price"].compareTo(b["price"]))
              : productList[i]
                  .sort((a, b) => b["price"].compareTo(a["price"])))) {
        items.add(productList[i]);
      }
    }
    update();
  }

  onLowToHigh(bool isLow) {
    if (isLow == false) {
      productList.sort((a, b) => a["price"].compareTo(b["price"]));
      update();
    } else {
      productList.sort((a, b) => b["price"].compareTo(a["price"]));
      update();
    }
  }

/*onHighToLow() {
    productList.sort((a, b) => b["price"].compareTo(a["price"]));
    update();
  }*/

/* onMale() {
    items = [];
    List<dynamic> data = productList.where((element) {
      return element["type"] == "male";
    }).toList();

    items = data;
    update();
  }

  onFemale() {
    items = [];
    List<dynamic> data = productList.where((element) {
      return element["type"] == "female";
    }).toList();

    items = data;
    update();
  }*/

/* onSmallSize() {
    items = [];
    List<dynamic> data = productList.where((element) {
      return element["size"] == "S";
    }).toList();

    items = data;
    update();
  }

  onChangeColor() {
    items = [];
    List<dynamic> data = productList.where((element) {
      return element["color"] == "blue";
    }).toList();

    items = data;
    update();
  }*/
}
