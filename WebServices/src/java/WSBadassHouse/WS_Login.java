package WSBadassHouse;

import java.sql.ResultSet;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import BD.cDatos;
import java.sql.SQLException;

@WebService(serviceName = "WS_Login")
public class WS_Login {

    private final String clave = "777888222333";

    @WebMethod(operationName = "WS_Login")
    public String WS_Login(@WebParam(name = "correo") String correo, @WebParam(name = "pass") String pass) {
        String resultado = "";
        //String correin=correo, pass1=pass;
        ResultSet rs;
        cDatos datos = new cDatos();
        try {
            datos.conectar();
            datos.setAccion(correo, pass, clave);
            rs = datos.consulta();
            while (rs.next()) {
                if (rs.getString("Estatus").equals("1")) {
                    resultado=rs.getString("nName");
                } else {
                    resultado="invalido";
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return resultado;
    }
}
