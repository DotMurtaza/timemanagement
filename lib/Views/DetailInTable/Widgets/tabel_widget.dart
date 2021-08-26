import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/Controller/CommonController/common_controller.dart';
import 'package:timemanagment/Models/commonModel.dart';
import 'package:timemanagment/Views/Utils/utils.dart';

import 'scrolable_widget.dart';

class DetailsInTabel extends StatefulWidget {
  final CommonModel model;

  const DetailsInTabel({Key key, this.model}) : super(key: key);

  @override
  _DetailsInTabelState createState() => _DetailsInTabelState();
}

class _DetailsInTabelState extends State<DetailsInTabel> {
  List<CommonModel> commonModel;
  final commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return ScrollableWidget(child: buildDataTable());
  }

  Widget buildDataTable() {
    final columns = [
      'Date',
      'Shift',
      'Pan',
      'Boiler',
      'Base',
      'Operator',
      'Sample',
      'Sop Time Dif',
      'Cir Time Dif'
    ];

    return DataTable(
      columns: getColumns(
        columns,
      ),
      rows: getRows(commonController.com),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(
          column,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  List<DataRow> getRows(List<CommonModel> com) => com.map((CommonModel user) {
      // int i = 0;

        //List<CommonModel> mylist = com;
        DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
            user.date.microsecondsSinceEpoch);
        var formatedDate = DateFormat.yMMMd().format(dt);
        final cells = [

          formatedDate,

          user.shift,
          user.panlNo,
          user.boilNo,
          user.base,
          user.operator,
          user.sampleNo,
          180-user.actTimeSoap,
          90-user.actTimeCir,

        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(
                Text(
                  '$cell ',
                  style: TextStyle(fontSize: 16),
                ), onTap: () {
              Get.snackbar('Tap', 'You tapped on $cell');
            });
          }),
        );
      }).toList();
}
