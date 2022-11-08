import '../config.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isShow = false;
  bool isPrice = false;
  bool isSort = false;
  int? selectIndex;
  int? sizeIndex;
  int? colorIndex;
  List<dynamic> productList = [];
  List items = [];
  List sizesList = [];
  List gendersList = [];
  String gender = "";
  String size = "";
  String color = "";

  // List And Grid Icon Change Method
  onChanges() {
    isShow = !isShow;
    update();
  }

  // Gender Change Index
  onGenderChange(int index) {
    selectIndex = index;
    update();
  }

  // Size Change Index
  onSizeChange(int index) {
    sizeIndex = index;
    update();
  }

  // Color Change Index
  onColorChange(int index) {
    colorIndex = index;
    update();
  }

  // TextField onChange Method
  onTextChange(value) {
    if (value.length > 0) {
      onFinal(value, "", "");
    } else {
      items =productList;
     update();
    }
  }

  // Reset Button
  onReset() {
    items = productList;
    selectIndex = null;
    sizeIndex = null;
    colorIndex = null;
    gender = "";
    size = "";
    color = "";
    update();
    Get.back();
  }

  // Filter Method
  onFinal(value, isSort,isLow) {
    items = [];
    update();

    for (var i = 0; i < productList.length; i++) {
      if (value != null &&
          value != "" &&
          gender != "" &&
          size != "" &&
          color != "") {
        if (productList[i]["title"].toString().toLowerCase().contains(value) &&
            productList[i]["color"].toString().toLowerCase().contains(value) &&
            (productList[i]["type"] == gender &&
                productList[i]["size"] == size &&
                productList[i]["color"] == color)) {
          items.add(productList[i]);
        }
      } else if (value != null && value != "") {
        if (productList[i]["title"].toString().toLowerCase().contains(value) &&
            productList[i]["color"].toString().toLowerCase().contains(value)) {
          items.add(productList[i]);
        }
      } else if (gender != "" && size != "" && color != "") {
        if (productList[i]["type"] == gender &&
            productList[i]["size"] == size &&
            productList[i]["color"] == color) {
          items.add(productList[i]);
        }
      } else if (size != "" && color != "") {
        if (productList[i]["size"] == size &&
            productList[i]["color"] == color) {
          items.add(productList[i]);
        }
      } else if (size != "" && gender != "") {
        if (productList[i]["size"] == size &&
            productList[i]["type"] == gender) {
          items.add(productList[i]);
        }
      } else if (color != "" && gender != "") {
        if (productList[i]["color"] == color &&
            productList[i]["type"] == gender) {
          items.add(productList[i]);
        }
      } else if (size != "") {
        if (productList[i]["size"] == size) {
          items.add(productList[i]);
        }
      } else if (color != "") {
        if (productList[i]["color"] == color) {
          items.add(productList[i]);
        }
      } else if (gender != "") {
        if (productList[i]["type"] == gender) {
          items.add(productList[i]);
        }
      }
    }

    //when all filters variables are blank set all data in list
    if(value == "" && gender == "" && size == "" && color == ""){
      items = productList;
    }

    if (isSort != "" && isSort != null && isSort == true) {
        onSorting(isLow);
      }
    update();
  }

  // Sorting Method
  onSorting(bool isLow) {
    if (isLow == false) {
      items.sort((a, b) => a["price"].compareTo(b["price"]));
      update();

    } else {
      items.sort((a, b) => b["price"].compareTo(a["price"]));
      update();
    }
  }


  @override
  void onReady() {
    // TODO: implement onReady

    // Get Store Data In Storage
    sizesList = appArray.sizeList;
    gendersList = appArray.genderList;
    productList = appCtrl.storage.read("productList");
    items = productList;
    update();
    super.onReady();
  }
}
