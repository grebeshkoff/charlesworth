<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:jnl="urn:hch-jnl-BB4C2D71-E80A-4fe7-B7D8-FDAF121D7AD6"
    xmlns:tbl="urn:hch:table-470CC8FB-4DFD-4003-9403-2FE04FAB5760"
    exclude-result-prefixes="jnl tbl xsl">
    
    <!-- Vareables -->
    
    <xsl:variable name="TypeCodes">
        <xsl:choose>
            <xsl:when test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
                <xsl:choose>
                    <xsl:when test="//jnl:categ[. = 'Correction' or . = 'Corrections']">
                        <xsl:text>correction</xsl:text>
                    </xsl:when>
                    <xsl:when test="//jnl:categ[. = 'correction' or . = 'corrections']">
                        <xsl:text>correction</xsl:text>
                    </xsl:when>
                    <xsl:when test="//jnl:categ[. = 'CORRECTION' or . = 'CORRECTIONS']">
                        <xsl:text>correction</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>case-report</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="//jnl:book-rev">
                <xsl:text>book-review</xsl:text>
            </xsl:when>
            <xsl:when test="//jnl:categ/. = 'book-review'">
                <xsl:text>review-article</xsl:text>
            </xsl:when>
            <xsl:when test="//jnl:categ/. = 'book review'">
                <xsl:text>book-review</xsl:text>
            </xsl:when>
            <xsl:when test="//jnl:categ/. = 'book review'">
                <xsl:text>book-review</xsl:text>
            </xsl:when>
            <xsl:when test="//jnl:categ/. = 'book review'">
                <xsl:text>book-review</xsl:text>
            </xsl:when>
            <xsl:when test="//jnl:news">
                <xsl:text>news</xsl:text>
            </xsl:when>
            <xsl:when test="//jnl:doc/jnl:abstract">
                <xsl:text>abstract</xsl:text>
            </xsl:when>
            <xsl:when test="//jnl:categ/node()">
                <xsl:apply-templates select="//jnl:categ/node()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>research-article</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="TypeCodesmall">
        <xsl:choose>
            <xsl:when test="$TypeCodes != ''">
                <xsl:value-of
                    select="translate($TypeCodes , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
                />
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="TypeCode">
        <xsl:choose>
            <xsl:when test="$TypeCodesmall  = 'book-review'">
                <xsl:text>review-article</xsl:text>
            </xsl:when>
            <xsl:when test="$TypeCodesmall = 'book review'">
                <xsl:text>book-review</xsl:text>
            </xsl:when>
            <xsl:when test="$TypeCodesmall = 'book reviews'">
                <xsl:text>book-review</xsl:text>
            </xsl:when>
            <xsl:when test="$TypeCodesmall = 'case-report'">
                <xsl:text>case-report</xsl:text>
            </xsl:when>
            <xsl:when test="$TypeCodesmall = 'correction'">
                <xsl:text>correction</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>research-article</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="AbbrTitle">
        <xsl:call-template name="string-replace-all">
            <xsl:with-param name="text" select="//jnl:jnl-info/jnl:medline-jnl-tl/." />
            <xsl:with-param name="replace" select="' '" />
            <xsl:with-param name="by" select="'. '" />
        </xsl:call-template>
        <xsl:text>.</xsl:text>
    </xsl:variable>
    
    
    <xsl:variable name="Lang">
        <xsl:text>en</xsl:text>
    </xsl:variable>
    <xsl:variable name="OneLine">
        <xsl:text>yes</xsl:text>
    </xsl:variable>
    <xsl:template name="newline">
        <xsl:if test="$OneLine = 'yes'">
            <xsl:text>
