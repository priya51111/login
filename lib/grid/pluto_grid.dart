import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pluto_grid/pluto_grid.dart';

class StudentTable extends StatefulWidget {
  const StudentTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentTableState createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable> {
  late PlutoGridStateManager stateManager;
    final log = Logger();

  List<PlutoColumn> columns = [
    PlutoColumn(title: 'No of Students', field: 'no', type: PlutoColumnType.number(), width: 150),
    PlutoColumn(title: 'Names', field: 'name', type: PlutoColumnType.text(), width: 200,enableColumnDrag: true),
    PlutoColumn(title: 'Maths', field: 'maths', type: PlutoColumnType.number(), width: 100),
    PlutoColumn(title: 'Science', field: 'science', type: PlutoColumnType.number(), width: 100),
    PlutoColumn(title: 'English', field: 'english', type: PlutoColumnType.number(), width: 100),
    PlutoColumn(title: 'Tamil', field: 'tamil', type: PlutoColumnType.number(), width: 100),
    PlutoColumn(title: 'Social', field: 'social', type: PlutoColumnType.number(), width: 100), 
    PlutoColumn(title: 'Total Mark Scored', field: 'total', type: PlutoColumnType.number(), width: 150),
  ];

  List<PlutoRow> rows = [
    PlutoRow(cells: {
      'no': PlutoCell(value: 1),
      'name': PlutoCell(value: 'John Doe'),
      'maths': PlutoCell(value: 85),
      'science': PlutoCell(value: 90),
      'english': PlutoCell(value: 80),
      'tamil': PlutoCell(value: 75),
      'social': PlutoCell(value: 88),
      'total': PlutoCell(value: 418),
    }),
    PlutoRow(cells: {
      'no': PlutoCell(value: 2),
      'name': PlutoCell(value: 'Jane Smith'),
      'maths': PlutoCell(value: 78),
      'science': PlutoCell(value: 85),
      'english': PlutoCell(value: 82),
      'tamil': PlutoCell(value: 79),
      'social': PlutoCell(value: 90),
      'total': PlutoCell(value: 414),
    }),
      PlutoRow(cells: {
      'no': PlutoCell(value: 2),
      'name': PlutoCell(value: 'Joh'),
      'maths': PlutoCell(value: 58),
      'science': PlutoCell(value: 90),
      'english': PlutoCell(value: 82),
      'tamil': PlutoCell(value: 59),
      'social': PlutoCell(value: 50),
      'total': PlutoCell(value: 338),
    }),
      PlutoRow(cells: {
      'no': PlutoCell(value: 2),
      'name': PlutoCell(value: 'Joshva'),
      'maths': PlutoCell(value: 100),
      'science': PlutoCell(value: 100),
      'english': PlutoCell(value: 100),
      'tamil': PlutoCell(value: 100),
      'social': PlutoCell(value:98),
      'total': PlutoCell(value: 498 ),
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pluto Grid Example')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlutoGrid(
          columns: columns,
          rows: rows,
          onLoaded: (PlutoGridOnLoadedEvent event) {
            stateManager = event.stateManager;
          },
          onChanged: (PlutoGridOnChangedEvent event) {
            log.i('Changed field: ${event.column.field}, New value: ${event.value}');
          },
         configuration: PlutoGridConfiguration(
     style: PlutoGridStyleConfig(
    borderColor: Colors.black, // Set border color
    enableGridBorderShadow: true, // Enables grid border shadow
    gridBorderRadius: BorderRadius.circular(8), // Rounds grid corners
  ),
),

        ),
      ),
    );
  }
}
