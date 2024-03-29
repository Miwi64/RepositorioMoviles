import 'dart:math';

import 'package:balance/widgets/balance_page_wt/back_sheet.dart';
import 'package:balance/widgets/balance_page_wt/front_sheet.dart';
import 'package:flutter/material.dart';

import '../widgets/balance_page_wt/custom_fab.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final _scrollController = ScrollController();
  double _desplazamiento = 0;

  void _escucha() {
    setState(() {
      _desplazamiento = _scrollController.offset / 100;
    });
  }

  double get _max => max(90 - _desplazamiento * 90, 0.0);

  @override
  void initState() {
    _scrollController.addListener(_escucha);
    _max;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_escucha);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const estilo = TextStyle(fontSize: 40, color: Colors.lime);
    const estilo2 = TextStyle(fontSize: 20);
    return Scaffold(
      floatingActionButton: const CustomFAB(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0.0,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '\$ 2,500',
                    style: estilo,
                  ),
                  Text(
                    'Balance',
                    style: estilo2,
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Stack(
              children: [
                const BackSheet(),
                Padding(
                  padding: EdgeInsets.only(top: _max),
                  child: const FrontSheet(),
                )
              ],
            )
          ]))
        ],
      ),
    );
  }
}
