import 'package:flutter/material.dart';

class TasksScreen  extends StatefulWidget{
  const TasksScreen({super.key});

  @override
State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<String> tarefas = [
    "Estudar flutter",
    "Fazer exercicios",
    "Preparar aula",
    "JoyBoy Is the best",
  ];

  final TextEditingController tarefaController = TextEditingController();
  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("App de Tarefas Joy")),
     body: Padding(
         padding: const EdgeInsets.all(16.0),
     child: Column(
       children:[TextField(
         controller: tarefaController,
         decoration: const InputDecoration(
           labelText: "Nova Tarefa",
           border: OutlineInputBorder(),
         ),
       ),
       const SizedBox(height: 12),
         ElevatedButton(
             onPressed:() {
               if (tarefaController.text.isNotEmpty){
                 setState(() {
                   tarefas.add(tarefaController.text);
                 });
                 tarefaController.clear();
               }
             },
         child: const Text("Adicionar"),),
       const SizedBox(height: 20),
       Expanded(
           child: ListView.builder(
               itemCount: tarefas.length,
             itemBuilder: (context, index){
                 return ListTile(
                     title: Text(tarefas[index]),
                 trailing: IconButton( 
                     icon: const Icon(Icons.delete),
                 onPressed: (){
                       setState(() {
                         tarefas.removeAt(index);
                       });
                 },
                 ),
                 );
             },
           ),
       ),
       ],
     ),
     ),
    );
  }
}