<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd"
    version="1.0">
    <xsl:output method="xml" encoding="utf-8" indent="yes" />   
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>
&lt;!DOCTYPE article PUBLIC "-//NLM//DTD Journal Publishing DTD v3.0 20080202//EN" "journalpublishing3.dtd">
        </xsl:text>
        <article article-type="research-article" dtd-version="3.0" xml:lang="en" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mml="http://www.w3.org/1998/Math/MathML">
            <front>
                <journal-meta>
                    <xsl:call-template name="journal-id" />
                    <xsl:call-template name="journal-title-group" />
                    <xsl:call-template name="issn" /> 
                    <xsl:call-template name="publisher" />
                </journal-meta>
                <article-meta>
                    
                    <xsl:call-template name="article-id"></xsl:call-template>
                    
                    <xsl:call-template name="article-categories"></xsl:call-template>
                    
                    <xsl:call-template name="title-group"></xsl:call-template>
                    
                    <xsl:call-template name="contrib-group"></xsl:call-template>
                    <!--
                    <xsl:call-template name="author-notes"></xsl:call-template>
                    <xsl:call-template name="pub-date"></xsl:call-template>
                    // some elements
                    <xsl:call-template name="history"></xsl:call-template>
                    <xsl:call-template name="permissions"></xsl:call-template>
                    <xsl:call-template name="abstract"></xsl:call-template>
                    <xsl:call-template name="kwd-group"></xsl:call-template>
                    <xsl:call-template name="counts"></xsl:call-template>
                    -->
                </article-meta>
            </front>
            <body></body>
            <back></back>
        </article>                    
    </xsl:template>
    
    <xsl:template name="journal-id">
        <journal-id  journal-id-type="nlm-ta">
            <xsl:value-of select="/node()/child::node()/child::node()[last()]"/>
        </journal-id>
    </xsl:template>

    <xsl:template name="journal-title-group"  >
        <journal-title-group  journal-id-type="nlm-ta">
            <journal-title>
                <xsl:value-of select="/node()/child::node()/child::node()[3]"/>
            </journal-title>
            <abbrev-journal-title abbrev-type="publisher">
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="/node()/child::node()/child::node()[last()]" />
                    <xsl:with-param name="replace" select="' '" />
                    <xsl:with-param name="by" select="'.'" />
                </xsl:call-template>.
            </abbrev-journal-title>
           
        </journal-title-group>
    </xsl:template>
    
    <xsl:template name="issn">
        <issn type="ppub">
            <xsl:value-of select="/node()/child::node()/child::node()[8]"/>
        </issn>
    </xsl:template>
    
    <xsl:template name="publisher">
        <publisher>
            <publisher-name>
                    <![CDATA[Associa&ccedil;&atilde;o Brasileira de Divulga&ccedil;&atilde;o Cient&iacute;fica]]>
            </publisher-name>
        </publisher>
    </xsl:template>
    
    <xsl:template name="article-id">
        <article-id pub-id-type="publisher-id"/>
        <article-id pub-id-type="doi">
            <xsl:value-of select="/node()[2]/node()[4]/node()[2]/node()[18]"/>
        </article-id>
    </xsl:template>
    
    <xsl:template name="article-categories">
        <article-categories>
            <subj-group subj-group-type="heading">
                <subject>Clinical Investigation</subject>
            </subj-group>
        </article-categories>
    </xsl:template>
    
    <xsl:template name="title-group">
        <title-group>
            <article-title xml:lang="en">
                <xsl:value-of select="/node()[2]/node()[4]/node()[4]/node()[2]"/>
            </article-title>
        </title-group>
    </xsl:template>
    
    <xsl:template name="contrib-group">
        <!--
            There must be template matching and I understand this process, 
            but I can't run it with my tools. 
            Strike XPath queries work from Xpath debuger, but returns enpty data in XSLT code
            Its too hard to work with "/node()[2]/node()[4]/node()[4]/node()[2]" axis
            I can't understand, why.
            Sorry for mistakes )
            
            There is some examples of this match:
            
            
            
            <xsl:template match="//author-grp/author/surmane">
                <surname>
                    <xsl:value-of select=".">
                </surname>
            </xsl:template>
            
            <xsl:template match="//author-grp/author/initial">
                <given-name>
                    <xsl:for-each select="initial">
                        <xsl:value-of select="initial">
                        .
                    </xsl:for-each>
                </given-name>
            </xsl:template>
        <surname>">
            
        -->
    </xsl:template>
    
    
    <!-- Utilites -->
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
</xsl:stylesheet>