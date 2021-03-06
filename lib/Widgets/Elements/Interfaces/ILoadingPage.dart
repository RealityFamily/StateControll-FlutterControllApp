import 'package:flutter/widgets.dart';

abstract class ILoadingPage<T> extends StatelessWidget {
  Future<T> loader;
  Widget Function(T? response) content;

  ILoadingPage({
    required Future<T> loader,
    required Widget Function(T? response) content,
  })   : this.loader = loader,
        this.content = content;
}
