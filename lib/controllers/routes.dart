import 'package:anga/views/pages/Concessions/concessions.dart';
import 'package:anga/views/pages/Authentication/auth.dart';
import 'package:anga/views/pages/ComingSoons/coming_soon.dart';
import 'package:anga/views/pages/Contacts/contacts.dart';
import 'package:anga/views/pages/Events/events_sports.dart';
import 'package:anga/views/pages/History/history.dart';
import 'package:anga/views/pages/Payment/Tickets/ticket.dart';
import 'package:anga/views/pages/Schedule/schedule.dart';
import 'package:anga/views/pages/Show/show.dart';
import 'package:anga/views/pages/Home/home.dart';
import 'package:anga/views/pages/Payment/choose_payment_method.dart';
import 'package:anga/views/pages/Payment/mobile_money_form.dart';
import 'package:anga/views/pages/Payment/successful_payment.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => Home(),
    ),
    GetPage(
      name: '/home',
      page: () => Home(),
    ),
    GetPage(
      name: '/coming-soon',
      page: () => ComingSoonComplete(),
    ),
    GetPage(
      name: '/events-and-sports',
      page: () => EventsComplete(),
    ),
    GetPage(
      name: '/contacts',
      page: () => Contacts(),
    ),
    GetPage(
      name: '/schedule',
      page: () => Schedule(),
    ),
    GetPage(
      name: '/history',
      page: () => History(),
    ),
    GetPage(
      name: '/concessions',
      page: () => Concessions(),
    ),
    GetPage(
      name: '/auth',
      page: () => Authentication(),
    ),
    GetPage(name: '/show', page: () => Film()),
    GetPage(name: '/payment-method', page: () => const ChoosePaymentMethod()),
    GetPage(name: '/mobile-money', page: () => const MobileMoneyForm()),
    GetPage(name: '/success', page: () => const SuccessfulPayment()),
    GetPage(name: '/ticket', page: () => const TicketView()),
  ];
}
