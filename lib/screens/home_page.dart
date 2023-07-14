// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xwallet/widgets/my_button.dart';
import 'package:xwallet/widgets/my_card.dart';
import 'package:xwallet/widgets/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          Icons.monetization_on_outlined,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: Colors.pinkAccent,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 32,
                    color: Colors.pinkAccent,
                  )),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //appbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "My ",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Cards",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  //plus button
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[600], shape: BoxShape.circle),
                      child: Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            //cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 3456.90,
                    cardNumber: 12345678,
                    expiryMonth: 08,
                    expiryYear: 26,
                    color: Color.fromARGB(255, 164, 8, 192),
                  ),
                  MyCard(
                    balance: 200.00,
                    cardNumber: 12287665,
                    expiryMonth: 03,
                    expiryYear: 23,
                    color: Color.fromARGB(255, 8, 100, 175),
                  ),
                  MyCard(
                    balance: 4500.32,
                    cardNumber: 23786545,
                    expiryMonth: 04,
                    expiryYear: 32,
                    color: Color.fromARGB(255, 98, 184, 101),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Color.fromARGB(255, 80, 189, 144),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            //three buttons(send, pay, bills)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //send button
                  MyButton(
                      iconImagePath: 'lib/icons/send.png', buttonText: 'Send'),
                  //pay button
                  MyButton(
                      iconImagePath: 'lib/icons/credit-card.png',
                      buttonText: 'Pay'),

                  //bills button
                  MyButton(
                      iconImagePath: 'lib/icons/dollar-bill.png',
                      buttonText: 'Bills'),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),

            //column of stats and transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  //statistics
                  MyListTile(
                      iconImagePath: 'lib/icons/analysis.png',
                      tileName: 'Statistics',
                      tileSubname: 'Payments And Expenses'),

                  //transactions
                  MyListTile(
                      iconImagePath: 'lib/icons/transaction.png',
                      tileName: 'Transactions',
                      tileSubname: 'Transaction History')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
