import 'package:flutter/material.dart';
import 'package:home_app/services/services.dart';

class DropdownButtonExample extends StatefulWidget {
  final Function(Map<String, dynamic>?) onItemSelected;
  const DropdownButtonExample({super.key,  required this.onItemSelected});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late Future<List<dynamic>> data;
  String dropdownValue = '';
  List<dynamic> _companies = [];
  Map<String, dynamic>? _selectedCompany;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> companies = await Services.fetchCompanies();
    setState(() {
      _companies = companies;
      _selectedCompany = _companies[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(7),
      ),
      child: DropdownButton(
        value: _selectedCompany,
        isExpanded: true,
        borderRadius: BorderRadius.circular(6),
        menuMaxHeight: 150,
        items: _companies.map((company) {
          return DropdownMenuItem(
            value: company,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(company['name']),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedCompany = value as Map<String, dynamic>?;
            widget.onItemSelected(_selectedCompany);
          });
        },
      ),
    );
  }
}
