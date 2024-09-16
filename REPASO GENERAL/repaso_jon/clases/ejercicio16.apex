//Enunciado:** Implementa una clase `ConfigurationManager` con un método `getConfigValue` que acepte una clave y devuelva el valor correspondiente de un mapa interno que simule la configuración del sistema.

public class ConfigurationManager {
    private Map<String, String> configuracion = new Map<String, String>{
        'uno' => 'algo1',
        'dos' => 'algo2',
        'tres' => 'algo3'
    };

    public String getConfiguration(String clave) {
        System.debug('Esta es la confi: ' + configuracion.get(clave));
        return configuracion.get(clave);
    }
}