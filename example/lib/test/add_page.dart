import 'package:aris_mvp_core/aris_mvp_core.dart';
import 'package:flutter/material.dart';

import '../mvp/base_page_state.dart';
import 'add_page2.dart';

///
/// @author Aris Hu created at 2020-12-17
///
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends BasePageState<AddPage, MultiPagePresenter> {
  AddPagePresenter _addPagePresenter;
  AddPage2Presenter _addPagePresenter2;

  int counter = 0;
  String action = 'add';

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
                  action == 'add' ? Icon(Icons.add) : FlatButton(child: Icon(Icons.update)),
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
                    counter.toString(),
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
                    onPressed: _addPagePresenter.addCounter,
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Add'),
                  ),
                  FlatButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: _addPagePresenter2.subtractCounter,
                    textColor: Colors.white,
                    color: Colors.redAccent,
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
  MultiPagePresenter createPresenter() {
    MultiPagePresenter presenter = MultiPagePresenter();
    _addPagePresenter = AddPagePresenter();
    _addPagePresenter2 = AddPage2Presenter();
    presenter.addPresenters([_addPagePresenter, _addPagePresenter2]);
    return presenter;
  }
}

class AddPagePresenter extends AbstractPagePresenter<BasePageState> {
  void addCounter() {
    view.setState(() {
      (view as _AddPageState).counter++;
    });
  }
}
