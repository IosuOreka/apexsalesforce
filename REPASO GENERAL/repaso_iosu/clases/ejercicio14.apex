/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

// Crea una clase `ReportGenerator` con métodos para agregar datos a un reporte, como `addData` y `generateReport`. Implementa `generateReport`
//  para devolver una cadena con todos los datos agregados en un formato tabular simple.

public class ReportGenerator {

    public String BaseReport { get; set; }
    public String Author { get; set; }
    private List<String> dataList = new List<String>(); 


    public ReportGenerator(String author) {
        this.Author = author;
        this.BaseReport = 'Informe editado por' + author + '\n';  
    }

    public void addData(String data) {
        this.dataList.add(data); 
    }

    public String generateReport() {
        String finalReport = this.BaseReport + '---------------------------\n';
        finalReport += 'Entrada de datos:\n';
        finalReport += '---------------------------\n';


        for (Integer i = 0; i < dataList.size(); i++) {
            finalReport += (i + 1) + '. ' + dataList[i] + '\n'; 
        }

        finalReport += '---------------------------\n';
        finalReport += 'Final del informe\n';
        return finalReport;
    }
}
