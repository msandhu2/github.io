<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>ABC - Financial Startup</title>
      </head>
      <style>
        body {
          background: lightblue;
        }
        
        h1 {
          font-family: Impact;
        }
        
        p {
          font-size: 16;
        }
        
        img {
          display: block;
          margin-left: auto;
          margin-right: auto;
        }

      </style>
      <body>
        <div id="container">
          <h1>ABC Financial Startup</h1>
          <img src="financialstartup.jpg" alt="Financial Startup Logo" width="100" height="100" style="max-width: 100%; margin: auto;"/>
          <p>We are a very young financial manager company and we are proud of our clients </p>
          <p> We have started with 1 client a little bit more than 10 years ago and now we have <xsl:value-of select="count(Accounts/Client)" />
                clients </p>
          <p>These are our clients
            <xsl:for-each select="Accounts/Client">
              <xsl:value-of select="Name" />
              <xsl:choose>
                <xsl:when test="position()=last()">.</xsl:when>
                <xsl:when test="position()=last() -1">, and </xsl:when>
                <xsl:otherwise>, </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </p>
          <p>
            <xsl:value-of select="count(Accounts/Client/Years[.&gt; 7] )" />
                        of our clients are with us for more than 7 years!</p>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>