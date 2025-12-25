import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;
import 'dart:typed_data';

import '../../Global/global_var.dart';

class ExportExcelPage extends StatefulWidget {
  const ExportExcelPage({Key? key}) : super(key: key);

  @override
  State<ExportExcelPage> createState() => _ExportExcelPageState();
}

class _ExportExcelPageState extends State<ExportExcelPage> {
  List<CustomerModel> customers = [];
  CustomerModel? selectedCustomer;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool isLoading = false;
  String message = '';

  @override
  void initState() {
    super.initState();
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    try {
      final response = await Dio().get(
        "${url}/MasterCustName",
        options: Options(validateStatus: (_) => true),
      );

      if (response.statusCode == 200) {
        final List data = response.data;

        setState(() {
          customers = data.map((e) => CustomerModel.fromJson(e)).toList();
          if (customers.isNotEmpty) {
            selectedCustomer = customers.first;
          }
        });
      }
    } catch (e) {
      print("Error loading customers: $e");
    }
  }

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  Future<void> handleExport() async {
    setState(() {
      isLoading = true;
      message = '';
    });

    try {
      final response = await Dio().post(
        "${urlE}/Export_Excel", // เปลี่ยน URL ตามที่ตั้งค่า
        data: {
          'customer': selectedCustomer!.custFull,
          'startDate': DateFormat('yyyy-MM-dd').format(startDate),
          'endDate': DateFormat('yyyy-MM-dd').format(endDate),
          'userName': userName,
        },
        options: Options(
          responseType: ResponseType.bytes, // รับเป็น bytes
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        // ดาวน์โหลดไฟล์ Excel
        if (kIsWeb) {
          final blob = html.Blob([response.data]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          // ignore: unused_local_variable
          final anchor = html.AnchorElement(href: url)
            ..setAttribute("download",
                "${selectedCustomer!.custFull} ${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}.xlsx")
            ..click();
          html.Url.revokeObjectUrl(url);
        }

        setState(() {
          message = 'Export สำเร็จ';
        });
      } else if (response.statusCode == 404) {
        setState(() {
          message = 'ไม่พบข้อมูล';
        });
      } else {
        setState(() {
          message = 'เกิดข้อผิดพลาด: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
        print('Error during export: $e');
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.shade50, Colors.indigo.shade100],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.download, size: 32, color: Colors.indigo.shade600),
                        const SizedBox(width: 12),
                        const Text(
                          'Export Data to Excel',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'ชื่อลูกค้า (Customer)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownSearch<CustomerModel>(
                        items: customers,
                        selectedItem: selectedCustomer,

                        // 🔥 ตรงนี้แหละ filterFn
                        filterFn: (CustomerModel item, String filter) {
                          final keyword = filter.toLowerCase();
                          return item.custFull.toLowerCase().contains(keyword) ||
                              item.custShort.toLowerCase().contains(keyword);
                        },

                        itemAsString: (CustomerModel c) => c.custSearch,

                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              hintText: 'ค้นหาลูกค้า (ชื่อเต็ม / ชื่อย่อ)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        onChanged: (value) {
                          setState(() {
                            selectedCustomer = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'วันที่เก็บตัวอย่างเริ่มต้น (Start Date)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => selectDate(context, true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today, color: Colors.indigo.shade600, size: 20),
                            const SizedBox(width: 12),
                            Text(
                              DateFormat('dd/MM/yyyy').format(startDate),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'วันที่เก็บตัวอย่างสิ้นสุด (End Date)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => selectDate(context, false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today, color: Colors.indigo.shade600, size: 20),
                            const SizedBox(width: 12),
                            Text(
                              DateFormat('dd/MM/yyyy').format(endDate),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: isLoading ? null : handleExport,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'กำลัง Export...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.download, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Export to Excel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    if (message.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: message.contains('สำเร็จ') ? Colors.green.shade50 : Colors.red.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: message.contains('สำเร็จ') ? Colors.green.shade300 : Colors.red.shade300,
                            ),
                          ),
                          child: Text(
                            message,
                            style: TextStyle(
                              color: message.contains('สำเร็จ') ? Colors.green.shade900 : Colors.red.shade900,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ข้อมูลที่จะ Export:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Customer: ${selectedCustomer?.custFull ?? '-'}',
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ช่วงวันที่: ${DateFormat('dd/MM/yyyy').format(startDate)} ถึง ${DateFormat('dd/MM/yyyy').format(endDate)}',
                            style: const TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerModel {
  final String custFull;
  final String custShort;
  final String custSearch;

  CustomerModel({
    required this.custFull,
    required this.custShort,
    required this.custSearch,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      custFull: json['CustFull'] ?? '',
      custShort: json['CustShort'] ?? '',
      custSearch: json['CustSearch'] ?? '',
    );
  }
}
