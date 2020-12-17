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

import './base_state.dart';
import '../interfaces/i_presenter.dart';

///
/// Base Presenter
/// @author Aris Hu created at 2020-12-17
///
class BasePresenter<V extends BaseView> implements IPresenter {
  V _view;

  /// The associated view interface
  V get view => _view;

  /// Returns whether this [Presenter] been coupled
  /// with a view.
  bool get isAttached => view != null;

  @override
  void attach(BaseView view) {
    assert(!isAttached, "the view ${V.toString()} has attached to this presenter");
    this._view = view;
  }

  @override
  void detach() {
    assert(isAttached, "no view ${V.toString()} attached to this presenter");
    this._view = null;
  }

  /// A [LifeCycle] initialization method (called only
  /// once, right before [start]). This presenter will
  /// already be coupled to the view when this is called.
  ///
  /// Within the flutter framework, this method is
  /// invoked when the associated view's [initState]
  /// method is called.
  @override
  @mustCallSuper
  void awake() {}

  /// A [LifeCycle] initialization method (called only
  /// once, right after [awake]).
  ///
  /// Within the flutter framework, this method is
  /// invoked after the associated view's [initState]
  /// call, but before the associated view's first call
  /// to [build].
  @override
  @mustCallSuper
  void start() {}

  /// A [LifeCycle] update method (called multiple times
  /// after the view has been initialized).
  ///
  /// Within the flutter framework, this method is
  /// invoked before the associated view's [build]
  /// method is called. That being said, changes
  /// to the view's state should not be called from
  /// this method.
  @override
  @mustCallSuper
  void update() {}

  /// A [LifeCycle] finalization method (called only
  /// once after [start] to 'finish' this presenter's job).
  /// This presenter will still be coupled to the view when
  /// this is called.
  ///
  /// Within the flutter framework, this method is
  /// invoked when the associated view's [dispose]
  /// method is called.
  @override
  @mustCallSuper
  void finish() {}
}
