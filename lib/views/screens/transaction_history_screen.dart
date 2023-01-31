import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/widgets/custom_field.dart';
import 'package:vidmo/views/widgets/transaction_item.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.accentColor,
        title: const Text(
          'Transaction History',
          style: TextStyle(
            color: GlobalVariables.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            CustomField(
              controller: _searchController,
              labelText: 'Search for a transaction',
              prefixIcon: Icons.search,
              borderRadius: 25,
            ),
            const SizedBox(height: 20),
            const TransactionItem(),
            const TransactionItem(),
            const TransactionItem(),
            const TransactionItem(),
            const TransactionItem(),
            const TransactionItem(),
            const TransactionItem(),
            const TransactionItem(),
            const TransactionItem(),
          ],
        ),
      ),
    );
  }
}
