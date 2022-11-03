import '../config.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isShow = false;
  List<dynamic> productList = appArray.listImages;
  List items = [];

  /* List foundUsers = [];*/
  onChanges() {
    isShow = !isShow;
    update();
  }

  onFinal(value) {
    if (searchController.text.isNotEmpty) {
      items = [];
      update();
      for (var i = 0; i < productList.length; i++) {
        if (productList[i]["title"].toString().toLowerCase().contains(value) &&
            productList[i]["color"].toString().toLowerCase().contains(value)) {
          items.add(productList[i]);
        }
      }
      update();
    } else {
      items = [];
      update();
    }
  }

/* @override
    void onReady() {
        items.addAll(productList);
        update();
      // TODO: implement onReady
      super.onReady();
    }*/

/*onSearch (String query) {
      List dummySearchList = [];
      dummySearchList.addAll(productList);
      if(query.isNotEmpty) {
        List dummyListData = [];
        for (var item in dummySearchList) {
          if(item.contains(query)) {
            dummyListData.add(item);
          }
        }
        onDummy(dummyListData);
        return;
      } else {
       onProduct();
      }
    }*/

/*onDummy(dummyListData) {
      items.clear();
      items.addAll(dummyListData);
      update();
    }

    onProduct() {
      items.clear();
      items.addAll(productList);
      update();
    }*/

/*onResult(results) {
      foundUsers = results;
      update();
    }*/

/*void onRunFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = productList;
    } else {
      results = productList
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
   onResult(results);
  }*/
}