</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template name="emptyline">
        <xsl:if test="$OneLine = 'yes'">
            <xsl:text>
                
 </xsl:text>
        </xsl:if>
    </xsl:template>    
    <xsl:template name="string-replace-all">
        <xsl:param name="text" />
        <xsl:param name="replace" />
        <xsl:param name="by" />
        <xsl:choose>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text,$replace)" />
                <xsl:value-of select="$by" />
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text"
                        select="substring-after($text,$replace)" />
                    <xsl:with-param name="replace" select="$replace" />
                    <xsl:with-param name="by" select="$by" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

     
    
    <xsl:output method="xml" omit-xml-declaration="yes" version="1.0" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:apply-templates select="jnl:doc"/>
    </xsl:template>    
    <xsl:template match="jnl:doc">
        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
        <xsl:text>?xml version="1.0" encoding="UTF-8"?</xsl:text>
        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        <xsl:call-template name="newline"/>
        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
        <xsl:text>!DOCTYPE article PUBLIC "-//NLM//DTD Journal Publishing DTD v3.0 20080202//EN" "journalpublishing3.dtd"</xsl:text>
        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        <xsl:call-template name="emptyline"/>
        <xsl:text disable-output-escaping="yes">&lt;article article-type="</xsl:text>
        <xsl:value-of select="$TypeCode"/>
        <xsl:text disable-output-escaping="yes">" dtd-version="3.0" </xsl:text>
        <xsl:text disable-output-escaping="yes">xmlns:lang="</xsl:text>
        <xsl:value-of select="$Lang"/>
        <xsl:text disable-output-escaping="yes">" </xsl:text>
        <xsl:text disable-output-escaping="yes">xmlns:xlink="http://www.w3.org/1999/xlink" </xsl:text>
        <xsl:text disable-output-escaping="yes">xmlns:mml="http://www.w3.org/1998/Math/MathML"&gt;</xsl:text>
        <xsl:call-template name="newline"/>
            <xsl:element name="front">
                <xsl:element name="journal-meta">
                    <xsl:element name="journal-id">
                        <xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
                        <xsl:apply-templates
                            select="//jnl:jnl-info/jnl:medline-jnl-tl/."/>
                    </xsl:element>
                    <xsl:element name="journal-title-group">
                        <xsl:element name="journal-title">
                            <xsl:apply-templates
                                select="//jnl:jnl-info/jnl:jnl-tl/."/>
                        </xsl:element>
                        <xsl:element name="abbrev-journal-title">
                            <xsl:attribute name="abbrev-type">publisher</xsl:attribute>
                            <xsl:value-of select="$AbbrTitle"/>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="issn">
                        <xsl:attribute name="pub-type">ppub</xsl:attribute>
                        <xsl:apply-templates
                            select="jnl:jnl-info/jnl:issn[@type='print']/."/>
                    </xsl:element>
                    <xsl:choose>
                        <xsl:when
                            test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BJB'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bjb'">
                            <xsl:element name="publisher">
                                <xsl:element name="publisher-name">
                                    <xsl:text><![CDATA[Associa&ccedil;&atilde;o Brasileira de Divulga&ccedil;&atilde;o Cient&iacute;fica]]></xsl:text>
                                </xsl:element>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                </xsl:element>
                <xsl:element name="article-meta">
                    <xsl:element name="article-id">
                        <xsl:attribute name="pub-id-type">publisher-id</xsl:attribute>
                    </xsl:element>
                    <xsl:element name="article-id">
                        <xsl:attribute name="pub-id-type">doi</xsl:attribute>
                        <xsl:apply-templates select="//jnl:unit-info[1]/jnl:doi/."/>
                    </xsl:element>
                    <xsl:element name="article-categories">
                        <xsl:choose>
                            <xsl:when test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BJB'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bjb'">
                                <xsl:element name="article-categories">
                                    <xsl:element name="subj-group">
                                        <xsl:attribute name="subj-group-type">
                                            <xsl:text>heading</xsl:text>
                                        </xsl:attribute>
                                        <xsl:element name="subject">
                                            <xsl:text>Undefined</xsl:text>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                                
                                <xsl:element name="title-group">
                                    <xsl:element name="article-title">
                                        <xsl:attribute name="xml:lang">
                                            <xsl:value-of select="$Lang"/>
                                        </xsl:attribute>
                                        <xsl:apply-templates
                                            select="jnl:article/jnl:front/jnl:title-grp/jnl:title/node()" />
                                    </xsl:element>

                                </xsl:element>
                                
                                
                            </xsl:when>
                        </xsl:choose>
       
                    </xsl:element>
                </xsl:element>
            </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>