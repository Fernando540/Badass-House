
package wsbadasshouse;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the wsbadasshouse package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _WSLogin_QNAME = new QName("http://WSBadassHouse/", "WS_Login");
    private final static QName _WSLoginResponse_QNAME = new QName("http://WSBadassHouse/", "WS_LoginResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: wsbadasshouse
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link WSLogin_Type }
     * 
     */
    public WSLogin_Type createWSLogin_Type() {
        return new WSLogin_Type();
    }

    /**
     * Create an instance of {@link WSLoginResponse }
     * 
     */
    public WSLoginResponse createWSLoginResponse() {
        return new WSLoginResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link WSLogin_Type }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://WSBadassHouse/", name = "WS_Login")
    public JAXBElement<WSLogin_Type> createWSLogin(WSLogin_Type value) {
        return new JAXBElement<WSLogin_Type>(_WSLogin_QNAME, WSLogin_Type.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link WSLoginResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://WSBadassHouse/", name = "WS_LoginResponse")
    public JAXBElement<WSLoginResponse> createWSLoginResponse(WSLoginResponse value) {
        return new JAXBElement<WSLoginResponse>(_WSLoginResponse_QNAME, WSLoginResponse.class, null, value);
    }

}
