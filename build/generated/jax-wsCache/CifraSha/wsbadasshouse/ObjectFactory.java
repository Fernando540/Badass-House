
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

    private final static QName _Cifrar_QNAME = new QName("http://WSBadassHouse/", "cifrar");
    private final static QName _CifrarResponse_QNAME = new QName("http://WSBadassHouse/", "cifrarResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: wsbadasshouse
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Cifrar }
     * 
     */
    public Cifrar createCifrar() {
        return new Cifrar();
    }

    /**
     * Create an instance of {@link CifrarResponse }
     * 
     */
    public CifrarResponse createCifrarResponse() {
        return new CifrarResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Cifrar }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://WSBadassHouse/", name = "cifrar")
    public JAXBElement<Cifrar> createCifrar(Cifrar value) {
        return new JAXBElement<Cifrar>(_Cifrar_QNAME, Cifrar.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CifrarResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://WSBadassHouse/", name = "cifrarResponse")
    public JAXBElement<CifrarResponse> createCifrarResponse(CifrarResponse value) {
        return new JAXBElement<CifrarResponse>(_CifrarResponse_QNAME, CifrarResponse.class, null, value);
    }

}
