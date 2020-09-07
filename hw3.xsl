<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>List Of Clients</title>
                <style>table, td { border: 1px solid blue; } td, th { padding: 5px; }</style>
            </head>
            <body>
                <h1>List Of Clients</h1>

                <table>
                    <tr>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Account Total</th>
                    </tr>
                    <xsl:for-each select="Accounts/Client">
                        <xsl:sort select="Name"/>
                        <tr>
                            <td>
                                <xsl:apply-templates select="Name"/>
                            </td>
                            <td>
                                <xsl:value-of select="Phone"/>
                            </td>
                            <td>
                                <xsl:value-of select="E-mail"/>
                            </td>
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
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Name">
        <xsl:value-of select="First" />
        #x20;<xsl:value-of select="Last" />
    </xsl:template>
</xsl:stylesheet>
