import 'package:logger/logger.dart';

class LoggerUtils {
  static final Logger _logEvent = Logger(
    filter: DevelopmentFilter(), //(-> only log in debug mode)
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: false, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ), // Use the Printer to format and print log
    output: ConsoleOutput(), // (-> send everything to console)
  );

  static void d(String messages) {
    _logEvent.d(messages);
  }

  static void i(String messages) {
    _logEvent.i(messages);
  }

  static void v(String messages) {
    _logEvent.v(messages);
  }

  static void w(String messages) {
    _logEvent.w(messages);
  }

  static void e(String messages) {
    _logEvent.e(messages);
  }
}
