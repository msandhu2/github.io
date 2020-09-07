<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>List Of Clients</title>
                <style>table, td, th { border: 1px solid red; } td, th { padding: 5px; }</style>
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
                        <tr>
                            <td>
                                <xsl:apply-templates select="Name"/>
                            </td>
                            <td>
                                <xsl:value-of select="Phone"/>
                            </td>
                            <td>
                                <xsl:value-of select="Email"/>
                            </td>
                            <td>
                                <xsl:value-of select="Account_Total"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Name">
        <xsl:value-of select="First" />
        <xsl:value-of select="Last" />
    </xsl:template>
</xsl:stylesheet>
