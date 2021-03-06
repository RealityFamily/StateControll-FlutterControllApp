import 'package:flutter/material.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/IActionExpansionTile.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebButton.dart';
import 'package:statecontroll/Widgets/Elements/WebElements/WebText.dart';

class WebExpansionTile extends IActionExpansionTile {
  WebExpansionTile(
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
      color: Theme.of(context).buttonColor,
      margin: outMargin,
      child: ExpansionTile(
        title: WebText(title, outMargin: EdgeInsets.symmetric(vertical: 5),),
        backgroundColor: Theme.of(context).backgroundColor,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: childrens!.keys.map(
                (String key) {
                  return WebButton(
                    content: key,
                    onPressed: childrens![key],
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
