part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class OrderInitialEvent extends OrderEvent {}

class OrderListEvent extends OrderEvent {}

class OrderDetailsEvents extends OrderEvent {}

class TableWithSit extends OrderEvent {}

class TableAvailable extends OrderEvent {}
