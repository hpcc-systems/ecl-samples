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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:template name="outputJsonGoogleChartDataTable">
        <xsl:variable name="dsname" select="@name"/>
        <xsl:variable name="dataset" select="/*/Results/Result/XmlSchema[@name=$dsname]/xs:schema/xs:element[@name='Dataset']"/>
        <xsl:variable name="record" select="$dataset/xs:complexType/xs:sequence/xs:element/xs:complexType/xs:sequence"/>
        <xsl:text> {
                        cols: [</xsl:text>
            <xsl:for-each select="$record/xs:element">
                <xsl:if test="position()>1">,</xsl:if><xsl:text>
                            {id:'</xsl:text><xsl:value-of select="@name"/><xsl:text>', label: '</xsl:text><xsl:value-of select="@name"/><xsl:text>', type: '</xsl:text>
                <xsl:choose>
                    <xsl:when test="contains(@name, 'jsdate_')"><xsl:text>date</xsl:text></xsl:when>
                    <xsl:when test="contains(@type, 'string')"><xsl:text>string</xsl:text></xsl:when>
                    <xsl:otherwise><xsl:text>number</xsl:text></xsl:otherwise>
                </xsl:choose>
                <xsl:text>'}</xsl:text>
            </xsl:for-each>
                            <xsl:text>],
                        rows: [</xsl:text>
                           <xsl:for-each select="Row">
                               <xsl:if test="position()>1">,</xsl:if>
                               <xsl:text>
                            {c:[</xsl:text>
                               <xsl:for-each select="*">
                                     <xsl:variable name="elname" select="local-name()"/>
                                     <xsl:variable name="isString" select="contains($record/xs:element[@name=$elname]/@type, 'string')"/>
                                     <xsl:variable name="isDate" select="contains($record/xs:element[@name=$elname]/@name, 'jsdate_')"/>
                                    <xsl:if test="position()>1"><xsl:text>,</xsl:text></xsl:if>
                                   <xsl:choose>
                                       <xsl:when test="$isDate">
                                           <xsl:text>{v: new Date(</xsl:text><xsl:value-of select="substring(., 1, 4)"/><xsl:text>,</xsl:text><xsl:value-of select="substring(., 5, 2)"/><xsl:text>,</xsl:text><xsl:value-of select="substring(., 7, 2)"/><xsl:text>)}</xsl:text>
                                       </xsl:when>
                                       <xsl:when test="$isString">
                                           <xsl:text> {v: '</xsl:text><xsl:value-of select="."/>'<xsl:text>}</xsl:text>
                                       </xsl:when>
                                       <xsl:otherwise>
                                           <xsl:text> {v: </xsl:text><xsl:value-of select="."/><xsl:text>}</xsl:text>
                                       </xsl:otherwise>
                                   </xsl:choose>
                               </xsl:for-each>
                               <xsl:text>]}</xsl:text>
                           </xsl:for-each>
                        <xsl:text>
                        ]
                }</xsl:text>
    </xsl:template>
</xsl:stylesheet>
