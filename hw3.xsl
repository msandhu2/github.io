<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>List Of Clients</title>
                <style>table, td { border: 1px solid blue; } td, th { padding: 5px; }</style>
            </head>
            <body>
                <!--Present h1 List of Clients -->
                <h1>List Of Clients</h1>
                <!--Create main table just like standard html code -->
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Account Total</th>
                    </tr>
                    <!--XSL for-each loop that populates the cells of the table from the XML root element Accounts
                        Client child element-->
                    <xsl:for-each select="Accounts/Client">
                        <!--XSL sort used to sort by the Last name child element of the Name element-->
                        <xsl:sort select="Name/Last"/>
                        <tr>
                            <td>
                                <!-- Applying the Name template -->
                                <xsl:apply-templates select="Name"/> 
                            </td>
                            <td>
                                <!--XSL select statement to select the Phone element-->
                                <xsl:value-of select="Phone"/>
                            </td>
                            <td>
                                <!--XSL select statement to select the Phone element-->
                                <xsl:value-of select="E-mail"/>
                            </td>
                                <!-- XSL Choose element using precise language to display in dark red text
                                     the accounts that have less than $80000. Otherwise portion instructs all
                                     other accoutns to be written in regular text -->
                            <xsl:choose>
                            <xsl:when test="Account_Total &lt;= 80000">
                            <td style="color:red; font-weight:bold; text-align:right;">
                                <xsl:value-of select="Account_Total"/></td>
                            </xsl:when>
                            <xsl:otherwise>
                            <td style="text-align:right;"><xsl:value-of select="Account_Total"/></td>
                            </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </xsl:for-each> <!--End XSL For-Each Loop-->
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Name"> <!--XSL-Template that derives Name from Elements from Sibling Elements First & Last-->
        <xsl:value-of select="First" />
        <xsl:text> </xsl:text>
        <xsl:value-of select="Last" />
    </xsl:template>
</xsl:stylesheet>
