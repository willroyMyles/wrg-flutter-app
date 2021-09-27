import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:wrg2/backend/enums/enum.tags.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/make-model.dart';
import 'package:wrg2/fontend/pages/create/state.create.dart';

class CreatePost extends StatelessWidget {
  final cps = Get.put(CreatePostState());
  final ts = Get.find<ServiceTheme>();
  final divider = 3.3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              alignment: Alignment.centerLeft,
              child: Text("create post").huge()),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: cps.formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    margin: EdgeInsets.all(2),
                    // color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (value) =>
                              cps.validateFunction("title", value),
                          controller: cps.crtls["title"],
                          decoration: InputDecoration(hintText: "title"),
                        ).input(label: "title"),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) =>
                              cps.validateFunction("content", value),
                          controller: cps.crtls["content"],
                          decoration: InputDecoration(hintText: "content"),
                        ).input(label: "content"),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / divider,
                                child: InkWell(
                                  onTap: () async {
                                    cps.showMake();
                                  },
                                  child: IgnorePointer(
                                    child: TextFormField(
                                      validator: (value) =>
                                          cps.validateFunction("make", value),
                                      controller: cps.crtls["make"],
                                      decoration:
                                          InputDecoration(labelText: "make"),
                                    ).input(label: "make"),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width / divider,
                                child: InkWell(
                                  onTap: () async {
                                    cps.showMake();
                                  },
                                  child: IgnorePointer(
                                    child: TextFormField(
                                      validator: (value) =>
                                          cps.validateFunction("model", value),
                                      controller: cps.crtls["model"],
                                      decoration:
                                          InputDecoration(labelText: "model"),
                                    ).input(label: "model"),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width / divider,
                                child: InkWell(
                                  onTap: () async {
                                    Get.dialog(
                                        Container(
                                          height: 330,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                          child: Material(
                                            color: ts.grey1,
                                            child: YearPicker(
                                              firstDate: DateTime.now()
                                                  .subtract(
                                                      Duration(days: 365 * 50)),
                                              lastDate: DateTime.now()
                                                  .add(Duration(days: 365 * 2)),
                                              selectedDate: DateTime.now(),
                                              onChanged: (value) {
                                                cps.setYear(value);
                                                Get.close(1);
                                              },
                                              currentDate: DateTime.now(),
                                              initialDate: DateTime.now(),
                                            ),
                                          ),
                                        ),
                                        barrierColor:
                                            Colors.black.withOpacity(.4),
                                        useRootNavigator: false);
                                  },
                                  child: IgnorePointer(
                                    child: TextFormField(
                                      validator: (value) =>
                                          cps.validateFunction("year", value),
                                      controller: cps.crtls["year"],
                                      decoration:
                                          InputDecoration(labelText: "year"),
                                    ).input(label: "year"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {
                                  cps.showCat();
                                },
                                child: IgnorePointer(
                                  child: Container(
                                    width: Get.width / 2.14,
                                    child: TextFormField(
                                      validator: (value) => cps
                                          .validateFunction("category", value),
                                      controller: cps.crtls["category"],
                                      decoration:
                                          InputDecoration(hintText: "category"),
                                    ).input(label: "category"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 5),
                    // child: GroupButton(
                    //   isRadio: false,
                    //   buttons: Tags.values.map((e) => e.name),
                    //   onSelected: (index, isSelected) {
                    //     //should add to selected
                    //   },
                    // )
                  ),
                  Hero(
                    tag: "detail view fab",
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 10),
                      child: ProgressButton(
                        maxWidth: Get.width / 2,
                        radius: 5.0,
                        stateWidgets: {
                          ButtonState.idle: Text(
                            "submit",
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          ButtonState.loading: Container(),
                          ButtonState.success: Text("success"),
                          ButtonState.fail: Text("Oops"),
                        },
                        stateColors: cps.submitButton.stateColors,
                        onPressed: () {
                          cps.onSubmit();
                        },
                        state: cps.submitButton.buttonState,
                      ),
                      // child: FlatButton(
                      //         onPressed: () {
                      //           cps.onSubmit();
                      //         },
                      //         color: ts.fg.value,
                      //         child: Text("submit"))
                      //     .primary(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
