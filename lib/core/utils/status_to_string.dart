import 'package:ibilling/core/enums/payment_status.dart';

statusToString(PaymentStatus status) {
  switch (status) {
    case PaymentStatus.paid:
      return 'Paid';

    case PaymentStatus.inProcess:
      return 'In process';

    case PaymentStatus.rejectedByIQ:
      return 'Rejected by IQ';

    case PaymentStatus.rejectedByPayme:
      return 'Rejected by Payme';
  }
}
