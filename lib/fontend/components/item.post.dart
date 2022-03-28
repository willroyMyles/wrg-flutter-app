import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:wrg2/backend/enums/enum.post.dart';
import 'package:wrg2/backend/extensions/ext.dart';
import 'package:wrg2/backend/models/post.model.dart';
import 'package:wrg2/backend/services/service.constants.dart';
import 'package:wrg2/backend/services/service.helper.dart';
import 'package:wrg2/backend/services/service.information.dart';
import 'package:wrg2/backend/services/service.theme.dart';
import 'package:wrg2/fontend/components/helper%20widgets/Gaussian.dart';
import 'package:wrg2/fontend/components/imageForCategory.dart';
import 'package:wrg2/fontend/pages/discover_details/view.details.dart';

class PostItem extends StatelessWidget {
  final PostModel item;
  final isLoading;

  PostItem({Key key, this.item, this.isLoading = false}) : super(key: key);

  final ts = Get.find<ServiceTheme>();
  final tag = getTag();
  final infoService = Get.find<InformationService>();
  final baseCol = Colors.grey;
  final highCol = Colors.white;

  @override
  Widget build(BuildContext context) {
    if (isLoading)
      return FadeIn(
        duration: Constants.durationLong,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          clipBehavior: Clip.antiAlias,
          decoration: Constants.decoration,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * .6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeShimmer(
                            // fadeTheme: FadeTheme.dark,
                            baseColor: baseCol,
                            highlightColor: highCol,
                            millisecondsDelay: 0,
                            height: 15,
                            width: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeShimmer(
                            // fadeTheme: FadeTheme.dark,
                            baseColor: baseCol,
                            highlightColor: highCol,
                            millisecondsDelay: 100,
                            height: 15,
                            width: 150,
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FadeShimmer(
                                  // fadeTheme: FadeTheme.dark,
                                  baseColor: baseCol,
                                  highlightColor: highCol,
                                  millisecondsDelay: 170,
                                  height: 15,
                                  width: 50,
                                ),
                                FadeShimmer(
                                  // fadeTheme: FadeTheme.dark,
                                  baseColor: baseCol,
                                  highlightColor: highCol,
                                  millisecondsDelay: 280,
                                  height: 15,
                                  width: 50,
                                ),
                                FadeShimmer(
                                  // fadeTheme: FadeTheme.dark,
                                  baseColor: baseCol,
                                  highlightColor: highCol,
                                  millisecondsDelay: 390,
                                  height: 15,
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

    return GestureDetector(
      onTapDown: (details) {
        print(details);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 15, color: ts.grey.withOpacity(.0))
            ],
            color: ts.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4)),
        child: Guassian(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: InkWell(
                  onTap: () async {
                    Get.to(() => DiscoverDetails(item: item, tag: tag));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: Get.width * .6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title).h1(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.content,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                            ).h2(),
                            SizedBox(
                              height: 70,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.make).h3(),
                                  Text(item.model).h3(),
                                  Text(item.year.toString()).h3(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * .2,
                        clipBehavior: Clip.none,
                        child: ImageForCategory(
                          item: item,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 5,
                child: item.status.textName,
              )
            ],
          ),
        ),
      ),
    ).touchy();
  }
}
