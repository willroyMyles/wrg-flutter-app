import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
  List<List<dynamic>> sub_catList = [];

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
      subCategory: crtls["sub_category"].text,
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
    var ans = await Get.dialog(
        Container(
            height: 330,
            width: Get.width,
            alignment: Alignment.center,
            child: MakeModelView()),
        barrierColor: Colors.black.withOpacity(.4),
        useRootNavigator: true);
    print(ans);
  }

  void showCat() async {
    sub_catList = processList();
    await Get.dialog(
        Container(
            height: 330,
            width: Get.width,
            alignment: Alignment.center,
            child: CatSubView()),
        barrierColor: Colors.black.withOpacity(.4),
        useRootNavigator: true);
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
    crtls.putIfAbsent("sub_category", () => TextEditingController());
  }
}
