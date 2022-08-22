import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworldfutter/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int counter =0;

  void minus(){
    if(counter!=0){
      counter--;
      emit(CounterMinusState());
    } else{
      print("Not valied");
      emit(CounterMinusState());
    }
  }

  void plus(){
    counter++;
    emit(CounterPlusState());
  }
}
