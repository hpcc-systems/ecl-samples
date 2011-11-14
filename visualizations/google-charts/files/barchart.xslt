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
    <xsl:template match="Dataset[starts-with(@name,'BarChart')]" mode="generate_body">
        <h1><xsl:value-of select="translate(substring-after(@name, 'BarChart_'),'_',' ')"/></h1>
        <div style="height: 400px; width: 600px;">
            <xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
        </div>
    </xsl:template>
    <xsl:template match="Dataset[starts-with(@name,'BarChart')]" mode="generate_script">
            <xsl:text>
            google.setOnLoadCallback(draw</xsl:text><xsl:value-of select="@name"/><xsl:text>);
            function draw</xsl:text><xsl:value-of select="@name"/><xsl:text>() {
                var data = new google.visualization.DataTable(</xsl:text>
                <xsl:call-template name="outputJsonGoogleChartDataTable"/>
                <xsl:text>,
                        0.6
                    );
                var options = {is3D: true};
                var barchart = new google.visualization.BarChart(document.getElementById('</xsl:text><xsl:value-of select="@name"/><xsl:text>'));
                barchart.draw(data, options);
            }
          </xsl:text>
    </xsl:template>
</xsl:stylesheet>
