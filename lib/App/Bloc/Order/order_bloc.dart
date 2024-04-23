import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/App/Device/Repository/Order_repo.dart';
import 'package:restaurant_app/App/Models/Order_data_model.dart';
import 'package:http/http.dart' as http;

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderDetailsEvents>(orderDetailsEvents);
  }

  FutureOr<void> orderDetailsEvents(
      OrderDetailsEvents event, Emitter<OrderState> emit) async {
    emit(OrderLoadingState());
    List<OrderModel> posts = await OrderRepo.fetchOrder();
    emit(OrderloadedSuccessState(posts: posts));
  }
}
