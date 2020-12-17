import 'package:aris_mvp_core/aris_mvp_core.dart';
import 'package:flutter/material.dart';

import '../mvp/base_page_state.dart';

///
/// @author Aris Hu created at 2020-12-17
///
class AddPage2 extends StatefulWidget {
  @override
  _AddPage2State createState() => _AddPage2State();
}

class _AddPage2State extends BasePageState<AddPage2, AddPage2Presenter> {
  AddPage2Presenter _addPagePresenter;

  int counter2 = 0;

  String action2 = 'add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  action2 == 'add' ? Icon(Icons.add) : FlatButton(child: Icon(Icons.update)),
                  Text(
                    'Counter Value',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 0.6,
                    height: 8,
                    child: VerticalDivider(),
                  ),
                  Text(
                    counter2.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    width: 0.6,
                    height: 8,
                    child: VerticalDivider(),
                  ),
                  FlatButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: this.presenter.subtractCounter,
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Subtract'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AddPage2Presenter createPresenter() {
    _addPagePresenter = AddPage2Presenter();
    return _addPagePresenter;
  }
}

class AddPage2Presenter extends AbstractPagePresenter<BasePageState> {
  void subtractCounter() {
    (view as _AddPage2State).counter2--;
  }
}
