import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ILoadingPage.dart';

class LoadingPage<T> extends ILoadingPage<T> {
  LoadingPage({
    required Future<T> loader,
    required Widget Function(T? response) content,
  }) : super(
          loader: loader,
          content: content,
        );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: super.loader,
        builder: (context, response) {
          if (response.hasData) {
            return content(response.data);
          } else if (response.hasError) {
            print("${response.error}");
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        });
  }
}
