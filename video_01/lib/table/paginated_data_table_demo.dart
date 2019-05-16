import 'package:flutter/material.dart';
import '../model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumIndex;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5, // 每页数量
              source: _postDataSource,
              sortColumnIndex: _sortColumIndex, //  以哪一列排序
              sortAscending: _sortAscending,
              // onSelectAll: (bool value) {},
              columns: [
                DataColumn(
                  label: Text('Title'),
                  onSort: (int columIndex, bool ascending) {
                    _postDataSource._sort((post) => post.title.length, ascending);

                    setState(() {
                      _sortColumIndex = columIndex;
                      _sortAscending = ascending;

                      // posts.sort((a, b) {
                      //   if (!ascending) {
                      //     final c = a;
                      //     a = b;
                      //     b = c;
                      //   }
                      //   return a.title.length.compareTo(b.title.length);
                      // });
                    });
                  },
                  // label: Container(
                  //   width: 150.0,
                  //   child: Text('Title'),
                  // ),
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}