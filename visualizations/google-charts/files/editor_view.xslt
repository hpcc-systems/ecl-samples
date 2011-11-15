<?xml version="1.0" encoding="utf-8"?>
<!--
##############################################################################
#    Copyright (C) 2011 HPCC Systems.
#
#    All rights reserved. This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##############################################################################
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:include href="json_chart_data.xslt"/>
    <xsl:include href="editor.xslt"/>
    <xsl:template match="/">
        <xsl:apply-templates select="*/Results/Result"/>
    </xsl:template>
    <xsl:template match="Result">
        <html>
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <title>ECL Workunit Web View using Google Chart Editor.</title>
                <script type="text/javascript" src="http://www.google.com/jsapi"> </script>
                <script type="text/javascript"><xsl:text>
                  google.load('visualization', '1.0', {packages: ['charteditor']});
                </xsl:text>
                <xsl:apply-templates select="Dataset" mode="generate_script"/>
                </script>
            </head>
            <body>
                <xsl:apply-templates select="Dataset" mode="generate_body"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
