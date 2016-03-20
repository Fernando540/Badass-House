package WSBadassHouse;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import BD.cDatos;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebService(serviceName = "WS_AltaUsuario")
public class WS_AltaUsuario {

    private final String clave = "777888222333";

    @WebMethod(operationName = "WS_AltaUsuario")
    public String WS_AltaUsuario(@WebParam(name = "correo") String correo, @WebParam(name = "pass") String pass, @WebParam(name = "numSerie") String numSerie, @WebParam(name = "nombre") String nombre,
            @WebParam(name = "aPaterno") String aPaterno, @WebParam(name = "aMaterno") String aMaterno, @WebParam(name = "direccion") String direccion) {
        String resultado = "", nka = "";
        cDatos conectar = new cDatos();
        ResultSet rs;

        try {
            conectar.conectar();
            conectar.setAccion(correo, pass, clave);
            rs = conectar.consulta();

            while (rs.next()) {
                if (rs.getString("Estatus").equals("1")) {
                    resultado = "Usuario ya Registrado";
                } else {
                    rs = conectar.consulta1("call validaSerie('" + numSerie + "');");
                    while (rs.next()) {
                        if (rs.getString("resultado").equals("ira men no existe ese numero de serie")) {
                            resultado = "ira men no existe ese numero de serie";

                        } else {
                            rs = conectar.consulta1("call dimeCuenta('" + numSerie + "');");

                            while (rs.next()) {
                                if (rs.getString("msj").equals("adelante")) {

                                    conectar.setAccion(correo, pass, clave, nombre, aPaterno, aMaterno);
                                    conectar.modificacion();
                                    conectar.regCasa(direccion, correo, numSerie);
                                    conectar.modificacion();
                                    conectar.modificacion1("call altaTipo('" + correo + "','Premium');");

                                    conectar.consulta1("call ingresaProteccion('" + correo + "','" + nka + "');");
                                    conectar.consulta1("call altaNoti('" + numSerie + "');");
                                    resultado = "registrado";

                                } else {
                                    resultado = "Ingresa a tu cuenta principal para agregar una nueva cuenta";

                                }
                            }

                        }
                    }

                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return resultado;
    }
}
