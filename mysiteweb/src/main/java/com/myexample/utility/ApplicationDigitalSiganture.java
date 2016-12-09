package com.myexample.utility;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertStore;
import java.security.cert.Certificate;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;

import org.apache.pdfbox.exceptions.COSVisitorException;
import org.apache.pdfbox.exceptions.SignatureException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.interactive.digitalsignature.PDSignature;
import org.apache.pdfbox.pdmodel.interactive.digitalsignature.SignatureInterface;
import org.bouncycastle.cms.CMSSignedData;
import org.bouncycastle.cms.CMSSignedDataGenerator;
import org.bouncycastle.cms.CMSSignedGenerator;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

/**
 * An example for singing a PDF with bouncy castle.
 * A keystore can be created with the java keytool, for example:
 *
 * {@code keytool -genkeypair -storepass 123456 -storetype pkcs12 -alias test -validity 365
 *        -v -keyalg RSA -keystore keystore.p12 }
 *
 * @author aman sikarwar
 */

public class ApplicationDigitalSiganture implements SignatureInterface
{

  private static BouncyCastleProvider provider = new BouncyCastleProvider();

  private PrivateKey privKey;

  private Certificate[] cert;

  public ApplicationDigitalSiganture(KeyStore keystore, char[] pin)
  {
    try
    {
      Enumeration<String> aliases = keystore.aliases();
      String alias = null;
      if (aliases.hasMoreElements())
        alias = aliases.nextElement();
      else
        throw new RuntimeException("Could not find Key");
      privKey = (PrivateKey)keystore.getKey(alias, pin);
      cert = keystore.getCertificateChain(alias);
    }
    catch (KeyStoreException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    catch (UnrecoverableKeyException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    catch (NoSuchAlgorithmException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  public File signPDF(File document,File outputDocument, String envelopeId) throws IOException, COSVisitorException, SignatureException
  {
    byte[] buffer = new byte[8 * 1024];
    if (!(document != null && document.exists()))
      new RuntimeException("");
     
    //File outputDocument = new File(filePath);
    FileInputStream fis = new FileInputStream(document);
    FileOutputStream fos = new FileOutputStream(outputDocument);

    int c;
    while ((c = fis.read(buffer)) != -1)
    {
      fos.write(buffer, 0, c);
    }
    fis.close();
    fis = new FileInputStream(outputDocument);

    // load document
    PDDocument doc = PDDocument.load(document);

    // create signature dictionary
    PDSignature signature = new PDSignature();
    signature.setFilter(PDSignature.FILTER_ADOBE_PPKLITE); // default filter
    // subfilter for basic and PAdES Part 2 signatures
    signature.setSubFilter(PDSignature.SUBFILTER_ADBE_PKCS7_DETACHED);
    signature.setName("DrySign");
    signature.setLocation("Pune");
    signature.setReason("Digitally verifiable PDF exported from DrySign. Envelope_ID: "+envelopeId);
    

    // the signing date, needed for valid signature
    signature.setSignDate(Calendar.getInstance());

    // register signature dictionary and sign interface
    doc.addSignature(signature, this);

    // write incremental (only for signing purpose)
    doc.saveIncremental(fis, fos);

    return outputDocument;
  }

//  @Override
  public byte[] sign(InputStream content) throws SignatureException, IOException
  {
    CMSProcessableInputStream input = new CMSProcessableInputStream(content);
    CMSSignedDataGenerator gen = new CMSSignedDataGenerator();
    // CertificateChain
    List<Certificate> certList = Arrays.asList(cert);


    CertStore certStore = null;
    try
    {
      certStore = CertStore.getInstance("Collection", new CollectionCertStoreParameters(certList), provider);
      gen.addSigner(privKey, (X509Certificate)certList.get(0), CMSSignedGenerator.DIGEST_SHA256);
      gen.addCertificatesAndCRLs(certStore);
      CMSSignedData signedData = gen.generate(input, false, provider);
      return signedData.getEncoded();
    }
    catch (Exception e)
    {
      // should be handled
      e.printStackTrace();
    }
    throw new RuntimeException("Problem while preparing signature");
  }

  /*public static void main(String[] args) throws KeyStoreException, NoSuchAlgorithmException,
    CertificateException, FileNotFoundException, IOException, COSVisitorException, SignatureException
  {
    File ksFile = new File("D:/DigitalSign/ApachePDFBOX/Test-Class2DocumentSigner2014.pfx");
    KeyStore keystore = KeyStore.getInstance("PKCS12", provider);
    char[] pin = "emudhra".toCharArray();
    keystore.load(new FileInputStream(ksFile), pin);

    File document = new File("D:/DigitalSign/ApachePDFBOX/9783540698609-c1.pdf");

    DigitalSiganture signing = new DigitalSiganture(keystore, pin.clone());
    //signing.signPDF(document,f);
  }*/
}



