import 'package:flutter/material.dart';
import './button_demo.dart';
import './floating_action_button.dart';
import './popup_menu_button.dart';
import './simple_dialog_demo.dart';
import './alert_dialog_demo.dart';
import './buttom_sheet_demo.dart';
import './snack_bar_demo.dart';
import './expansion_panel_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'ExpandionPanelDemo', page: ExpandionPanelDemo()),
          ListItem(title: 'SnackBarDemo', page: SnackBarDemo()),
          ListItem(title: 'ButtomSheetDemo', page: BottomSheetDemo()),
          ListItem(title: 'AlertDialogDemo', page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialogDemo', page: SimpleDialogDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}