<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>
&lt;!DOCTYPE article PUBLIC "-//NLM//DTD Journal Publishing DTD v3.0 20080202//EN" "journalpublishing3.dtd">
        </xsl:text>
        <article>
            <xsl:call-template mame="article"></xsl:call-template>
        </article>    
        
    </xsl:template>
    <xsl:template name="article">
        Hello
    </xsl:template>


    
  
</xsl:stylesheet>