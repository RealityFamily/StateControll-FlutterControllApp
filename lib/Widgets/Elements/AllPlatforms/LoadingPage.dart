import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:statecontroll/Widgets/Cofigurator.dart';
import 'package:statecontroll/Widgets/Elements/Interfaces/ILoadingPage.dart';

class LoadingPage<T> extends ILoadingPage<T> {
  LoadingPage({
    required Future<T> loader,
    required Widget content,
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
            return Container();
          } else if (response.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Configurator().getFabric().getText("${response.error}"),
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
