import 'package:aris_mvp_core/aris_mvp_core.dart';
import 'package:flutter/material.dart';

import '../widgets/progress_dialog.dart';

///
/// @author Aris Hu created at 2020-12-17
///
abstract class BasePageState<T extends StatefulWidget, P extends AbstractPagePresenter> extends AbstractPageState<T, P> {
  @override
  Widget buildProgress() {
    return const ProgressDialog(hintText: '正在加载...');
  }
}