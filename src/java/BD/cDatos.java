package BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class cDatos {

    private String usrBD;
    private String passBD;
    private String urlBD;
    private String driverClassName;
    private Connection conn = null;
    private Statement estancia;
    String accion1;

    public cDatos() {
        //poner los datos apropiados
        this.usrBD = "root";
        this.passBD = "n0m3l0";
        this.urlBD = "jdbc:mysql://127.0.0.1:1433/badasshouse";
        this.driverClassName = "com.mysql.jdbc.Driver";
    }

    //Conexion a la BD

    public void conectar() throws SQLException {
        try {
            Class.forName(this.driverClassName).newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);

        } catch (Exception err) {
            System.out.println("Error " + err.getMessage());
        }
    }

    //Cerrar la conexion de BD
    public void cierraConexion() throws SQLException {
        this.conn.close();
    }

    public void setAccion(String correo, String pass1, String clave, String nombre, String aPaterno, String aMaterno) {
        this.accion1 = "insert into usuarios(correo,contrasenia,nombre,aPaterno,aMaterno) "
                + "values('" + correo + "',AES_ENCRYPT('" + pass1 + "','" + clave + "'),'" + nombre + "','" + aPaterno + "','" + aMaterno + "');";

    }

    public void setAccion(String correo, String pass1, String clave) {
        
            
                this.accion1 = "call valida('" + correo + "',AES_ENCRYPT('" + pass1 + "','" + clave + "'));";
            
        
    }
    public void setAccion(String direccion){
        this.accion1="call registraCasa('"+direccion+"');";
    }
    public void setAccion(String idUsuario, String idCasa){
        this.accion1="call relacionUsrCasa('"+idUsuario+"','"+idCasa+"')";
    }
    /*public void setAccion(String huella, String correo,String nombre,String hora){
        this.accion1="call iniciaSesion('"+huella+"','"+correo+"','"+nombre+"','"+hora+"');";
    }*/

    public String getAccion() {
        return accion1;
    }

    //Metodos para ejecutar sentencias SQL
    public ResultSet consulta() throws SQLException {
        this.estancia = (Statement) conn.createStatement();
        return this.estancia.executeQuery(accion1);
    }
    public ResultSet consulta1(String txt) throws SQLException{
        this.estancia = (Statement) conn.createStatement();
        return this.estancia.executeQuery(txt);
    }

    public int modificacion() throws SQLException {
        this.estancia = (Statement) conn.createStatement();
        return this.estancia.executeUpdate(accion1);
    }
    public int modificacion1(String txt) throws SQLException {
        this.estancia = (Statement) conn.createStatement();
        return this.estancia.executeUpdate(txt);
    }

}
