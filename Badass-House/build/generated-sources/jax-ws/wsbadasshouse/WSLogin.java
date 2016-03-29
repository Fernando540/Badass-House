
package wsbadasshouse;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.10-b140803.1500
 * Generated source version: 2.2
 * 
 */
@WebService(name = "WS_Login", targetNamespace = "http://WSBadassHouse/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface WSLogin {


    /**
     * 
     * @param pass
     * @param correo
     * @return
     *     returns java.lang.String
     */
    @WebMethod(operationName = "WS_Login")
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "WS_Login", targetNamespace = "http://WSBadassHouse/", className = "wsbadasshouse.WSLogin_Type")
    @ResponseWrapper(localName = "WS_LoginResponse", targetNamespace = "http://WSBadassHouse/", className = "wsbadasshouse.WSLoginResponse")
    @Action(input = "http://WSBadassHouse/WS_Login/WS_LoginRequest", output = "http://WSBadassHouse/WS_Login/WS_LoginResponse")
    public String wsLogin(
        @WebParam(name = "correo", targetNamespace = "")
        String correo,
        @WebParam(name = "pass", targetNamespace = "")
        String pass);

}