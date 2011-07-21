<?xml version="1.0"?>
<!--
svn log http://svn.your.repo/repo \-\-verbose \-\-xml \-\-with-all-revprops -rHEAD:1 \-\-limit 100 | xsltproc svn2rss.xslt -
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/log">
<rss version="2.0">
<channel>
	<title>svn2rss.xslt</title>
	<description>svn2rss.xslt</description>
	<link>your link</link>
	<xsl:for-each select="logentry">
		<item>
			<link>http://svn.your.repo/viewvc/?root=repo&amp;view=rev&amp;diff_format=h&amp;revision=<xsl:value-of select="@revision"/></link>
			<author><xsl:value-of select="author"/></author>
			<pubDate><xsl:value-of select="date"/></pubDate>
			<description><xsl:text disable-output-escaping="yes">&lt;![CDATA[&lt;pre&gt;</xsl:text><xsl:for-each select="paths/path">
					<xsl:value-of select="@action"/><xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
			</xsl:for-each><xsl:text disable-output-escaping="yes">&lt;/pre&gt;]]&gt;</xsl:text>
			</description>
			<title><xsl:value-of select="@revision"/><xsl:text> </xsl:text><xsl:value-of select="author"/><xsl:text> </xsl:text><xsl:value-of select="msg"/></title>
		</item>
	</xsl:for-each>
</channel>
</rss>
</xsl:template>

</xsl:stylesheet>
