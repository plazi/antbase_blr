<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3" version="2.0">
    <xsl:output encoding="ISO-8859-1" indent="yes" method="xml"/>
    <xsl:template match="/">
        <table><xsl:apply-templates select="descendant::hns_id"/></table>
    </xsl:template>
    <xsl:template match="hns_id">
        <xsl:variable name="hns_mods_request">
            <xsl:text>http://osuc.biosci.ohio-state.edu/hymenoptera/hym_utilities.format_ref?id=</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>&amp;style=MODS</xsl:text>
        </xsl:variable>
        <xsl:message>
            <xsl:value-of select="."/>
        </xsl:message>
<!--       <xsl:result-document href="mods/{.}_mods.xml" encoding="utf-8" indent="yes"
            method="xml">
            <xsl:copy-of select="document($hns_mods_request)"/>
        </xsl:result-document>
-->
        <xsl:apply-templates select="document($hns_mods_request)//mods:mods"/>        
    </xsl:template>
    <xsl:template match="mods:mods">
        <row>
            <xsl:for-each select="descendant::*[text()][not(child::*)]">
                <xsl:element name="{ancestor::mods:relatedItem/@type}{local-name()}">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:for-each>
        </row>
    </xsl:template>
</xsl:stylesheet>
