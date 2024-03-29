import 'package:flutter_streams/BlocBase.dart';
import 'dart:async';

import 'package:flutter_streams/Message.dart';

class UserBloc extends BlocBase{
  UserBloc(){
    counter = 0;
    counterController.stream.listen((data){
      counter = counter + 1;
      counterObserverController.sink.add(counter);
    });
  }
  int counter;

  StreamController<Message> outStatusOneController = StreamController<Message>.broadcast();
  Stream<Message> get outStatusOne => outStatusOneController.stream;
  StreamSink<Message> get sinkStatusOne => outStatusOneController.sink;

  StreamController<Message> outStatusTwoController = StreamController<Message>.broadcast();
  Stream<Message> get outStatusTwo => outStatusTwoController.stream;
  StreamSink<Message> get sinkStatusTwo => outStatusTwoController.sink;

  StreamController<int> counterController = StreamController<int>.broadcast();
  StreamSink<int> get sinkCounter => counterController.sink;

  StreamController<int> counterObserverController = StreamController<int>.broadcast();
  Stream<int> get counterStream => counterObserverController.stream;  


  void dispose(){
    outStatusOneController.close();
    outStatusTwoController.close();
    counterController.close();
    counterObserverController.close();
  }
  
} 