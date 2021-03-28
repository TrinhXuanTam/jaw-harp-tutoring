import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/payment_facade.dart';

@LazySingleton(as: IPaymentFacade, env: [Environment.prod])
class PaymentFacade extends IPaymentFacade {}
