//*Enunciado:** Crea una clase `ReportGenerator` con métodos para agregar datos a un reporte, como `addData` y `generateReport`. Implementa `generateReport` para devolver una cadena con todos los datos agregados en un formato tabular simple.


public class ReportGenerator {
    public List<String> Data { get; set; }

    public ReportGenerator() {
        Data = new List<String>();
    }

    public void addData(String data) {
        this.Data.add(data);
    }

    public String generateReport() {
        String report = '';
        for (String data : Data) {
            report += data + '\n';
        }
        System.debug(report);
        return report;
    }
}