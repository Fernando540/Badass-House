
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
@WebServiceClient(name = "CifraCesar", targetNamespace = "http://WSBadassHouse/", wsdlLocation = "http://189.245.172.14:81/WebServices/CifraCesar?wsdl")
public class CifraCesar_Service
    extends Service
{

    private final static URL CIFRACESAR_WSDL_LOCATION;
    private final static WebServiceException CIFRACESAR_EXCEPTION;
    private final static QName CIFRACESAR_QNAME = new QName("http://WSBadassHouse/", "CifraCesar");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://189.245.172.14:81/WebServices/CifraCesar?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        CIFRACESAR_WSDL_LOCATION = url;
        CIFRACESAR_EXCEPTION = e;
    }

    public CifraCesar_Service() {
        super(__getWsdlLocation(), CIFRACESAR_QNAME);
    }

    public CifraCesar_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), CIFRACESAR_QNAME, features);
    }

    public CifraCesar_Service(URL wsdlLocation) {
        super(wsdlLocation, CIFRACESAR_QNAME);
    }

    public CifraCesar_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, CIFRACESAR_QNAME, features);
    }

    public CifraCesar_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public CifraCesar_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns CifraCesar
     */
    @WebEndpoint(name = "CifraCesarPort")
    public CifraCesar getCifraCesarPort() {
        return super.getPort(new QName("http://WSBadassHouse/", "CifraCesarPort"), CifraCesar.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns CifraCesar
     */
    @WebEndpoint(name = "CifraCesarPort")
    public CifraCesar getCifraCesarPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://WSBadassHouse/", "CifraCesarPort"), CifraCesar.class, features);
    }

    private static URL __getWsdlLocation() {
        if (CIFRACESAR_EXCEPTION!= null) {
            throw CIFRACESAR_EXCEPTION;
        }
        return CIFRACESAR_WSDL_LOCATION;
    }

}
