import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpk_login_arsa_01/Global/global_structure.dart';
import 'package:tpk_login_arsa_01/Layout/ChangePage/Data/BlocChagpage.dart';
import 'package:tpk_login_arsa_01/page/2Mainapage/Data/MainPage_bloc.dart';

import '../../../Global/dataTime.dart';
import '../../../Global/global_var.dart';
import '../../../Layout/ChangePage/Data/BlocPageRebuild.dart';
import '../../../widget/common/Advancedropdown.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// The file was extracted from GitHub: https://github.com/flutter/gallery
// Changes and modifications by Maxim Saplin, 2021

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//----------------------------------------------------------

//----------------------------------------------------------

class TableOverDueKPI extends StatefulWidget {
  const TableOverDueKPI();

  @override
  _TableOverDueKPIState createState() => _TableOverDueKPIState();
}

class _TableOverDueKPIState extends State<TableOverDueKPI>
    with RestorationMixin {
  //edit
  final RestorableDataSelections _dataSelections =
      RestorableDataSelections(); //
  final RestorableInt _rowIndex = RestorableInt(0);
  final RestorableInt _rowsPerPage = RestorableInt(5);
  /* RestorableInt(PaginatedDataTable.defaultRowsPerPage); */
  final RestorableBool _sortAscending = RestorableBool(true);
  final RestorableIntN _sortColumnIndex = RestorableIntN(null);
  late TableOverDueKPIDataSource _dataSource; //
  bool initialized = false;

  @override
  String get restorationId => 'paginated_data_table';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_dataSelections, 'selected_row_indices');
    registerForRestoration(_rowIndex, 'current_row_index');
    registerForRestoration(_rowsPerPage, 'rows_per_page');
    registerForRestoration(_sortAscending, 'sort_ascending');
    registerForRestoration(_sortColumnIndex, 'sort_column_index');

    if (!initialized) {
      _dataSource = TableOverDueKPIDataSource(context);
      initialized = true;
    }
    switch (_sortColumnIndex.value) {
      // case 0:
      //   _dataSource.sort<String>((d) => d.reqNo, _sortAscending.value);
      //   break;
      // case 1:
      //   _dataSource.sort<String>((d) => d.custFull, _sortAscending.value);
      //   break;
      // case 2:
      //   _dataSource.sort<DateTime>(
      //     (d) => DateTime.parse(d.samplingDate),
      //     false,
      //   );
      //   break;
      // case 3:
      //   _dataSource.sort<String>((d) => d.repdays, _sortAscending.value);
      //   break;
      // case 4:
      //   _dataSource.sort<String>((d) => d.repdays, _sortAscending.value);
      //   break;
      // case 5:
      //   _dataSource.sort<String>((d) => d.reason, _sortAscending.value);
      //   break;
    }
    _dataSource.updateSelectedData(_dataSelections);
    _dataSource.addListener(_updateSelectedDataRowListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      _dataSource = TableOverDueKPIDataSource(context);
      initialized = true;
    }
    _dataSource.addListener(_updateSelectedDataRowListener);
  }

  void _updateSelectedDataRowListener() {
    _dataSelections.setDataSelections(_dataSource.dataSource);
  }

  void sort<T>(
    Comparable<T> Function(ModelFullRequestData d) getField,
    int columnIndex,
    bool ascending,
  ) {
    _dataSource.sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex.value = columnIndex;
      _sortAscending.value = ascending;
    });
  }

  @override
  void dispose() {
    _rowsPerPage.dispose();
    _sortColumnIndex.dispose();
    _sortAscending.dispose();
    _dataSource.removeListener(_updateSelectedDataRowListener);
    _dataSource.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      restorationId: 'paginated_data_table_list_view',
      //padding: const EdgeInsets.all(16),
      children: [
        PaginatedDataTable(
          header: Center(
            child: Text(
              'USER REPORT OVER DUE',
              style: TextStyle(
                  fontFamily: 'Mitr',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          //actions: [InkWell(child: Text("AAA"),onTap:()=> print("aaaaa"),)],
          headingRowHeight: 30,
          showCheckboxColumn: false,
          availableRowsPerPage: <int>[5, 10, 20, 50],
          columnSpacing: 12,
          horizontalMargin: 20,
          dataRowHeight: 30,
          rowsPerPage: _rowsPerPage.value,
          onRowsPerPageChanged: (value) {
            setState(() {
              _rowsPerPage.value = value!;
            });
          },
          initialFirstRowIndex: _rowIndex.value,
          onPageChanged: (rowIndex) {
            setState(() {
              _rowIndex.value = rowIndex;
            });
          },
          sortColumnIndex: _sortColumnIndex.value,
          sortAscending: _sortAscending.value,
          onSelectAll: _dataSource.selectAll,
          source: _dataSource,
          columns: [
            DataColumn(
              label: Text('REQUEST NO',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric: false,
              // onSort: (columnIndex, ascending) =>
              //     sort<String>((d) => d.reqNo, columnIndex, ascending),
            ),
            DataColumn(
              label: Text('CUSTOMER NAME',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric: false,
              tooltip: 'CUSTOMER NAME',
              // onSort: (columnIndex, ascending) =>
              //     sort<String>((d) => d.custFull, columnIndex, ascending),
            ),
            DataColumn(
              label: Text('SAMPLING DATE',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric: false,
              tooltip: 'SAMPLING DATE',
              // onSort: (columnIndex, ascending) =>
              //     sort<String>((d) => d.samplingDate, columnIndex, ascending),
            ),
            DataColumn(
              label: Text('OVER DUE (DAYS)',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric:
                  false, // Deliberately set to false to avoid right alignment.
              // onSort: (columnIndex, ascending) =>
              //     sort<String>((d) => d.repdays, columnIndex, ascending),
            ),
            DataColumn(
              label: Text('  STAGE',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric:
                  false, // Deliberately set to false to avoid right alignment.
              // onSort: (columnIndex, ascending) =>
              //     sort<String>((d) => d.repdays, columnIndex, ascending),
            ),
            DataColumn(
              label: Text('REASON',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric:
                  false, // Deliberately set to false to avoid right alignment.
              tooltip: 'REASON',
              // onSort: (columnIndex, ascending) =>
              //     sort<String>((d) => d.reason, columnIndex, ascending),
            ),
            DataColumn(
              label: Text('SAVE REASON',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric:
                  false, // Deliberately set to false to avoid right alignment.
            ),
            DataColumn(
              label: Text('EDIT DATA',
                  style: styleDataColumn, textAlign: TextAlign.center),
              numeric:
                  false, // Deliberately set to false to avoid right alignment.
            ),
          ],
        ),
      ],
    );
  }
}

TextStyle styleDataRow = TextStyle(fontSize: 12, fontFamily: 'Mitr');
TextStyle styleDataColumn =
    TextStyle(fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Mitr');

class TableOverDueKPIDataSource extends DataTableSource {
  final BuildContext context;
  late List<ModelFullRequestData> dataSource;

  TableOverDueKPIDataSource.empty(this.context) {
    dataSource = [];
  }

  TableOverDueKPIDataSource(this.context) {
    dataSource = OverDueKPIData;
  }

  void sort<T>(
      Comparable<T> Function(ModelFullRequestData d) getField, bool ascending) {
    dataSource.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;
  void updateSelectedData(RestorableDataSelections selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < dataSource.length; i += 1) {
      var dataBuff = dataSource[i];
      if (selectedRows.isSelected(i)) {
        dataBuff.selected = true;
        _selectedCount += 1;
      } else {
        dataBuff.selected = false;
      }
    }
    notifyListeners();
  }

  void updateSelectedDataFromSet(Set<int> selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < dataSource.length; i += 1) {
      var dataBuff = dataSource[i];
      if (selectedRows.contains(i)) {
        dataBuff.selected = true;
        _selectedCount += 1;
      } else {
        dataBuff.selected = false;
      }
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final format = NumberFormat.decimalPercentPattern(
      locale: 'en',
      decimalDigits: 0,
    );
    assert(index >= 0);
    if (index >= dataSource.length) throw 'index > _desserts.length';
    final dataBuff = dataSource[index];
    String picSample1 = "";
    String picSample2 = "";
    String picSample3 = "";
    String picSample4 = "";
    String picSample5 = "";
    String dropdownStage = dataBuff.stage;
    String dropdownReason = dataBuff.reason;

    final List<double> values = [
      double.tryParse(dataBuff.bdprepare ?? '0') ?? 0,
      double.tryParse(dataBuff.bdttc ?? '0') ?? 0,
      double.tryParse(dataBuff.bdissue ?? '0') ?? 0,
      double.tryParse(dataBuff.bdsent ?? '0') ?? 0,
    ];

    final List<double> ReviseValues = [
      dataBuff.bdrevise1,
      dataBuff.bdrevise2,
      dataBuff.bdrevise3,
    ]
        .where((value) => value != null && value.isNotEmpty)
        .map((value) => double.tryParse(value) ?? 0)
        .toList();

    final double averageRevise = ReviseValues.isNotEmpty
        ? (ReviseValues.reduce((a, b) => a + b) / ReviseValues.length)
        : 0;

    values.add(averageRevise);

    final List<double> SubleadValues = [
      dataBuff.bdsublead,
      dataBuff.bdsublead1,
      dataBuff.bdsublead2,
      dataBuff.bdsublead3,
    ]
        .where((value) => value != null && value.isNotEmpty)
        .map((value) => double.tryParse(value) ?? 0)
        .toList();

    final double averageSublead = SubleadValues.isNotEmpty
        ? (SubleadValues.reduce((a, b) => a + b) / SubleadValues.length)
        : 0;

    values.add(averageSublead);

    final List<double> GLValues = [
      dataBuff.bdgl,
      dataBuff.bdgl1,
      dataBuff.bdgl2,
      dataBuff.bdgl3,
    ]
        .where((value) => value != null && value.isNotEmpty)
        .map((value) => double.tryParse(value) ?? 0)
        .toList();

    final double averageGL = GLValues.isNotEmpty
        ? (GLValues.reduce((a, b) => a + b) / GLValues.length)
        : 0;

    values.add(averageGL);

    final List<double> MGRValues = [
      dataBuff.bdmgr,
      dataBuff.bdmgr1,
      dataBuff.bdmgr2,
      dataBuff.bdmgr3,
    ]
        .where((value) => value != null && value.isNotEmpty)
        .map((value) => double.tryParse(value) ?? 0)
        .toList();

    final double averageMGR = MGRValues.isNotEmpty
        ? (MGRValues.reduce((a, b) => a + b) / MGRValues.length)
        : 0;

    values.add(averageMGR);

    final List<double> JPValues = [
      dataBuff.bdjp,
      dataBuff.bdjp1,
      dataBuff.bdjp2,
      dataBuff.bdjp3,
    ]
        .where((value) => value != null && value.isNotEmpty)
        .map((value) => double.tryParse(value) ?? 0)
        .toList();

    final double averageJP = JPValues.isNotEmpty
        ? (JPValues.reduce((a, b) => a + b) / JPValues.length)
        : 0;

    values.add(averageJP);

    // final int maxValue = values.reduce((a, b) => a > b ? a : b);
    final Map<String, double> valueMap = {
      'Prepare+Request TTC': double.tryParse(dataBuff.bdprepare ?? '0') ?? 0,
      'TTC analysis': double.tryParse(dataBuff.bdttc ?? '0') ?? 0,
      'Issue report': double.tryParse(dataBuff.bdissue ?? '0') ?? 0,
      'Revise report': averageRevise,
      'SL approve': averageSublead,
      'GL approve': averageGL,
      'MGR approve': averageMGR,
      'JP approve': averageJP,
      'Send to customer': double.tryParse(dataBuff.bdsent ?? '0') ?? 0,
    };

    // หาค่า maxValue
    final double maxValue = valueMap.values.reduce((a, b) => a > b ? a : b);

    // หารายการทั้งหมดที่มีค่าเท่ากับ maxValue
    final List<MapEntry<String, double>> maxEntries =
        valueMap.entries.where((entry) => entry.value == maxValue).toList();

    // แปลง maxEntries เป็น listdropdown
    List<MapEntry<String, String>> listdropdownstage =
        maxEntries.map((entry) => MapEntry(entry.key, entry.key)).toList();

    List<MapEntry<String, String>>? listdropdownreason = [];
    // print(valueMap);

    // ตรวจสอบว่ามีตัวเลือกใน dropdown หรือไม่
    if (listdropdownstage.isEmpty) {
      listdropdownstage = [
        MapEntry('-', '-'),
      ];
    }

    if (listdropdownreason.isEmpty) {
      listdropdownreason = [
        MapEntry('-', '-'),
      ];
    }

    final Map<String, List<MapEntry<String, String>>> stageMapping = {
      'Prepare+Request TTC': [
        MapEntry('Cut sample', 'Cut sample'),
        MapEntry('Re-check chemical values', 'Re-check chemical values'),
        MapEntry('Not in the office', 'Not in the office'),
        MapEntry('Forget sample at customer', 'Forget sample at customer'),
        MapEntry('Other', 'Other'),
      ],
      'TTC analysis': [
        MapEntry('Re-check chemicals', 'Re-check chemicals'),
        MapEntry(
            'Re-check SEM or coating weight', 'Re-check SEM or coating weight'),
        MapEntry('Instrument breakdown', 'Instrument breakdown'),
        MapEntry('Other', 'Other'),
      ],
      'Issue report': [
        MapEntry('Request TTC to re-check chemicals',
            'Request TTC to re-check chemicals'),
        MapEntry('Request TTC to re-check SEM or coating weight',
            'Request TTC to re-check SEM or coating weight'),
        MapEntry('Follow up project', 'Follow up project'),
        MapEntry('SAR error', 'SAR error'),
        MapEntry('Revise data in SAR system', 'Revise data in SAR system'),
        MapEntry('Sick / Vacation', 'Sick / Vacation'),
        MapEntry('Forget', 'Forget'),
        MapEntry('Other', 'Other'),
      ],
      'Revise report': [
        MapEntry('Forget', 'Forget'),
        MapEntry('Sick / Vacation', 'Sick / Vacation'),
        MapEntry('Other', 'Other'),
      ],
      'SL approve': [
        MapEntry('Follow up project', 'Follow up project'),
        MapEntry('Sick / Vacation', 'Sick / Vacation'),
        MapEntry('Other', 'Other'),
      ],
      'GL approve': [
        MapEntry('Follow up project', 'Follow up project'),
        MapEntry('Sick / Vacation', 'Sick / Vacation'),
        MapEntry('Other', 'Other'),
      ],
      'MGR approve': [
        MapEntry('Follow up project', 'Follow up project'),
        MapEntry('Sick / Vacation', 'Sick / Vacation'),
        MapEntry('Other', 'Other'),
      ],
      'JP approve': [
        MapEntry('Follow up project', 'Follow up project'),
        MapEntry('Sick / Vacation', 'Sick / Vacation'),
        MapEntry('Other', 'Other'),
      ],
      'Send to customer': [
        MapEntry('Forget', 'Forget'),
        MapEntry('Other', 'Other'),
      ],
    };

    // print(listdropdownreason);
    // print(listdropdownreason!.length);

    if (dataBuff.stage.isNotEmpty) {
      dataBuff.listdropdownstage = [MapEntry(dataBuff.stage, dataBuff.stage)];
    } else if (dataBuff.stage.isEmpty) {
      List<MapEntry<String, String>> listdropdownstage =
          maxEntries.map((entry) => MapEntry(entry.key, entry.key)).toList();
      dataBuff.listdropdownstage = listdropdownstage;
      dropdownStage = listdropdownstage.first.key;
    }
    // if (dataBuff.reason.isNotEmpty) {
    //   dataBuff.listdropdownreason = [
    //     MapEntry(dataBuff.reason, dataBuff.reason)
    //   ];
    // } else if (dataBuff.reason.isEmpty) {
    //   listdropdownreason =
    //       stageMapping[listdropdownstage.first.key] ?? [MapEntry('-', '-')];
    //   dataBuff.listdropdownreason = listdropdownreason;

    //   // if (!listdropdownreason.any((entry) => entry.key == dataBuff.reason)) {
    //   //   dataBuff.reason = listdropdownreason.first.key;
    //   // }
    // }
    if (dataBuff.reason.isNotEmpty) {
      dataBuff.listdropdownreason = [
        MapEntry(dataBuff.reason, dataBuff.reason)
      ];
    } else if (dataBuff.reason.isEmpty) {
      // หาค่า key ที่ตรงกับ dropdownStage ใน listdropdownstage
      final selectedStageKey = dataBuff.listdropdownstage
          .firstWhere((entry) => entry.value == dropdownStage,
              orElse: () => MapEntry('-', '-'))
          .key;

      // ใช้ stageMapping เพื่อนำค่ามาใส่ listdropdownreason
      listdropdownreason =
          stageMapping[selectedStageKey] ?? [MapEntry('-', '-')];
      dataBuff.listdropdownreason = listdropdownreason;
    }

    print('dropdownStage: $dropdownStage');
    return DataRow.byIndex(
      index: index,
      selected: dataBuff.selected,
      onSelectChanged: (value) async {
        final SharedPreferences prefs = await _prefs;
        prefs.setString(
            'RoutineRequestDetailRequesterPage_reqNo', dataBuff.reqNo);
        BlocProvider.of<SwPageCubit>(context).togglePage("RefreshPage");
        BlocProvider.of<SwPageCubit>(context)
            .togglePage("RoutineRequestDetailRequesterPage");
      },
      // onSelectChanged: null,
      cells: [
        DataCell(Container(
            child: Text(dataBuff.reqNo,
                style: styleDataRow, textAlign: TextAlign.start))),
        DataCell(Container(
            child: Text(dataBuff.custFull,
                style: styleDataRow, textAlign: TextAlign.start))),
        DataCell(Container(
            child: Text("      " + dataBuff.samplingDate,
                style: styleDataRow, textAlign: TextAlign.center))),
        DataCell(Container(
            child: Text("              " + dataBuff.repdays,
                style: styleDataRow, textAlign: TextAlign.start))),
        DataCell(
          dataBuff.listdropdownstage.length > 1
              ? AdvanceDropDown(
                  listdropdown: dataBuff.listdropdownstage,
                  borderCO: Colors.transparent,
                  onChangeinside: (d, k) {
                    dropdownStage = d;
                    dataBuff.stage = d;
                    // print(d);

                    // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                    notifyListeners();
                  },
                  value: dropdownStage,
                  height: 29.5,
                  width: 200,
                )
              : Container(
                  child: Text("  " + dropdownStage,
                      style: styleDataRow, textAlign: TextAlign.start),
                ),
        ),
        DataCell(
          dataBuff.listdropdownreason.length > 1
              ? AdvanceDropDown(
                  listdropdown: dataBuff.listdropdownreason,
                  borderCO: Colors.transparent,
                  onChangeinside: (d, k) {
                    dropdownReason = d;
                    dataBuff.reason = d;

                    // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                    // notifyListeners();
                  },
                  value: dropdownReason,
                  height: 29.5,
                  width: 200,
                )
              : Container(
                  child: Text("  " + dropdownReason,
                      style: styleDataRow, textAlign: TextAlign.start),
                ),
        ),
        DataCell(ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          onPressed: () {
            saveKPIreason(index, dropdownStage, dropdownReason);
          },
          child: Text('Save'),
        )),
        DataCell(IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              deleteKPIReason(index);
            }))
      ],
    );
  }

  @override
  int get rowCount => dataSource.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final dataBuff in dataSource) {
      dataBuff.selected = checked ?? false;
    }
    _selectedCount = (checked ?? false) ? dataSource.length : 0;
    notifyListeners();
  }

  void saveKPIreason(int index, String dropdownStage, String dropdownReason) {
    final dataBuff = dataSource[index];

    CoolAlert.show(
      barrierDismissible: false,
      width: 200,
      showCancelBtn: true,
      context: context,
      type: CoolAlertType.custom,
      text: 'SAVE KPI REASON',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      loopAnimation: false,
      onConfirmBtnTap: () {
        print(dataBuff.reqNo);
        SaveKPIReason.clear();
        SaveKPIReason.add(dataBuff);
        // SaveKPIReason[0].reason = dataBuff.reason;
        SaveKPIReason[0].reason = dropdownReason;
        SaveKPIReason[0].stage = dropdownStage;
        print('Saved Reason: ${SaveKPIReason[0].reason}');
        print('Saved stage: ${SaveKPIReason[0].stage}');
        saveKPIReason();
        // BlocProvider.of<SwPageCubit>(context).togglePage("RefreshPage");
        // Future.delayed(Duration(milliseconds: 10));
        // BlocProvider.of<SwPageCubit>(context).togglePage("MainPage");
        // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
        notifyListeners();
      },
      onCancelBtnTap: () {},
    );
  }

  void deleteKPIReason(int index) {
    final dataBuff = dataSource[index];

    CoolAlert.show(
      barrierDismissible: false,
      width: 200,
      showCancelBtn: true,
      context: context,
      type: CoolAlertType.custom,
      text: 'DELETE STAGE & REASON',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      loopAnimation: false,
      onConfirmBtnTap: () {
        print(dataBuff.reqNo);
        DeleteKPIreason.clear();
        DeleteKPIreason.add(dataBuff);
        deleteKPIreason();
        // BlocProvider.of<SwPageCubit>(context).togglePage("RefreshPage");
        // Future.delayed(Duration(milliseconds: 10));
        // BlocProvider.of<SwPageCubit>(context).togglePage("MainPage");
        // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
        dataBuff.reason = "";
        notifyListeners();
      },
      onCancelBtnTap: () {},
    );
  }
}

class RestorableDataSelections extends RestorableProperty<Set<int>> {
  Set<int> _dataSelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _dataSelections.contains(index);

  /// Takes a list of [Dessert]s and saves the row indices of selected rows
  /// into a [Set].
  void setDataSelections(List<ModelFullRequestData> dataIn) {
    final updatedSet = <int>{};
    for (var i = 0; i < dataIn.length; i += 1) {
      var data = dataIn[i];
      if (data.selected) {
        updatedSet.add(i);
      }
    }
    _dataSelections = updatedSet;
    notifyListeners();
  }

  @override
  Set<int> createDefaultValue() => _dataSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _dataSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _dataSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _dataSelections = value;
  }

  @override
  Object toPrimitives() => _dataSelections.toList();
}
