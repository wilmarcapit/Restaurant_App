import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/App/Bloc/Order/order_bloc.dart';
import 'package:restaurant_app/App/Screens/New_Order/Neworder_Details.dart';
import 'package:restaurant_app/App/Widgets/hex_color.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final OrderBloc orderBloc = OrderBloc();

  @override
  void initState() {
    orderBloc.add(OrderDetailsEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderBloc, OrderState>(
        bloc: orderBloc,
        listenWhen: (previous, current) => current is OrderActionState,
        buildWhen: (previous, current) => current is! OrderActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case OrderLoadingState:
              return Center(
                child: const CircularProgressIndicator(),
              );
            case OrderloadedSuccessState:
              final successState = state as OrderloadedSuccessState;
              return Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    final order = successState.posts[index];
                    return Column(
                      children: order.menu.map((menuItem) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.5,
                            horizontal: 0,
                          ),
                          child: NeworderDetails(
                            date: '${order.dateCreated}',
                            order: '${menuItem.name}',
                            notes: '${menuItem.notes}',
                            qty: 'QTY: ${menuItem.quantity}',
                            tableNumber: 'Table Number\n${order.tableNumber}',
                          ),
                        );
                      }).toList(),
                    ); // Handle out-of-bounds index.
                  },
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
