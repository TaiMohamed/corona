import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/data.dart';
import '../utils/sort.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> data;

  @override
  void initState() {
    sort = false;
    data = Data.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracking'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Coronavirus Tracking..',
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 32.0,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.vertical, child: _dataTable()),
          ],
        ),
      ),
    );
  }

  DataTable _dataTable() {
    return DataTable(
      sortColumnIndex: 3,
      sortAscending: sort,
      columnSpacing: 16.0,
      columns: [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Country')),
        DataColumn(label: Text('Confirmed'), numeric: true),
        DataColumn(
            label: Text('Deaths'),
            numeric: true,
            onSort: (value, ascending) {
              setState(() {
                sort = !sort;
              });
              onSortValue(data, value, ascending);
            }),
        DataColumn(label: Text('Recoveries'), numeric: true),
      ],
      rows: data
          .map((i) => DataRow(cells: [
                DataCell(
                  Text('${i.id}'),
                ),
                DataCell(
                  Text('${i.country}'),
                ),
                DataCell(
                  Text('${i.confirmed}'),
                ),
                DataCell(
                  Text('${i.deaths}'),
                ),
                DataCell(
                  Text('${i.recoveries}'),
                ),
              ]))
          .toList(),
    );
  }
}
