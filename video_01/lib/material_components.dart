import 'package:flutter/material.dart';
import './buttonDemo/button_demo.dart';
import './buttonDemo/floating_action_button.dart';
import './buttonDemo/popup_menu_button.dart';
import './buttonDemo/simple_dialog_demo.dart';
import './buttonDemo/alert_dialog_demo.dart';
import './buttonDemo/buttom_sheet_demo.dart';
import './buttonDemo/snack_bar_demo.dart';
import './buttonDemo/expansion_panel_demo.dart';
import './buttonDemo/chip_demo.dart';
import './table/data_table_demo.dart';
import './table/paginated_data_table_demo.dart';
import './table/card_demo.dart';
import './table/stepper_demo.dart';
import './state/state_management_demo.dart';

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
          ListItem(title: 'StateManagemnetDemo', page: StateManagementDemo()),
          ListItem(title: 'StepperDemo', page: StepperDemo()),
          ListItem(title: 'CardDemo', page: CardDemo()),
          ListItem(title: 'PaginatedDataTableDemo', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
          ListItem(title: 'ChipDemo', page: ChipDemo()),
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