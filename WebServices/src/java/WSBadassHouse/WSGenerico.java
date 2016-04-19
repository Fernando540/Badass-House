package WSBadassHouse;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

@WebService(serviceName = "WSGenerico")
public class WSGenerico {

    @WebMethod(operationName = "dimeTipo")
    public String dimeTipo(@WebParam(name = "correo") String correin) {
        BD.cDatos datos = new BD.cDatos();
        String tipoUsuario = "";
        try {
            datos.conectar();
            ResultSet tipoUsr = datos.consulta1("call dimeTipo('" + correin + "');");
            while (tipoUsr.next()) {
                tipoUsuario = tipoUsr.getString("privilegio");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return tipoUsuario;
    }

    @WebMethod(operationName = "dimePuertas")
    public String[] dimePuertas(@WebParam(name = "correo") String correin) {
        BD.cDatos datos = new BD.cDatos();
        String tipoUsuario = "";
        String id[] = new String[2];
        try {
            datos.conectar();
            ResultSet dimePuertas = datos.consulta1("call dimePuertas('" + correin + "');");
            int num = 0;
            while (dimePuertas.next()) {
                id[num] = dimePuertas.getString("codigo");
                num++;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }

    @WebMethod(operationName = "dimePaquete")
    public String dimePaquete(@WebParam(name = "correo") String correin) {
        BD.cDatos datos = new BD.cDatos();
        String paquete = "";
        try {
            datos.conectar();
            ResultSet paqueton = datos.consulta1("call dimePaquete('','" + correin + "');");
            while (paqueton.next()) {
                paquete = paqueton.getString("pkte");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return paquete;
    }

    @WebMethod(operationName = "habiNames")
    public String[] habiNames(@WebParam(name = "correo") String correin) {
        BD.cDatos datos = new BD.cDatos();
        String[] habNames = new String[6];
        try {
            datos.conectar();
            ResultSet habiNames = datos.consulta1("call habiNames('" + correin + "');");
            int itera = 0;
            while (habiNames.next()) {
                habNames[itera] = habiNames.getString("habiName");
                itera = itera + 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return habNames;
    }
    @WebMethod(operationName="")
    public String simulaCorriente(@WebParam(name = "volt")String volt,@WebParam(name = "habit") String habit, @WebParam(name = "contact")String contact , @WebParam(name = "correo") String correo){
        String resultado="";
        BD.cDatos datos=new BD.cDatos();
        try {
                datos.conectar();
                ResultSet habiNames = datos.consulta1("call habiNames('" + correo + "');");
                int itera = 0;
                String[] habNames = new String[6];
                while (habiNames.next()) {
                    habNames[itera] = habiNames.getString("habiName");
                    itera = itera + 1;
                }
            } catch (Exception ex) {
                System.out.print(ex);
            }
        try {

                int res;
                res = datos.modificacion1("call simulaCorriente('" + correo + "','" + volt + "','" + contact + "','" + habit + "')");
                if (res == 1) {
                    resultado="actualizado";
                } else {
                    resultado="Errorts";
                    
                }
            } catch (Exception e) {
                System.out.print(e);
            }
        return resultado;
    }
}
