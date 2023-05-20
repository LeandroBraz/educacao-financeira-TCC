

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../core/data_general.dart';
import 'SCRIPT_IN_METAS_BASE.dart';

Future<Database> getDatabase() async{

  // await deleteDatabase(
  //     join(await getDatabasesPath(), "projeto_TCC_db")
  // );
  print("ENTROU NO DATABASE");

  return openDatabase(
    join( await getDatabasesPath(), "projeto_TCC_db"),
      onCreate:(db, version) async {
         db.execute(createTableUsuario);
         db.execute(insert1);
         db.execute(createTableVenda);
         db.execute(createTableCanal);
         db.execute(createTableCompra);
         db.execute(createTableFinancas);
         db.execute(createTableProduto);
    },
    version: 1,
  );


}

// Future<List<Map<String,dynamic>>> buscar() async {
//   await deleteDatabase(
//       join(await getDatabasesPath(), "projeto_TCC_db")
//   );
//
//   String path =  join( await getDatabasesPath(), "projeto_TCC_db");
//   Database db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, v){
//         db.execute(createTableCanal);
//         db.execute(createTableCompra);
//         db.execute(createTableFinancas);
//         db.execute(createTableProduto);
//         db.execute(createTableUsuario);
//         db.execute(createTableVenda);
//         db.execute(insert1);
//       }
//   );
//
//   var retorno = db.query("HOME", where: 'UUID = ?', whereArgs: ["0484fbb0-afcc-11ed-afa1-0242ac120002"]);
//   print("buscado dados no banco");
//   print(retorno);
//   return retorno;
//
//
// }

