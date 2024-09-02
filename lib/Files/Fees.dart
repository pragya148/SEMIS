import 'package:flutter/material.dart';

// void main() => runApp(FeesApp());

// class FeesApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fees App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Fees(),
//     );
//   }
// }

class Fees extends StatefulWidget {
  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Receipt> receipts = [
    Receipt(
      number: '001',
      amount: 100.0,
      items: [
        ReceiptItem(description: 'Item 1', charges: 30.0),
        ReceiptItem(description: 'Item 2', charges: 20.0),
        ReceiptItem(description: 'Item 3', charges: 50.0),
      ],
    ),
    Receipt(
      number: '002',
      amount: 150.0,
      items: [
        ReceiptItem(description: 'Item A', charges: 70.0),
        ReceiptItem(description: 'Item B', charges: 80.0),
      ],
    ),
    // Add more receipts as needed
  ];

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const List<String> pages = [
      'Home',
      'Profile',
      'Settings',
      'Logout',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fees'),
        backgroundColor: Colors.white,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down, color: blueColor),
              items: pages.map((String page) {
                return DropdownMenuItem<String>(
                  value: page,
                  child: Text(
                    page,
                    style: const TextStyle(color: blueColor),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle navigation to other pages
                print('Selected page: $newValue');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/Young.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Outstanding Fees',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rs 60000',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '*Should be paid before 10th Feb',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/Money.png',
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ElevatedButton(
                          onPressed: () {
                            _onButtonPressed(0);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectedIndex == 0 ? blueColor : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              'Payment Details',
                              style: TextStyle(
                                color: _selectedIndex == 0
                                    ? Colors.white
                                    : blueColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ElevatedButton(
                          onPressed: () {
                            _onButtonPressed(1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _selectedIndex == 1 ? blueColor : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              'Payment History',
                              style: TextStyle(
                                color: _selectedIndex == 1
                                    ? Colors.white
                                    : blueColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: _selectedIndex == 0
                        ? _buildPaymentDetails()
                        : _buildPaymentHistory(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return ListView.builder(
      itemCount: receipts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ReceiptTile(receipt: receipts[index]),
        );
      },
    );
  }

  Widget _buildPaymentHistory() {
    // Implement your payment history UI here
    return Center(
      child: Text('Payment History Placeholder'),
    );
  }
}

class ReceiptTile extends StatelessWidget {
  final Receipt receipt;

  ReceiptTile({required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Receipt #${receipt.number}'),
            Text('\$${receipt.amount.toStringAsFixed(2)}'),
          ],
        ),
        children: receipt.items.map((item) {
          return ListTile(
            title: Text(item.description),
            trailing: Text('\$${item.charges.toStringAsFixed(2)}'),
          );
        }).toList(),
      ),
    );
  }
}

class Receipt {
  final String number;
  final double amount;
  final List<ReceiptItem> items;

  Receipt({required this.number, required this.amount, required this.items});
}

class ReceiptItem {
  final String description;
  final double charges;

  ReceiptItem({required this.description, required this.charges});
}
