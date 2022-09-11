import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/task.dart';

CollectionReference<Task> getTaskCollection(){
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
      fromFirestore: (snapshot, options)=> Task.fromJson(snapshot.data()!),
      toFirestore: (task,options)=> task.toJson()
  );
}
 Future<void> addTaskToFirebase(Task task){
  var collection= getTaskCollection();
  var docRef=collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Future<void> deleteTaskFromFireStore(Task task){
  return getTaskCollection().doc(task.id).delete();
}



Future<void> updateTask(Task task) {
  return getTaskCollection()
      .doc(task.id)
      .update({'tittle': task.title,
               'description':task.description})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> isDones(bool isDone,Task task) {
  return getTaskCollection()
      .doc(task.id)
      .update({'isDone':isDone})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}