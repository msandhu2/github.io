<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>ABC - Financial Startup</title>
      </head>
      <style>  <!--CSS Style for html -->
        body {
          background: lightblue;
        }
        
        h1 {
          font-family: Impact;
        }
                
        img {
          display: block;
          margin-left: auto;
          margin-right: auto;
          max-width: 100%;
        }

      </style>
      <body>
        <div id="container"> 
          <!--h1 Heading of file -->
          <h1>ABC Financial Startup</h1>
          <!--Image file including sizing-->
          <img src="financialstartup.jpg" alt="Financial Startup Logo" width="100" height="100"/>
          <p>We are a very young financial manager company and we are proud of our clients </p>
          
          <!--XPath Count() Function provides tally of the business's number of clients-->
          <p> We have started with 1 client a little bit more than 10 years ago and now we have <xsl:value-of select="count(Accounts/Client)" />
                clients </p>
          <p>These are our clients
            <!--XPath for-each loop Used to Output Names of Clients from XML file -->
            <xsl:for-each select="Accounts/Client">
              <xsl:value-of select="Name" />
              <xsl:choose>  
                <xsl:when test="position()=last()">.</xsl:when> <!--Test if Name is the last in the list-->
                <xsl:when test="position()=last() -1">, and </xsl:when> <!--Test if Name is the next to last in the list then place ,and-->
                <xsl:otherwise>, </xsl:otherwise> <!--If name is not last or next to last name then place  a , after the name-->
              </xsl:choose>
            </xsl:for-each>
          </p>
          <p>
            <!--Count all Clients with more than 7 years from XML file, and write answer in a sentence-->
            <xsl:value-of select="count(Accounts/Client/Years[.&gt; 7] )" />
                        of our clients are with us for more than 7 years!</p>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
