import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/AndroidElements/AndroidButton.dart';
import 'package:statecontroll/Widgets/Elements/AndroidElements/AndroidText.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IActionExpansionTile.dart';

class AndroidExpansionTile extends IActionExpansionTile {
  AndroidExpansionTile(
    String title, {
    Map<String, VoidCallback?>? childrens,
    EdgeInsets? outMargin,
  }) : super(
          title,
          childrens: childrens ?? {},
          outMargin: outMargin,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: outMargin,
      width: double.infinity,
      child: AndroidButton(
          content: title,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: AndroidText(
                              title,
                              textSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Column(
                            children: childrens!.keys.map(
                              (String key) {
                                return AndroidButton(
                                  content: key,
                                  onPressed: childrens![key],
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
