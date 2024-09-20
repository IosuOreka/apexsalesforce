/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Implementa una clase `ConfigurationManager` con un método `getConfigValue` que acepte una clave y devuelva el valor correspondiente de
//  un mapa interno que simule la configuración del sistema.


public class ConfigurationManager {
    // Mapa estático para almacenar la configuración
    private static Map<String, String> configMap = new Map<String, String>{
        'database.url' => 'jdbc:mysql://localhost:3001/myMysqlDatabase',
        'database.user' => 'root',
        'database.password' => 'password',
        'app.environment' => 'development'
    };

    /**
     * Obtiene el valor de configuración para una clave dada.
     * 
     * @param key La clave de la configuración.
     * @return El valor de la configuración asociado a la clave, o null si la clave no existe.
     */
    public static String getConfigValue(String key) {
        return configMap.get(key);
    }
}
