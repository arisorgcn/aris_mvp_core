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

import 'abstract_page_presenter.dart';
import 'base_state.dart';

///
/// Multi Presenter
/// @author Aris Hu created at 2020-12-17
///
class MultiPagePresenter<T extends BaseView> extends AbstractPagePresenter<BaseView> {
  List<AbstractPagePresenter> _presenters = [];

  List<AbstractPagePresenter> get presenters => _presenters;

  /// add single presenter
  void addPresenter(covariant AbstractPagePresenter<BaseView> presenter) {
    addPresenters([presenter]);
  }

  /// add multi presenters
  void addPresenters(covariant Iterable<AbstractPagePresenter<BaseView>> pres) {
    _presenters.addAll(pres);
  }

  @override
  void awake() {
    super.awake();
    presenters?.forEach((presenter) => presenter.awake());
  }

  @override
  void start() {
    super.start();
    presenters?.forEach((presenter) => presenter.start());
  }

  @override
  void update() {
    super.update();
    presenters?.forEach((presenter) => presenter.update());
  }

  @override
  void finish() {
    presenters?.forEach((presenter) => presenter.finish());
    super.finish();
  }

  @override
  void attach(covariant BaseView view) {
    presenters?.forEach((presenter) => presenter.attach(view));
  }

  @override
  void detach() {
    presenters?.forEach((presenter) => presenter.detach());
  }
}
