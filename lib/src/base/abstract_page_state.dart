// MIT License
//
// Copyright (c) 2020 aris.org.cn
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import 'package:flutter/material.dart';

import '../../aris_mvp_core.dart';
import 'base_state.dart';

///
/// Page State with Progress
/// @author Aris Hu created at 2020-12-17
///
abstract class AbstractPageState<T extends StatefulWidget, P extends AbstractPagePresenter> extends BaseState<T, P> {
  bool _isShowDialog = false;

  bool get isShowDialog => _isShowDialog;

  Widget _progress;

  /// 获取进度条对象
  Widget get progress => _progress ?? null;

  /// 进度条是否初始化
  bool get isProgressInitialized => progress != null;

  @override
  void showProgress() {
    if (mounted && !isShowDialog && isProgressInitialized) {
      _isShowDialog = true;
      try {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          barrierColor: const Color(0x00FFFFFF), // 默认dialog背景色为半透明黑色，这里修改为透明（1.20添加属性）
          builder: (_) {
            return WillPopScope(
              onWillPop: () async {
                // 拦截到返回键，证明dialog被手动关闭
                _isShowDialog = false;
                return Future.value(true);
              },
              child: progress,
            );
          },
        );
      } catch (e) {
        /// 异常原因主要是页面没有build完成就调用Progress。
        print(e);
      }
    }
  }

  /// 可自定义Progress
  Widget buildProgress();

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void closeProgress() {
    if (mounted && isShowDialog) {
      _isShowDialog = false;
    }
  }

  @override
  void showToast(String string) {}

  @override
  @mustCallSuper
  void awake() {
    super.awake();
  }

  @override
  @mustCallSuper
  void start() {
    if (!isProgressInitialized) {
      this._progress = this.buildProgress();
    }
    super.start();
  }

  @override
  @mustCallSuper
  void update() {
    if (!this.isProgressInitialized) {
      this._progress = buildProgress();
    }
    super.update();
  }

  @override
  @mustCallSuper
  void finish() {
    this._progress = null;
    super.finish();
  }

// @override
// bool get initialized => super.initialized;
//
// @override
// P get presenter => super.presenter;
}
