import 'package:flutter/widgets.dart';

abstract class ILoadingPage<T> extends StatelessWidget {
  Future<T> loader;
  Widget content;

  ILoadingPage({
    required Future<T> loader,
    required Widget content,
  })   : this.loader = loader,
        this.content = content;
}
