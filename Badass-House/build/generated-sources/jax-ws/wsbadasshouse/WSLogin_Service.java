
package wsbadasshouse;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.10-b140803.1500
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "WS_Login", targetNamespace = "http://WSBadassHouse/", wsdlLocation = "http://189.245.172.14:81/WebServices/WS_Login?wsdl")
public class WSLogin_Service
    extends Service
{

    private final static URL WSLOGIN_WSDL_LOCATION;
    private final static WebServiceException WSLOGIN_EXCEPTION;
    private final static QName WSLOGIN_QNAME = new QName("http://WSBadassHouse/", "WS_Login");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://189.245.172.14:81/WebServices/WS_Login?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        WSLOGIN_WSDL_LOCATION = url;
        WSLOGIN_EXCEPTION = e;
    }

    public WSLogin_Service() {
        super(__getWsdlLocation(), WSLOGIN_QNAME);
    }

    public WSLogin_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), WSLOGIN_QNAME, features);
    }

    public WSLogin_Service(URL wsdlLocation) {
        super(wsdlLocation, WSLOGIN_QNAME);
    }

    public WSLogin_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, WSLOGIN_QNAME, features);
    }

    public WSLogin_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public WSLogin_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns WSLogin
     */
    @WebEndpoint(name = "WS_LoginPort")
    public WSLogin getWSLoginPort() {
        return super.getPort(new QName("http://WSBadassHouse/", "WS_LoginPort"), WSLogin.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns WSLogin
     */
    @WebEndpoint(name = "WS_LoginPort")
    public WSLogin getWSLoginPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://WSBadassHouse/", "WS_LoginPort"), WSLogin.class, features);
    }

    private static URL __getWsdlLocation() {
        if (WSLOGIN_EXCEPTION!= null) {
            throw WSLOGIN_EXCEPTION;
        }
        return WSLOGIN_WSDL_LOCATION;
    }

}
