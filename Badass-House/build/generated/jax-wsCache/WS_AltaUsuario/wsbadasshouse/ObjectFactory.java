
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

    private final static QName _WSAltaUsuario_QNAME = new QName("http://WSBadassHouse/", "WS_AltaUsuario");
    private final static QName _WSAltaUsuarioResponse_QNAME = new QName("http://WSBadassHouse/", "WS_AltaUsuarioResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: wsbadasshouse
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link WSAltaUsuarioResponse }
     * 
     */
    public WSAltaUsuarioResponse createWSAltaUsuarioResponse() {
        return new WSAltaUsuarioResponse();
    }

    /**
     * Create an instance of {@link WSAltaUsuario_Type }
     * 
     */
    public WSAltaUsuario_Type createWSAltaUsuario_Type() {
        return new WSAltaUsuario_Type();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link WSAltaUsuario_Type }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://WSBadassHouse/", name = "WS_AltaUsuario")
    public JAXBElement<WSAltaUsuario_Type> createWSAltaUsuario(WSAltaUsuario_Type value) {
        return new JAXBElement<WSAltaUsuario_Type>(_WSAltaUsuario_QNAME, WSAltaUsuario_Type.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link WSAltaUsuarioResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://WSBadassHouse/", name = "WS_AltaUsuarioResponse")
    public JAXBElement<WSAltaUsuarioResponse> createWSAltaUsuarioResponse(WSAltaUsuarioResponse value) {
        return new JAXBElement<WSAltaUsuarioResponse>(_WSAltaUsuarioResponse_QNAME, WSAltaUsuarioResponse.class, null, value);
    }

}
