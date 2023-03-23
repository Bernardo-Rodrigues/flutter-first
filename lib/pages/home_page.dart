import 'package:flutter/material.dart';
import 'package:flutter_first/models/cep.dart';
import 'package:flutter_first/services/cep_service.dart';
import 'package:flutter_first/services/impl/cep_service_impl.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
  
}

class HomePageState extends State<HomePage>{

  final CepService cepService = CepServiceImpl();
  Iterable<Cep> ceps = const Iterable.empty();
  final formkey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  bool loading = false;

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getAllCeps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Flutter App"),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "CEP obrigatório";
                }
                return null;
              },
              controller: textEditingController,
            ),
            ElevatedButton(
              onPressed: onPressed, 
              child: const Text("Buscar CEP")
            ),
            Visibility(
              visible: loading == true,
              child: const CircularProgressIndicator(),
            ),
            Visibility(
              visible: ceps.isNotEmpty,
              child: Column(
                children: ceps.map(
                  (cep) => Text("${cep.logradouro}, bairro ${cep.bairro}, cidade ${cep.localidade} - ${cep.uf}")).toList()
                )
            )
          ],
        ) 
      ),
    );
  }
  
  onPressed() async {
    final valid = formkey.currentState?.validate() ?? false;
    if(valid){
      try {
        setState(() {
          loading = true;
        });
        await cepService.save(textEditingController.text);
        getAllCeps();
      } catch (e) {
        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar endereço")));
      }
    }
  }

  Future getAllCeps() async{
    try {
      ceps = await cepService.getAll();
      setState(() {
        ceps = ceps;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar endereço")));
    }
  }

}