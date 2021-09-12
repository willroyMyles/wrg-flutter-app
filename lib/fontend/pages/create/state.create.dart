import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wrg2/backend/extensions/text.extension.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.api.dart';
import 'package:wrg2/backend/services/service.carData.dart';
import 'package:wrg2/fontend/components/cat-sub.dart';
import 'package:wrg2/fontend/components/make-model.dart';

class CreatePostState extends GetxController with StateMixin {
  Map<String, TextEditingController> crtls = Map();
  var formKey = GlobalKey<FormState>();
  List<List<dynamic>> carsList = [];
  // ignore: non_constant_identifier_names
  List<dynamic> sub_catList = [];
  int make = 0;

  final service = Get.find<APIService>();

  validateFunction(String name, String value) {
    if (value == "" || value == null) return "$name cannot be empty";
  }

  clearInputs() {
    for (var item in crtls.values) {
      item.clear();
    }
  }

  void onSubmit() async {
    var val = formKey.currentState.validate();
    if (!val) return;

    var input = PostModel(
      title: crtls["title"].text,
      content: crtls["content"].text,
      year: int.parse(crtls["year"].text),
      model: crtls["model"].text,
      make: crtls["make"].text,
      category: crtls["category"].text,
      views: 0,
      // user_info: service.getUserInfo()
    );

    var ans = await service.createPost(input);
    if (ans) {
      Get.snackbar("success", "post created");
      clearInputs();
    } else {
      Get.snackbar("Opps", "Post wasnt created");
    }
  }

  void showMake() async {
    carsList = processCars();
    await showModalBottomSheet(
      context: Get.context,
      isDismissible: true,
      isScrollControlled: true,
      barrierColor: ts.fgt.value,
      builder: (context) {
        return MakeList(
          callback: (value) => setMake,
        );
      },
    );

    await showModalBottomSheet(
      context: Get.context,
      isDismissible: true,
      isScrollControlled: true,
      barrierColor: ts.fgt.value,
      builder: (context) {
        return ModelList(
          callback: (value) => setModel,
          idx: make,
        );
      },
    );
  }

  void showCat() async {
    sub_catList = processList();
    await showModalBottomSheet(
      context: Get.context,
      isDismissible: true,
      isScrollControlled: true,
      barrierColor: ts.fgt.value,
      builder: (context) {
        return CatSubView();
      },
    );
  }

  void setMake(dynamic make) {
    crtls["make"].text = carsList.elementAt(make).elementAt(0).toString();
    this.make = make;
  }

  void setModel(dynamic model) {
    crtls["model"].text = carsList.elementAt(make).elementAt(model).toString();
  }

  void setMakeAndModel(int make, int model) {
    crtls["make"].text = carsList.elementAt(make).elementAt(0).toString();
    crtls["model"].text = carsList.elementAt(make).elementAt(model).toString();
  }

  void setCategoryAndSubcategory(int make, int model) {
    crtls["category"].text =
        sub_catList.elementAt(make).elementAt(0).toString();
    crtls["sub_category"].text =
        sub_catList.elementAt(make).elementAt(model).toString();
  }

  void setYear(DateTime value) {
    crtls["year"].text = value.year.toString();
  }

  @override
  void onInit() {
    super.onInit();
    crtls.putIfAbsent("title", () => TextEditingController());
    crtls.putIfAbsent("content", () => TextEditingController());
    crtls.putIfAbsent("make", () => TextEditingController());
    crtls.putIfAbsent("model", () => TextEditingController());
    crtls.putIfAbsent("year", () => TextEditingController());
    crtls.putIfAbsent("category", () => TextEditingController());
  }

  void setCategory(int index) {
    crtls["category"].text = sub_catList.elementAt(index);
  }
}
