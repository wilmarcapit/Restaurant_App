// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

abstract class OrderActionState extends OrderState {}

class OrderInitial extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderloadedSuccessState extends OrderState {
  final List<OrderModel> posts;
  OrderloadedSuccessState({
    required this.posts,
  });
}

class OrderErrorState extends OrderState {}

class OrderNavigateToDetialsActionState extends OrderActionState {}
