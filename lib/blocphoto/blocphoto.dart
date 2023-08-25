import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdioexample/blocphoto/eventphoto.dart';
import 'package:flutterdioexample/blocphoto/statephoto.dart';
import 'package:flutterdioexample/repositoryphot/repositoryforphoto.dart';



class BlocDart extends Bloc<EventPart,StatesPart>{
  final RepositoryDart _repository;
  BlocDart(this._repository):super(GettingPhotState()){
    on<GetPhotosEvent>((event, emit) async {
      emit(GettingPhotState());
      try{
        final allphotos=await _repository.gettingAllPhotos();
        
        emit(SuccessStateAllPhotos(allphotos));
      }catch(e){
        emit(ErrorStateinGettingAllPhotos(e.toString()));
      }
    },);
  }
}