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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../interfaces/i_view.dart';
import 'base_presenter.dart';

///
/// Base View
/// @author Aris Hu created at 2020-12-17
///
abstract class BaseView<BasePresenter> extends IView {}

// A view base class which is specific to the flutter
/// framework. All MVP patterned views should extend this.
abstract class BaseState<T extends StatefulWidget, P extends BasePresenter> extends State<T> implements BaseView<P> {
  bool _initialized;
  P _presenter;

  /// Returns whether this [BaseState] has initialized
  /// itself or not. A [BaseState] becomes initialized
  /// after [initState] and before the first [build]
  /// call.
  bool get initialized => _initialized ?? false;

  P get presenter => _presenter;

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void showProgress() {}

  @override
  void closeProgress() {}

  @override
  void showToast(String string) {}

  @override
  void initState() {
    super.initState();
    // create presenter class
    this._presenter = createPresenter();
    this.awake();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!initialized) {
      this.start();
      this._initialized = true;
    }
    this.update();
  }

  @override
  void dispose() {
    this.finish();
    super.dispose();
  }

  @override
  void setState(Function fn) {
    super.setState(fn);
  }

  @override
  @mustCallSuper
  void awake() {
    this.presenter?.attach(this);
    this.presenter?.awake();
  }

  @override
  @mustCallSuper
  void start() {
    this.presenter?.start();
  }

  @override
  @mustCallSuper
  void update() {
    this.presenter?.update();
  }

  @override
  @mustCallSuper
  void finish() {
    this.presenter?.detach();
    this.presenter?.finish();
  }

  /// Instantiates the associated presenter (which
  /// is soon after bind to this view).
  P createPresenter();
}
