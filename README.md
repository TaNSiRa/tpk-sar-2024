# TPK-SAR

class DROPDOWNlist1 extends StatefulWidget {
  DROPDOWNlist1({
    Key? key,
    this.listdropdownin,
    this.dropdownStagein,
    this.returndata,
  }) : super(key: key);
  List<MapEntry<String, String>>? listdropdownin;
  String? dropdownStagein;
  Function(String)? returndata;

  @override
  State<DROPDOWNlist1> createState() => _DROPDOWNlist1State();
}

class _DROPDOWNlist1State extends State<DROPDOWNlist1> {
  @override
  Widget build(BuildContext context) {
    return widget.listdropdownin!.length > 1
        ? AdvanceDropDown(
            listdropdown: widget.listdropdownin,
            borderCO: Colors.transparent,
            onChangeinside: (d, k) {
              widget.dropdownStagein = d;

              final Map<String, List<MapEntry<String, String>>> stageMapping = {
                'GL sign': [
                  MapEntry('Cut sample', 'Cut sample'),
                  MapEntry(
                      'Re-check chemical values', 'Re-check chemical values'),
                ],
                'TTC analysis': [
                  MapEntry('Re-analyze', 'Re-analyze'),
                  MapEntry('Review results', 'Review results'),
                ],
              };
              _dropdownStage2Values = stageMapping[d] ?? [MapEntry('', '')];
              print(_dropdownStage2Values);
              // for (var i = 0; i < stageMapping.length; i++) {
              //   if (stageMapping == d) {
              //     dropdownStage2Values == stageMapping;
              //     print(dropdownStage2Values);
              //   }
              // }
              widget.returndata!(d);
            },
            // value: dataBuff.stage,
            value: widget.dropdownStagein ?? '',
            height: 29.5,
            width: 200,
          )
        : Container(
            child: Text("  " + widget.listdropdownin!.first.value,
                style: styleDataRow, textAlign: TextAlign.start),
          );
  }
}