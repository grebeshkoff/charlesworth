<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:jnl="urn:hch-jnl-BB4C2D71-E80A-4fe7-B7D8-FDAF121D7AD6"
	xmlns:tbl="urn:hch:table-470CC8FB-4DFD-4003-9403-2FE04FAB5760"
	exclude-result-prefixes="jnl tbl xsl">

	<xsl:variable name="doipart1">
		<xsl:apply-templates select="//jnl:unit-info[1]/jnl:doi/node()"/>
	</xsl:variable>

	<xsl:variable name="doiparted">
		<xsl:choose>
			<xsl:when test="contains($doipart1, '/')">
				<xsl:value-of select="substring-after($doipart1,'/')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$doipart1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

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
	<xsl:variable name="TypeSubCode">
		<xsl:choose>
			<xsl:when test="$TypeCodesmall  = 'book-review'">
				<xsl:text>Review Article</xsl:text>
			</xsl:when>
			<xsl:when test="$TypeCodesmall = 'book review'">
				<xsl:text>Book Review</xsl:text>
			</xsl:when>
			<xsl:when test="$TypeCodesmall = 'book reviews'">
				<xsl:text>Book Review</xsl:text>
			</xsl:when>
			<xsl:when test="$TypeCodesmall = 'research-article'">
				<xsl:text>Research Article</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Research Article</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CustCode">
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BJR' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bjr'">
				<xsl:value-of select="'bjr'"/>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
				<xsl:value-of select="'imj'"/>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
				<xsl:value-of select="'dmf'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="fvolume">
		<xsl:apply-templates select="//jnl:jnl-info/jnl:vol/node()"/>
	</xsl:variable>
	<xsl:variable name="fissue">
		<xsl:apply-templates select="//jnl:jnl-info/jnl:issue-no/node()"/>
	</xsl:variable>
	<xsl:variable name="EEEMonth">
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BFN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bfn'">
				<xsl:text>99</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BNP' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bnp'">
				<xsl:text>99</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BST' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bst'">
				<xsl:text>88</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BBM' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bbm'">
				<xsl:text>88</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIP' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bip'">
				<xsl:text>88</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BQC' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bqc'">
				<xsl:text>88</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BTC' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'btc'">
				<xsl:text>88</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BBN' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bbn'">
				<xsl:text>77</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BEH' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'beh'">
				<xsl:text>66</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BMH' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bmh'">
				<xsl:text>55</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BSM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bsm'">
				<xsl:text>6</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BEP'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bem'">
				<xsl:text>3</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BPN' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bpn'">
				<xsl:text>6</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BDT' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bdt'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BCO' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bco'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BMP' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bmp'">
				<xsl:text>6</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BME' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bme'">
				<xsl:text>6</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BEM' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bem'">
				<xsl:text>6</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BHT' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bht'">
				<xsl:text>24</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>12</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EEDay">
		<xsl:choose>
			<xsl:when test="string-length($fissue) = 0">
				<xsl:text/>
			</xsl:when>
			<xsl:when test="$fissue = '0' or $fissue = '00' or $fissue = '000'">
				<xsl:text/>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BHT' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bht'">
				<xsl:choose>
					<xsl:when test="$fissue = '1' or $fissue = '3' or $fissue = '5'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '7' or $fissue = '9' or $fissue = '11'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '13' or $fissue = '15' or $fissue = '17'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '19' or $fissue = '21' or $fissue = '23'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '2' or $fissue = '4' or $fissue = '6'">
						<xsl:text>15</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '8' or $fissue = '10' or $fissue = '12'">
						<xsl:text>15</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '14' or $fissue = '16' or $fissue = '18'">
						<xsl:text>15</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '20' or $fissue = '22' or $fissue = '24'">
						<xsl:text>15</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EEMonth">
		<xsl:choose>
			<xsl:when test="string-length($fissue) = 0">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="$fissue = '0' or $fissue = '00' or $fissue = '000'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '12'">
				<xsl:value-of select="$fissue"/>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '24'">
				<xsl:choose>
					<xsl:when test="$fissue = '1' or $fissue = '2'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '3' or $fissue = '4'">
						<xsl:text>2</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '5' or $fissue = '6'">
						<xsl:text>3</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '7' or $fissue = '8'">
						<xsl:text>4</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '9' or $fissue = '10'">
						<xsl:text>5</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '11' or $fissue = '12'">
						<xsl:text>6</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '13' or $fissue = '14'">
						<xsl:text>7</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '15' or $fissue = '16'">
						<xsl:text>8</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '17' or $fissue = '18'">
						<xsl:text>9</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '19' or $fissue = '20'">
						<xsl:text>10</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '21' or $fissue = '22'">
						<xsl:text>11</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '23' or $fissue = '24'">
						<xsl:text>12</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '1'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '99'">
				<xsl:choose>
					<xsl:when test="$fissue = '1'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '2'">
						<xsl:text>3</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '3'">
						<xsl:text>5</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '4'">
						<xsl:text>7</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '5'">
						<xsl:text>9</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '6'">
						<xsl:text>11</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '88'">
				<xsl:choose>
					<xsl:when test="$fissue = '1'">
						<xsl:text>2</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '2'">
						<xsl:text>4</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '3'">
						<xsl:text>6</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '4'">
						<xsl:text>8</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '5'">
						<xsl:text>10</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '6'">
						<xsl:text>12</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>2</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '77'">
				<xsl:choose>
					<xsl:when test="$fissue = '1'">
						<xsl:text>1</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '2'">
						<xsl:text>4</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '3'">
						<xsl:text>7</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '4'">
						<xsl:text>10</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '66'">
				<xsl:choose>
					<xsl:when test="$fissue = '1'">
						<xsl:text>2</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '2'">
						<xsl:text>5</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '3'">
						<xsl:text>8</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '4'">
						<xsl:text>11</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>2</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '66'">
				<xsl:choose>
					<xsl:when test="$fissue = '1'">
						<xsl:text>6</xsl:text>
					</xsl:when>
					<xsl:when test="$fissue = '2'">
						<xsl:text>12</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>6</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '2'  and $fissue = '1'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '2'  and $fissue = '2'">
				<xsl:text>7</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '3'  and $fissue = '1'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '3'  and $fissue = '2'">
				<xsl:text>5</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '3'  and $fissue = '3'">
				<xsl:text>9</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '4'  and $fissue = '1'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '4'  and $fissue = '2'">
				<xsl:text>4</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '4'  and $fissue = '3'">
				<xsl:text>7</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '4'  and $fissue = '4'">
				<xsl:text>10</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '6'  and $fissue = '1'">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '6'  and $fissue = '2'">
				<xsl:text>3</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '6'  and $fissue = '3'">
				<xsl:text>5</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '6'  and $fissue = '4'">
				<xsl:text>7</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '6'  and $fissue = '5'">
				<xsl:text>9</xsl:text>
			</xsl:when>
			<xsl:when test="$EEEMonth  = '6'  and $fissue = '6'">
				<xsl:text>11</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ffpage">
		<xsl:apply-templates select="//jnl:unit-info[1]/jnl:fpage/node()"/>
	</xsl:variable>
	<xsl:variable name="filecode">
		<xsl:value-of select="$CustCode"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length($fvolume) = 1">
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:when test="string-length($fvolume) = 0">
				<xsl:text>00</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="$fvolume"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
				<xsl:choose>
					<xsl:when test="string-length($fissue) = 0">
						<xsl:text>0</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string-length($fissue) = 1">
						<xsl:text>0</xsl:text>
					</xsl:when>
					<xsl:when test="string-length($fissue) = 0">
						<xsl:text>00</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$fissue"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length($ffpage) = 3"> </xsl:when>
			<xsl:when test="string-length($ffpage) = 2">
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:when test="string-length($ffpage) = 1">
				<xsl:text>00</xsl:text>
			</xsl:when>
			<xsl:when test="string-length($ffpage) = 0">
				<xsl:text>000</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="$ffpage"/>
	</xsl:variable>
	<xsl:variable name="fileCcode">
		<xsl:value-of
			select="translate($CustCode , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length($fvolume) = 1">
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:when test="string-length($fvolume) = 0">
				<xsl:text>00</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="$fvolume"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
				<xsl:choose>
					<xsl:when test="string-length($fissue) = 0">
						<xsl:text>0</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string-length($fissue) = 1">
						<xsl:text>0</xsl:text>
					</xsl:when>
					<xsl:when test="string-length($fissue) = 0">
						<xsl:text>00</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$fissue"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length($ffpage) = 3"> </xsl:when>
			<xsl:when test="string-length($ffpage) = 2">
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:when test="string-length($ffpage) = 1">
				<xsl:text>00</xsl:text>
			</xsl:when>
			<xsl:when test="string-length($ffpage) = 0">
				<xsl:text>000</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="$ffpage"/>
	</xsl:variable>
	<xsl:variable name="RfileCcode">
		<xsl:value-of
			select="translate($CustCode , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length($fvolume) = 1">
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:when test="string-length($fvolume) = 0">
				<xsl:text>00</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="$fvolume"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
				<xsl:choose>
					<xsl:when test="string-length($fissue) = 0">
						<xsl:text>0</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string-length($fissue) = 1">
						<xsl:text>0</xsl:text>
					</xsl:when>
					<xsl:when test="string-length($fissue) = 0">
						<xsl:text>00</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$fissue"/>
		<xsl:text>-</xsl:text>
	</xsl:variable>
	<xsl:variable name="FigReduce">
		<xsl:text>1</xsl:text>
	</xsl:variable>
	<xsl:variable name="AuthCorr">
		<xsl:text>0</xsl:text>
	</xsl:variable>
	<xsl:variable name="AffType">
		<xsl:text>0</xsl:text>
	</xsl:variable>
	<xsl:variable name="RefSup">
		<xsl:text>0</xsl:text>
	</xsl:variable>
	<xsl:variable name="FigCode">
		<xsl:text>0</xsl:text>
	</xsl:variable>
	<xsl:variable name="JrnalCode"> </xsl:variable>
	<xsl:variable name="CorresAuthor">
		<xsl:text>0</xsl:text>
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

	<xsl:output method="xml" omit-xml-declaration="yes" version="1.0" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/">
		<xsl:apply-templates select="jnl:doc"/>
	</xsl:template>
	<xsl:template match="jnl:acks" priority="1"/>
	<xsl:template match="jnl:quote" priority="1">
		<xsl:element name="disp-quote">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="jnl:url">
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
				<xsl:text disable-output-escaping="yes">&lt;ext-link ext-link-type="uri" xlink:href="</xsl:text>
				<xsl:apply-templates mode="justcharr"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/ext-link&gt;</xsl:text>
			</xsl:when>
			<xsl:when
				test="ancestor::jnl:cit and parent::jnl:othinfo[not(preceding-sibling::node())]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;ext-link ext-link-type="uri" xlink:href="</xsl:text>
				<xsl:apply-templates select="@url"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/ext-link&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:tbl" mode="code">
		<xsl:variable name="fid">
			<xsl:value-of select="substring-after(@id,'tbl')"/>
		</xsl:variable>
		<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
		<xsl:value-of select="$fileCcode"/>
		<xsl:text>-t</xsl:text>
		<xsl:choose>
			<xsl:when test="$fid > 9">
				<xsl:text/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>0</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$fid"/>
		<!--<xsl:text>.tif</xsl:text>-->
		<xsl:text disable-output-escaping="yes">"/&gt;</xsl:text>
		<xsl:call-template name="newline"/>
		<xsl:text disable-output-escaping="yes">&lt;!--</xsl:text>
		<xsl:call-template name="newline"/>
	</xsl:template>
	<xsl:template match="jnl:tbl">
		<xsl:variable name="fids">
			<xsl:value-of select="@id"/>
		</xsl:variable>
		<xsl:variable name="fidused">
			<xsl:for-each select="//jnl:tblref">
				<xsl:choose>
					<xsl:when test="@rids and @rids = $fids">
						<xsl:choose>
							<xsl:when test="ancestor::jnl:footnote"/>
							<xsl:when test="ancestor::jnl:tbl"/>
							<xsl:when test="ancestor::jnl:fig"/>
							<xsl:when test="ancestor::jnl:p">
								<xsl:text>1</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="$fidused = ''">
			<xsl:variable name="fid">
				<xsl:value-of select="substring-after(@id,'tbl')"/>
			</xsl:variable>
			<xsl:variable name="ftype">
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
						<xsl:apply-templates select="self::node()" mode="Mtype"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$ftype = ''">
					<xsl:element name="table-wrap">
						<xsl:attribute name="id">
							<xsl:text>t</xsl:text>
							<xsl:choose>
								<xsl:when test="$fid > 9">
									<xsl:text/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>0</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="$fid"/>
						</xsl:attribute>
						<xsl:attribute name="position">
							<xsl:text>float</xsl:text>
						</xsl:attribute>
						<xsl:if test="@num and @num !=''">
							<xsl:element name="label">
								<xsl:text>Table </xsl:text>
								<xsl:apply-templates select="@num"/>
								<xsl:text>.</xsl:text>
							</xsl:element>
						</xsl:if>
						<xsl:apply-templates select="tbl:table"/>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
										<xsl:variable name="doi">
											<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
										</xsl:variable>
										<xsl:text>bio.</xsl:text>
										<xsl:choose>
											<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
										<xsl:variable name="doi">
											<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
										</xsl:variable>
										<xsl:text>bio.</xsl:text>
										<xsl:choose>
											<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
										<xsl:variable name="doi">
											<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
										</xsl:variable>
										<xsl:text>jcs.</xsl:text>
										<xsl:choose>
											<xsl:when test="starts-with($doi , 'ces.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'CES.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES.')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'ces')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces')"/>
											</xsl:when>
											<xsl:when test="starts-with($doi , 'CES')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES')"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates
											select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text>-t</xsl:text>
								<xsl:choose>
									<xsl:when test="$fid > 9">
										<xsl:text/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>0</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select="$fid"/>
								<xsl:text>.tif</xsl:text>
								<xsl:text disable-output-escaping="yes">"&gt;&lt;/graphic&gt;</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"/>
							<xsl:otherwise>
								<xsl:if test="jnl:tfootnote">
									<xsl:element name="table-wrap-foot">
										<xsl:apply-templates select="jnl:tfootnote"/>
									</xsl:element>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tbl:table">
		<xsl:element name="caption">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
					<xsl:for-each select="tbl:title">
						<xsl:choose>
							<xsl:when test="preceding-sibling::tbl:title">
								<xsl:element name="p">
									<xsl:apply-templates/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when
										test="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
										<xsl:element name="title">
											<xsl:for-each
												select="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
												<xsl:choose>
												<xsl:when
												test="text()[1] and contains(text()[1]/.,  'Table ')">
												<xsl:variable name="first">
												<xsl:value-of
												select="substring-after(text()[1]/.,'Table ')"/>
												</xsl:variable>
												<xsl:variable name="second">
												<xsl:value-of select="substring-after($first,' ')"
												/>
												</xsl:variable>
												<xsl:value-of select="$second"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="text()[1] and contains(text()[1]/.,  'TABLE ')">
												<xsl:variable name="first">
												<xsl:value-of
												select="substring-after(text()[1]/.,'TABLE ')"/>
												</xsl:variable>
												<xsl:variable name="second">
												<xsl:value-of select="substring-after($first,' ')"
												/>
												</xsl:variable>
												<xsl:value-of select="$second"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="text()[1] and contains(text()[1]/.,  'table ')">
												<xsl:variable name="first">
												<xsl:value-of
												select="substring-after(text()[1]/.,'table ')"/>
												</xsl:variable>
												<xsl:variable name="second">
												<xsl:value-of select="substring-after($first,' ')"
												/>
												</xsl:variable>
												<xsl:value-of select="$second"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</xsl:element>
										<xsl:choose>
											<xsl:when test="node()[position() &gt; 1]">
												<xsl:element name="p">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
												<xsl:value-of
												select="substring-after(node()[position() = 2]/. , ' ')"/>
												<xsl:apply-templates
												select="node()[position() &gt; 2]"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates
												select="node()[position() &gt; 1]"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:when test="text()[1] and contains(text()[1]/.,  'Table ')">
										<xsl:variable name="first">
											<xsl:value-of
												select="substring-after(text()[1]/.,'Table ')"/>
										</xsl:variable>
										<xsl:variable name="second">
											<xsl:value-of select="substring-after($first,' ')"/>
										</xsl:variable>
										<xsl:element name="title">
											<xsl:value-of select="$second"/>
											<xsl:apply-templates select="node()[position() > 1]"/>
										</xsl:element>
									</xsl:when>
									<xsl:when test="text()[1] and contains(text()[1]/.,  'TABLE ')">
										<xsl:variable name="first">
											<xsl:value-of
												select="substring-after(text()[1]/.,'TABLE ')"/>
										</xsl:variable>
										<xsl:variable name="second">
											<xsl:value-of select="substring-after($first,' ')"/>
										</xsl:variable>
										<xsl:element name="title">
											<xsl:value-of select="$second"/>
											<xsl:apply-templates select="node()[position() > 1]"/>
										</xsl:element>
									</xsl:when>
									<xsl:when test="text()[1] and contains(text()[1]/.,  'table ')">
										<xsl:variable name="first">
											<xsl:value-of
												select="substring-after(text()[1]/.,'table ')"/>
										</xsl:variable>
										<xsl:variable name="second">
											<xsl:value-of select="substring-after($first,' ')"/>
										</xsl:variable>
										<xsl:element name="title">
											<xsl:value-of select="$second"/>
											<xsl:apply-templates select="node()[position() > 1]"/>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:element name="title">
											<xsl:apply-templates/>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="title">
						<xsl:choose>
							<xsl:when test="parent::jnl:tbl/@num">
								<xsl:apply-templates select="tbl:title" mode="firstT"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="tbl:title/node()"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:apply-templates select="tbl:table"/>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"/>
			<xsl:otherwise>
				<xsl:apply-templates select="tbl:tgroup"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tbl:tgroup">
		<xsl:element name="table">
			<xsl:element name="colgroup">
				<xsl:apply-templates select="tbl:colspec"/>
			</xsl:element>
			<xsl:apply-templates select="tbl:thead"/>
			<xsl:apply-templates select="tbl:tbody"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tbl:colspec">
		<xsl:element name="col">
			<xsl:attribute name="align">

				<xsl:choose>
					<xsl:when test="preceding-sibling::tbl:colspec">
						<xsl:text>center</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>left</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tbl:thead">
		<xsl:element name="thead">
			<xsl:apply-templates select="tbl:row"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:tfootnote">
		<xsl:element name="fn">
			<xsl:attribute name="id">
				<xsl:text>nt</xsl:text>
				<xsl:value-of select="substring-after(@id,'tfootnote') + 100"/>
			</xsl:attribute>
			<xsl:if test="@num">
				<xsl:element name="label">
					<xsl:apply-templates select="@num"/>
				</xsl:element>
			</xsl:if>
			<xsl:element name="p">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tbl:tbody">
		<xsl:element name="tbody">
			<xsl:apply-templates select="tbl:row"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tbl:row">
		<xsl:element name="tr">
			<xsl:apply-templates select="tbl:entry"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tbl:entry">
		<xsl:element name="td">
			<xsl:if test="@morerows">
				<xsl:attribute name="rowspan">
					<xsl:value-of select="@morerows + 1"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@nameend and @namest">
				<xsl:variable name="namee">
					<xsl:value-of select="substring-after(@nameend,'col')"/>
				</xsl:variable>
				<xsl:variable name="names">
					<xsl:value-of select="substring-after(@namest,'col')"/>
				</xsl:variable>
				<xsl:attribute name="colspan">
					<xsl:value-of select="$namee + 1 - $names"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@align">
				<xsl:attribute name="align">
					<xsl:value-of select="@align"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="node()">
					<xsl:text/>
					<xsl:apply-templates/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:fig">
		<xsl:variable name="fids">
			<xsl:value-of select="@id"/>
		</xsl:variable>
		<xsl:variable name="fidused">
			<xsl:for-each select="//jnl:figref">
				<xsl:choose>
					<xsl:when test="@rids and @rids = $fids">
						<xsl:choose>
							<xsl:when test="ancestor::jnl:footnote"/>
							<xsl:when test="ancestor::jnl:tbl"/>
							<xsl:when test="ancestor::jnl:fig"/>
							<xsl:when test="ancestor::jnl:p">
								<xsl:text>1</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="$fidused = ''">
			<xsl:variable name="ftype">
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
						<xsl:apply-templates select="self::node()" mode="Mtype"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$ftype = ''">
					<xsl:variable name="fid">
						<xsl:value-of select="substring-after(@id,'fig')"/>
					</xsl:variable>
					<xsl:variable name="gid">
						<xsl:value-of select="jnl:graphic/@id"/>
					</xsl:variable>
					<xsl:element name="fig">
						<xsl:attribute name="id">
							<xsl:text>f</xsl:text>
							<xsl:choose>
								<xsl:when test="$fid > 9">
									<xsl:text/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>0</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:value-of select="$fid"/>
						</xsl:attribute>
						<xsl:attribute name="position">
							<xsl:text>float</xsl:text>
						</xsl:attribute>
						<xsl:if test="@num and @num !=''">
							<xsl:element name="label">
								<xsl:choose>
									<xsl:when test="$FigReduce = 1">
										<xsl:text>Fig. </xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Figure </xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:apply-templates select="@num"/>
								<xsl:text>.</xsl:text>
							</xsl:element>
						</xsl:if>
						<xsl:element name="caption">
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
									<xsl:element name="title">
										<xsl:apply-templates select="jnl:caption[1]"/>
									</xsl:element>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
									<xsl:for-each select="jnl:caption[position() = 1]">
										<xsl:choose>
											<xsl:when
												test="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
												<xsl:variable name="contents">
												<xsl:for-each select="node()[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												</xsl:variable>
												<xsl:choose>
												<xsl:when test="$contents != ''">
												<xsl:for-each select="node()[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title">
												<xsl:apply-templates/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												<xsl:choose>
												<xsl:when
												test="node()[position() = 2 and self::text()[. = ' ']] and node()[position() &gt; 2]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="p">
												<xsl:value-of
												select="substring-after(node()[position() = 2]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when test="node()[position() = 2]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[. = ' ']] and node()[position() = 3 and self::jnl:emph[@type = 'bold']]">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 3]/node()"/>
												</xsl:element>
												<xsl:choose>
												<xsl:when
												test="node()[position() = 4 and self::text()[. = ' ']] and node()[position() &gt; 4]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 4]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 4 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="p">
												<xsl:value-of
												select="substring-after(node()[position() = 4]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 4]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when test="node()[position() = 4]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 3]"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="title">
												<xsl:value-of
												select="substring-after(node()[position() = 2]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
											</xsl:when>
											<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
											</xsl:when>
											<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
											</xsl:when>
											<xsl:otherwise>
												<xsl:element name="title">
												<xsl:apply-templates/>
												</xsl:element>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
											<xsl:element name="p">
												<xsl:apply-templates select="jnl:caption[1]"/>
											</xsl:element>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
											<xsl:apply-templates select="jnl:caption[1]"/>
										</xsl:when>
									</xsl:choose>


								</xsl:otherwise>
							</xsl:choose>
							<xsl:apply-templates select="jnl:caption[position() > 1]"/>
						</xsl:element>
						<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:variable name="doi">
									<xsl:apply-templates
										select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
								</xsl:variable>
								<xsl:text>bio.</xsl:text>
								<xsl:choose>
									<xsl:when test="starts-with($doi , 'bio.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bio.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIO.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIO.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'bio')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bio')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIO')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIO')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'bin.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bin.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIN.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIN.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'bin')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bin')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIN')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIN')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="yes" select="$doi"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:variable name="doi">
									<xsl:apply-templates
										select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
								</xsl:variable>
								<xsl:text>bio.</xsl:text>
								<xsl:choose>
									<xsl:when test="starts-with($doi , 'bio.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bio.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIO.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIO.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'bio')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bio')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIO')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIO')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'bin.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bin.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIN.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIN.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'bin')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'bin')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'BIN')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'BIN')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="yes" select="$doi"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
								<xsl:variable name="doi">
									<xsl:apply-templates
										select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
								</xsl:variable>
								<xsl:text>jcs.</xsl:text>
								<xsl:choose>
									<xsl:when test="starts-with($doi , 'ces.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'ces.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'CES.')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'CES.')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'ces')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'ces')"/>
									</xsl:when>
									<xsl:when test="starts-with($doi , 'CES')">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($doi, 'CES')"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="yes" select="$doi"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="//jnl:unit-info[1]/jnl:c-tracker-id/."
								/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>-f</xsl:text>
						<xsl:choose>
							<xsl:when test="$fid > 9">
								<xsl:text/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>0</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="$fid"/>
						<xsl:text>.tif</xsl:text>
						<xsl:text disable-output-escaping="yes">"&gt;&lt;/graphic&gt;</xsl:text>
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template match="jnl:caption[parent::jnl:fig]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::jnl:caption">
				<xsl:element name="p">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:when
				test="node()[position() = 1 and self::jnl:emph[@type = 'bold']] and node()[position() = 2 and self::processing-instruction('ENTCHAR')[. = 'emsp']]">
				<xsl:apply-templates select="node()[position() > 2]"/>
			</xsl:when>
			<xsl:when test="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
				<xsl:variable name="contents">
					<xsl:for-each select="node()[position() = 1]">
						<xsl:choose>
							<xsl:when
								test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
								<xsl:apply-templates select="node()[position() = 1]"
									mode="removefig"/>
								<xsl:apply-templates select="node()[position() > 1]"/>
							</xsl:when>
							<xsl:when
								test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
								<xsl:apply-templates select="node()[position() = 1]"
									mode="removefig"/>
								<xsl:apply-templates select="node()[position() > 1]"/>
							</xsl:when>
							<xsl:when
								test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
								<xsl:apply-templates select="node()[position() = 1]"
									mode="removefig"/>
								<xsl:apply-templates select="node()[position() > 1]"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$contents != ''">
						<xsl:for-each select="node()[position() = 1]">
							<xsl:choose>
								<xsl:when
									test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
											<xsl:apply-templates select="node()[position() = 1]"
												mode="removefig"/>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
											<xsl:element name="title">
												<xsl:apply-templates select="node()[position() = 1]"
												mode="removefig"/>
											</xsl:element>
										</xsl:when>
									</xsl:choose>
									<xsl:apply-templates select="node()[position() > 1]"/>
								</xsl:when>
								<xsl:when
									test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
											<xsl:apply-templates select="node()[position() = 1]"
												mode="removefig"/>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
											<xsl:element name="title">
												<xsl:apply-templates select="node()[position() = 1]"
												mode="removefig"/>
											</xsl:element>
										</xsl:when>
									</xsl:choose>

									<xsl:apply-templates select="node()[position() > 1]"/>
								</xsl:when>
								<xsl:when
									test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
											<xsl:apply-templates select="node()[position() = 1]"
												mode="removefig"/>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
											<xsl:element name="title">
												<xsl:apply-templates select="node()[position() = 1]"
												mode="removefig"/>
											</xsl:element>
										</xsl:when>
									</xsl:choose>
									<xsl:apply-templates select="node()[position() > 1]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:apply-templates select="node()[position() > 1]"/>
					</xsl:when>
					<xsl:when test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
						<xsl:value-of select="substring-after(node()[position() = 2]/. ,' ')"/>
						<xsl:apply-templates select="node()[position() > 2]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="node()[position() > 1]"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when
				test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
						<xsl:apply-templates select="node()[position() = 1]" mode="removefig"/>
					</xsl:when>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
						<xsl:element name="title">
							<xsl:apply-templates select="node()[position() = 1]" mode="removefig"/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>

				<xsl:apply-templates select="node()[position() > 1]"/>
			</xsl:when>
			<xsl:when
				test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
						<xsl:apply-templates select="node()[position() = 1]" mode="removefig"/>
					</xsl:when>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
						<xsl:element name="title">
							<xsl:apply-templates select="node()[position() = 1]" mode="removefig"/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates select="node()[position() > 1]"/>
			</xsl:when>
			<xsl:when
				test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
						<xsl:apply-templates select="node()[position() = 1]" mode="removefig"/>
					</xsl:when>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
						<xsl:element name="title">
							<xsl:apply-templates select="node()[position() = 1]" mode="removefig"/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates select="node()[position() > 1]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:caption[parent::jnl:fx-graphic]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::jnl:caption">
				<xsl:element name="p">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="title">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tbl:title">
		<xsl:choose>
			<xsl:when
				test="node()[position() = 1 and self::jnl:emph[@type = 'bold']] and node()[position() = 2 and self::processing-instruction('ENTCHAR')[. = 'emsp']]">
				<xsl:apply-templates select="node()[position() > 2]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tbl:title" mode="firstT">

		<xsl:choose>
			<xsl:when test="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
				<xsl:for-each select="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
					<xsl:choose>
						<xsl:when test="text()[1] and contains(text()[1]/.,  'Table ')">
							<xsl:variable name="first">
								<xsl:value-of select="substring-after(text()[1]/.,'Table ')"/>
							</xsl:variable>
							<xsl:variable name="second">
								<xsl:value-of select="substring-after($first,' ')"/>
							</xsl:variable>
							<xsl:value-of select="$second"/>
							<xsl:apply-templates select="node()[position() > 1]"/>
						</xsl:when>
						<xsl:when test="text()[1] and contains(text()[1]/.,  'TABLE ')">
							<xsl:variable name="first">
								<xsl:value-of select="substring-after(text()[1]/.,'TABLE ')"/>
							</xsl:variable>
							<xsl:variable name="second">
								<xsl:value-of select="substring-after($first,' ')"/>
							</xsl:variable>
							<xsl:value-of select="$second"/>
							<xsl:apply-templates select="node()[position() > 1]"/>
						</xsl:when>
						<xsl:when test="text()[1] and contains(text()[1]/.,  'table ')">
							<xsl:variable name="first">
								<xsl:value-of select="substring-after(text()[1]/.,'table ')"/>
							</xsl:variable>
							<xsl:variable name="second">
								<xsl:value-of select="substring-after($first,' ')"/>
							</xsl:variable>
							<xsl:value-of select="$second"/>
							<xsl:apply-templates select="node()[position() > 1]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:apply-templates select="node()[position() &gt; 1]"/>
			</xsl:when>
			<xsl:when test="text()[1] and contains(text()[1]/.,  'Table ')">
				<xsl:variable name="first">
					<xsl:value-of select="substring-after(text()[1]/.,'Table ')"/>
				</xsl:variable>
				<xsl:variable name="second">
					<xsl:value-of select="substring-after($first,' ')"/>
				</xsl:variable>
				<xsl:value-of select="$second"/>
				<xsl:apply-templates select="node()[position() > 1]"/>
			</xsl:when>
			<xsl:when test="text()[1] and contains(text()[1]/.,  'TABLE ')">
				<xsl:variable name="first">
					<xsl:value-of select="substring-after(text()[1]/.,'TABLE ')"/>
				</xsl:variable>
				<xsl:variable name="second">
					<xsl:value-of select="substring-after($first,' ')"/>
				</xsl:variable>
				<xsl:value-of select="$second"/>
				<xsl:apply-templates select="node()[position() > 1]"/>
			</xsl:when>
			<xsl:when test="text()[1] and contains(text()[1]/.,  'table ')">
				<xsl:variable name="first">
					<xsl:value-of select="substring-after(text()[1]/.,'table ')"/>
				</xsl:variable>
				<xsl:variable name="second">
					<xsl:value-of select="substring-after($first,' ')"/>
				</xsl:variable>
				<xsl:value-of select="$second"/>
				<xsl:apply-templates select="node()[position() > 1]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="endtags">
		<xsl:if test="not(parent::jnl:caption)">
			<xsl:apply-templates select="parent::node()" mode="endtags"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="self::jnl:emph">
				<xsl:choose>
					<xsl:when test="@type='bold'">
						<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='underline'">
						<xsl:text disable-output-escaping="yes">&lt;/underline&gt;</xsl:text>
					</xsl:when>
					<xsl:when
						test="@type='italic' and parent::jnl:p[@type = 'genus-normal-para' or @type = 'genus-small-para']">
						<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='italic' and parent::jnl:p[@type = 'genus-centre']">
						<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='italic'">
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='bold-italic'">
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;&lt;/bold&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='bold_italic'">
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;&lt;/bold&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='smallcaps' and parent::jnl:title"> </xsl:when>
					<xsl:when test="@type='smallcaps'">
						<xsl:text disable-output-escaping="yes">&lt;/sc&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='sup'">
						<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='inf'">
						<xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise> </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise> </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="starttags">
		<xsl:if test="not(parent::jnl:caption)">
			<xsl:apply-templates select="parent::node()" mode="starttags"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="self::jnl:emph">
				<xsl:choose>
					<xsl:when test="@type='bold'">
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='underline'">
						<xsl:text disable-output-escaping="yes">&lt;underline&gt;</xsl:text>
					</xsl:when>
					<xsl:when
						test="@type='italic' and parent::jnl:p[@type = 'genus-normal-para' or @type = 'genus-small-para']">
						<xsl:text disable-output-escaping="yes">&lt;named-content&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='italic' and parent::jnl:p[@type = 'genus-centre']">
						<xsl:text disable-output-escaping="yes">&lt;named-content&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='italic'">
						<xsl:text disable-output-escaping="yes">&lt;italic&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='bold-italic'">
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;&lt;italic&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='bold_italic'">
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;&lt;italic&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='smallcaps' and parent::jnl:title"> </xsl:when>
					<xsl:when test="@type='smallcaps'">
						<xsl:text disable-output-escaping="yes">&lt;sc&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='sup'">
						<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="@type='inf'">
						<xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise> </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise> </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="processing-instruction('FIGTITLE')">
		<xsl:variable name="content" select="."/>
		<xsl:if test="not(parent::jnl:caption)">
			<xsl:apply-templates select="parent::node()" mode="endtags"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$CustCode = 'eego'">
				<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="//jnl:jnl-info/jnl:abrv-jnl-tl[. = 'BAM'  or . = 'bam']">
				<xsl:if test="following-sibling::node()">
					<xsl:text> </xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$content = '1'">
				<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="not(parent::jnl:caption)">
			<xsl:apply-templates select="parent::node()" mode="starttags"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="processing-instruction('figtitle')">
		<xsl:variable name="content" select="."/>
		<xsl:if test="not(parent::jnl:caption)">
			<xsl:apply-templates select="parent::node()" mode="endtags"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$content = '1'">
				<xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="not(parent::jnl:caption)">
			<xsl:apply-templates select="parent::node()" mode="starttags"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="justname"/>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="justfname"/>
	<xsl:template match="jnl:emph" mode="justname">
		<xsl:apply-templates mode="justname"/>
	</xsl:template>
	<xsl:template match="jnl:emph" mode="justfname">
		<xsl:apply-templates mode="justfname"/>
	</xsl:template>
	<xsl:template match="text()" mode="justname">
		<xsl:variable name="content1" select="."/>
		<xsl:choose>
			<xsl:when test="contains($content1, ' ')">
				<xsl:call-template name="removespace">
					<xsl:with-param name="Chars" select="$content1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$content1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()" mode="justfname">
		<xsl:variable name="content1" select="."/>
		<xsl:value-of select="$content1"/>
	</xsl:template>
	<xsl:template name="removespace">
		<xsl:param name="Chars"/>
		<xsl:choose>
			<xsl:when test="$Chars = ' '"> </xsl:when>
			<xsl:when test="$Chars != '' and contains($Chars, ' ')">
				<xsl:variable name="first">
					<xsl:value-of select="substring-before($Chars,' ')"/>
				</xsl:variable>
				<xsl:variable name="rest">
					<xsl:value-of select="substring-after($Chars,' ')"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$first != ''">
						<xsl:value-of select="$first"/>
						<xsl:if test="$rest != ''">
							<xsl:call-template name="removespace">
								<xsl:with-param name="Chars" select="$rest"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:when test="$rest != ''">
						<xsl:call-template name="removespace">
							<xsl:with-param name="Chars" select="$rest"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$Chars != ''">
				<xsl:value-of select="$Chars"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')">
		<xsl:variable name="content1" select="."/>
		<xsl:variable name="content">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'apos']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="ancestor::jnl:surname[ancestor::jnl:author-grp] and preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:when
					test="ancestor::jnl:surname[ancestor::jnl:author-grp] and preceding-sibling::node()[position() = 1 and self::text()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$content = 'sol' and ancestor::jnl:doi">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ndash' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>

			<xsl:when test="$content = 'lpar' and ancestor::jnl:cit">
				<xsl:text disable-output-escaping="yes">&amp;lpar;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:cit">
				<xsl:text disable-output-escaping="yes">&amp;rpar;</xsl:text>
			</xsl:when>

			<xsl:when test="$content = 'colon' and ancestor::jnl:cit">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi' and ancestor::jnl:cit">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:cit-tl">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:pub-tl">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:pub-name">
				<xsl:text>-</xsl:text>
			</xsl:when>


			<xsl:when test="$content = 'hyphen' and ancestor::jnl:cit">
				<xsl:text disable-output-escaping="yes">&amp;ndash;</xsl:text>
			</xsl:when>


			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:url">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:email">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:url">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:email">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:url">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:email">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:url">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:email">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:url">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:email">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:url">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:email">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:url">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:email">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:url">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:email">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:url">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:email">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:url">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:email">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:url">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:email">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:url">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:email">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:url">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:email">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:url">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:email">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:url">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:email">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:url">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:email">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:url">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:email">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:url">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:email">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:url">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:email">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:url">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#xa2' or $content = '#XA2'">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ensp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'thinsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text disable-output-escaping="yes">/</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text disable-output-escaping="yes">?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
				<xsl:value-of select="$content"/>
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="notemph">
		<xsl:variable name="content1" select="."/>
		<xsl:variable name="content">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:when test="preceding-sibling::node()[position() = 1 and self::text()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:url">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:email">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:url">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:email">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:url">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:email">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:url">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:email">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:url">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:email">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:url">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:email">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:url">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:email">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:url">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:email">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:url">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:email">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:url">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:email">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:url">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:email">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:url">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:email">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:url">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:email">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:url">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:email">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:url">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:email">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:url">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:email">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:url">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:email">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:url">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:email">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:url">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:email">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:url">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ndash' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#xa2' or $content = '#XA2'">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ensp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'thinsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text disable-output-escaping="yes">?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
				<xsl:value-of select="$content"/>
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="justcharr">
		<xsl:variable name="content1" select="."/>
		<xsl:variable name="content">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:when test="preceding-sibling::node()[position() = 1 and self::text()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$content = 'hairsp'"/>
			<xsl:when test="$content = 'amp'">
				<xsl:text disable-output-escaping="yes">&amp;amp;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat'">
				<xsl:text disable-output-escaping="yes">@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar'">
				<xsl:text disable-output-escaping="yes">_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text disable-output-escaping="yes">/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text disable-output-escaping="yes">:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt'">
				<xsl:text disable-output-escaping="yes">%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol'">
				<xsl:text disable-output-escaping="yes">\</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num'">
				<xsl:text disable-output-escaping="yes">#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text disable-output-escaping="yes">?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar'">
				<xsl:text disable-output-escaping="yes">$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqu'">
				<xsl:text disable-output-escaping="yes">[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqu'">
				<xsl:text disable-output-escaping="yes">]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus'">
				<xsl:text disable-output-escaping="yes">+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast'">
				<xsl:text disable-output-escaping="yes">*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal'">
				<xsl:text disable-output-escaping="yes">=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals'">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent'">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma'">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period'">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl'">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub'">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub'">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar'">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'"/>
			<xsl:when test="$content = 'khgr'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar'">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:url">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:email">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:url">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:email">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:url">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:email">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:url">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:email">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:url">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:email">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:url">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:email">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:url">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:email">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:url">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:email">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:url">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:email">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:url">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:email">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:url">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:email">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:url">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:email">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:url">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:email">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:url">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:email">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:url">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:email">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:url">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:email">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:url">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:email">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:url">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:email">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:url">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:email">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:url">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="justchar">
		<xsl:variable name="content1" select="."/>
		<xsl:variable name="content">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:when test="preceding-sibling::node()[position() = 1 and self::text()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$content = '#296'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:url">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:email">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:url">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:email">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:url">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:email">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:url">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:email">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:url">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:email">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:url">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:email">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:url">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:email">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:url">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:email">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:url">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:email">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:url">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:email">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:url">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:email">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:url">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:email">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:url">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:email">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:url">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:email">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:url">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:email">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:url">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:email">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:url">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:email">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:url">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:email">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:url">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:email">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:url">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'"> </xsl:when>
			<xsl:when test="$content = 'khgr'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar'">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ndash' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ensp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'thinsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text disable-output-escaping="yes">/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
				<xsl:value-of select="$content"/>
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="instr">
		<xsl:variable name="content1" select="."/>
		<xsl:variable name="content">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:when test="preceding-sibling::node()[position() = 1 and self::text()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$content = '#296'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'khgr'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = '#146' and following-sibling::node()[position() = 1 and self::jnl:citref]">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = '#HELLO' and not(ancestor::jnl:caption[parent::jnl:fig]  and parent::jnl:tabref and parent::jnl:figref)">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'amp'">
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:url">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:email">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:url">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:email">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:url">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:email">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:url">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:email">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:url">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:email">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:url">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:email">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:url">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:email">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:url">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:email">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:url">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:email">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:url">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:email">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:url">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:email">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:url">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:email">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:url">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:email">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:url">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:email">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:url">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:email">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:url">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:email">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:url">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:email">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:url">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:email">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:url">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:email">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:url">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ndash' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ensp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'thinsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text disable-output-escaping="yes">/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text disable-output-escaping="yes">?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
				<xsl:value-of select="$content"/>
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	
	
	
	
	
	
	
	<xsl:template match="jnl:doc">
		<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
		<xsl:text>?xml version="1.0" encoding="UTF-8"?</xsl:text>
		<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		<xsl:call-template name="newline"/>
		<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
		<xsl:text>!DOCTYPE article PUBLIC "-//NLM//DTD Journal Publishing DTD v2.3 20070202//EN" "http://dtd.nlm.nih.gov/publishing/2.3/journalpublishing.dtd"</xsl:text>
		<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
		<xsl:call-template name="newline"/>
		<xsl:text disable-output-escaping="yes">&lt;article article-type="</xsl:text>
		<xsl:value-of select="$TypeCode"/>
		<xsl:text disable-output-escaping="yes">" dtd-version="2.3" </xsl:text>
		<xsl:text disable-output-escaping="yes">xmlns:xlink="http://www.w3.org/1999/xlink" </xsl:text>
		<xsl:text disable-output-escaping="yes">xmlns:mml="http://www.w3.org/1998/Math/MathML"&gt;</xsl:text>
		<xsl:call-template name="newline"/>
		<xsl:choose>
			<xsl:when test="jnl:abstract">
				<xsl:apply-templates select="jnl:abstract" mode="sub-art"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="front">
					<xsl:element name="journal-meta">
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
								<xsl:element name="journal-id">
									<xsl:attribute name="journal-id-type">hwp</xsl:attribute>
									<xsl:text>casereports</xsl:text>
								</xsl:element>
								<!--<xsl:element name="journal-id">
									<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
									<xsl:text>cr</xsl:text>
									</xsl:element>-->
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:element name="journal-id">
									<xsl:attribute name="journal-id-type">hwp</xsl:attribute>
									<xsl:text>biolopen</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'">

								<xsl:element name="journal-id">
									<xsl:attribute name="journal-id-type">hwp</xsl:attribute>
									<xsl:text>ghsp</xsl:text>
								</xsl:element>

							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
								<xsl:element name="journal-id">
									<xsl:attribute name="journal-id-type">hwp</xsl:attribute>
									<xsl:text>joces</xsl:text>
								</xsl:element>
								<xsl:element name="journal-id">
									<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
									<xsl:text>J CELL SCI</xsl:text>
								</xsl:element>

							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="journal-id">
									<xsl:attribute name="journal-id-type">hwp</xsl:attribute>
									<xsl:apply-templates
										select="//jnl:jnl-info/jnl:medline-jnl-tl/."/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:element name="journal-id">
							<xsl:attribute name="journal-id-type">publisher-id</xsl:attribute>
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
									<xsl:text>bio</xsl:text>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
									<xsl:text>jcs</xsl:text>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'">
									<xsl:text>ghsp</xsl:text>
								</xsl:when>

								<xsl:when
									test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
									<xsl:text>bmjcasereports</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$CustCode"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
						<xsl:element name="journal-title">
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
									<xsl:text>Acupuncture in Medicine</xsl:text>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
									<xsl:text>BMJ Case Reports</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="jnl:jnl-info/jnl:jnl-tl"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
								<xsl:element name="abbrev-journal-title">
									<xsl:attribute name="abbrev-type">
										<xsl:text>publisher</xsl:text>
									</xsl:attribute>
									<xsl:text>JCS</xsl:text>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:text>2046-6390</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:text>1477-9137</xsl:text>
								</xsl:element>
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:text>0021-9533</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:text>1757-790X</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BFN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bfn'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:text>1468-2052</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:text>2169-575X</xsl:text>
								</xsl:element>
							</xsl:when>


							<xsl:when test="jnl:jnl-info/jnl:issn[@type = 'online']">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:apply-templates
										select="jnl:jnl-info/jnl:issn[@type='online']/."/>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'"> </xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"> </xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'"> </xsl:when>
							<xsl:when
								test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
								<!--<xsl:text>1752-8526</xsl:text>-->
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BFN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bfn'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:text>1359-2998</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BJR'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bjr'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:text>0007-1285</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:text>0250-832X</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:text>1748-8818</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:apply-templates
										select="jnl:jnl-info/jnl:issn[@type='print']/."/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:element name="publisher">
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
									<xsl:element name="publisher-name">
										<xsl:text>The Company of Biologists</xsl:text>
									</xsl:element>
									<xsl:element name="publisher-loc">
										<xsl:text>Bidder Building, 140 Cowley Road, Cambridge, CB4 0DL, UK</xsl:text>
									</xsl:element>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'">

									<xsl:element name="publisher-name">
										<xsl:text>Global Health: Science and Practice</xsl:text>
									</xsl:element>

								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
									<xsl:element name="publisher-name">
										<xsl:text>The Company of Biologists</xsl:text>
									</xsl:element>
									<xsl:element name="publisher-loc">
										<xsl:text>Bidder Building, 140 Cowley Road, Cambridge, CB4 0DL, UK</xsl:text>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:element>
					</xsl:element>
					<xsl:element name="article-meta">
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'"> </xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:element name="article-id">
									<xsl:attribute name="pub-id-type">publisher-id</xsl:attribute>
									<xsl:variable name="content">
										<xsl:apply-templates
											select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
									</xsl:variable>
									<xsl:text>BIO</xsl:text>
									<xsl:choose>
										<xsl:when test="starts-with($content , 'bio.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'bio.')"/>
										</xsl:when>
										<xsl:when test="starts-with($content , 'BIO.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'BIO.')"/>
										</xsl:when>
										<xsl:when test="starts-with($content , 'bio')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'bio')"/>
										</xsl:when>
										<xsl:when test="starts-with($content , 'BIO')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'BIO')"/>
										</xsl:when>
										<xsl:when test="starts-with($content , 'bin.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'bin.')"/>
										</xsl:when>
										<xsl:when test="starts-with($content , 'BIN.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'BIN.')"/>
										</xsl:when>
										<xsl:when test="starts-with($content , 'bin')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'bin')"/>
										</xsl:when>
										<xsl:when test="starts-with($content , 'BIN')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($content, 'BIN')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of disable-output-escaping="yes"
												select="$content"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="article-id">
									<xsl:attribute name="pub-id-type">publisher-id</xsl:attribute>
									<xsl:apply-templates
										select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:element name="article-id">
							<xsl:attribute name="pub-id-type">doi</xsl:attribute>
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'">
									<xsl:apply-templates select="//jnl:unit-info[1]/jnl:doi/."/>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'">

									<xsl:apply-templates select="//jnl:unit-info[1]/jnl:doi/."/>

								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'">

											<xsl:text>10.9745/</xsl:text>

										</xsl:when>
										<xsl:otherwise>
											<xsl:text>10.1242/</xsl:text>
										</xsl:otherwise>
									</xsl:choose>


									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
											<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
											</xsl:variable>
											<xsl:text>jcs.</xsl:text>
											<xsl:choose>
												<xsl:when test="starts-with($doi , 'ces.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'ces')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>


										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'">

											<xsl:choose>
												<xsl:when test="//jnl:unit-info[1]/jnl:doi/node()">


												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
												</xsl:when>
												<xsl:otherwise>


												<xsl:variable name="doi">

												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>

												</xsl:variable>

												<xsl:text>GHSP-D-</xsl:text>


												<xsl:choose>
												<xsl:when
												test="starts-with($doi , 'ghs.') and string-length($doi) = 11">
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'ghs.'),1,2)"/>
												<xsl:text>-</xsl:text>
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'ghs.'),3,5)"
												/>
												</xsl:when>
												<xsl:when
												test="starts-with($doi , 'GHS.') and string-length($doi) = 11">
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'GHS.'),1,2)"/>
												<xsl:text>-</xsl:text>
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'GHS.'),3,5)"
												/>
												</xsl:when>
												<xsl:when
												test="starts-with($doi , 'ghs') and string-length($doi) = 10">
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'ghs'),1,2)"/>
												<xsl:text>-</xsl:text>
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'ghs'),3,5)"
												/>
												</xsl:when>
												<xsl:when
												test="starts-with($doi , 'GHS') and string-length($doi) = 10">
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'GHS'),1,2)"/>
												<xsl:text>-</xsl:text>
												<xsl:value-of disable-output-escaping="yes"
												select="substring(substring-after($doi, 'GHS'),3,5)"
												/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'ghs.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ghs.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'GHS.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'GHS.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'ghs')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ghs')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'GHS')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'GHS')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>


												</xsl:otherwise>
											</xsl:choose>


										</xsl:when>



										<xsl:otherwise>
											<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>




						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
								<xsl:choose>
									<xsl:when test="//jnl:correction">
										<xsl:choose>
											<xsl:when test="//jnl:unit-info[1]/jnl:rh-recto[node()]">
												<xsl:element name="article-categories">
												<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>heading</xsl:text>
												</xsl:attribute>
												<xsl:for-each
												select="//jnl:unit-info[1]/jnl:rh-recto[node()]">
												<xsl:element name="subject">
												<xsl:variable name="Part1">
												<xsl:apply-templates/>
												</xsl:variable>
												<xsl:variable name="Part2">
												<xsl:value-of
												select="translate($Part1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
												/>
												</xsl:variable>
												<xsl:choose>
												<xsl:when
												test="$Part2 = 'original paper' or $Part2 = 'original papers'">
												<xsl:text>Original papers</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:for-each>
												</xsl:element>
												<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>Article Type</xsl:text>
												</xsl:attribute>
												<xsl:for-each
												select="//jnl:unit-info[1]/jnl:rh-recto[node()]">
												<xsl:element name="subject">
												<xsl:variable name="Part1">
												<xsl:apply-templates/>
												</xsl:variable>
												<xsl:variable name="Part2">
												<xsl:value-of
												select="translate($Part1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
												/>
												</xsl:variable>
												<xsl:choose>
												<xsl:when
												test="$Part2 = 'original paper' or $Part2 = 'original papers'">
												<xsl:text>Original papers</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:for-each>
												</xsl:element>
												</xsl:element>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
								<xsl:choose>
									<xsl:when test="//jnl:unit-info[1]/jnl:rh-recto[node()]">
										<xsl:element name="article-categories">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>heading</xsl:text>
												</xsl:attribute>
												<xsl:for-each
												select="//jnl:unit-info[1]/jnl:rh-recto[node()]">
												<xsl:element name="subject">
												<xsl:variable name="Part1">
												<xsl:apply-templates/>
												</xsl:variable>
												<xsl:variable name="Part2">
												<xsl:value-of
												select="translate($Part1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
												/>
												</xsl:variable>
												<xsl:choose>
												<xsl:when
												test="$Part2 = 'original paper' or $Part2 = 'original papers'">
												<xsl:text>Original papers</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:for-each>
											</xsl:element>
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>Article Type</xsl:text>
												</xsl:attribute>
												<xsl:for-each
												select="//jnl:unit-info[1]/jnl:rh-recto[node()]">
												<xsl:element name="subject">
												<xsl:variable name="Part1">
												<xsl:apply-templates/>
												</xsl:variable>
												<xsl:variable name="Part2">
												<xsl:value-of
												select="translate($Part1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
												/>
												</xsl:variable>
												<xsl:choose>
												<xsl:when
												test="$Part2 = 'original paper' or $Part2 = 'original papers'">
												<xsl:text>Original papers</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:for-each>
											</xsl:element>
										</xsl:element>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="//jnl:topic/node()">
								<xsl:element name="article-categories">
									<xsl:element name="subj-group">
										<xsl:attribute name="subj-group-type">
											<xsl:text>hwp-journal-coll</xsl:text>
										</xsl:attribute>
										<xsl:for-each select="//jnl:topic[node()]">
											<xsl:element name="subject">
												<xsl:apply-templates/>
											</xsl:element>
										</xsl:for-each>
										<xsl:choose>
											<xsl:when
												test="//jnl:article[@logo and contains(@logo , 'edchoice')]">
												<xsl:element name="subject">
												<xsl:text>1507</xsl:text>
												</xsl:element>
											</xsl:when>
										</xsl:choose>
									</xsl:element>
									<!-- hello -->
									<xsl:choose>
										<xsl:when
											test="//jnl:bmj-module-no/. = '5' and //jnl:jnl-info/jnl:abrv-jnl-tl = 'BHT'">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>heading</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when
												test="//jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl/node()">
												<xsl:for-each
												select="//jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl[node()]">
												<xsl:element name="subject">
												<xsl:apply-templates mode="sentence"/>
												</xsl:element>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="subject">
												<xsl:text/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:element>
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>Article type</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when
												test="//jnl:unit-info/jnl:rh-recto[. != '']">
												<xsl:for-each
												select="//jnl:unit-info/jnl:rh-recto[. != '']">
												<xsl:element name="subject">
												<xsl:apply-templates/>
												</xsl:element>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="subject">
												<xsl:text/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:element>
										</xsl:when>
									</xsl:choose>
									<!-- hello2 -->
								</xsl:element>
							</xsl:when>
							<xsl:when test="//jnl:article[@logo and contains(@logo , 'edchoice')]">
								<xsl:element name="article-categories">
									<xsl:element name="subj-group">
										<xsl:attribute name="subj-group-type">
											<xsl:text>hwp-journal-coll</xsl:text>
										</xsl:attribute>
										<xsl:element name="subject">
											<xsl:text>1507</xsl:text>
										</xsl:element>
									</xsl:element>
									<!-- hello -->
									<xsl:choose>
										<xsl:when
											test="//jnl:bmj-module-no/. = '5' and //jnl:jnl-info/jnl:abrv-jnl-tl = 'BHT'">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>heading</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when
												test="//jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl/node()">
												<xsl:for-each
												select="//jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl[node()]">
												<xsl:element name="subject">
												<xsl:apply-templates mode="sentence"/>
												</xsl:element>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="subject">
												<xsl:text/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:element>
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>Article type</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when
												test="//jnl:unit-info/jnl:rh-recto[. != '']">
												<xsl:for-each
												select="//jnl:unit-info/jnl:rh-recto[. != '']">
												<xsl:element name="subject">
												<xsl:apply-templates/>
												</xsl:element>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="subject">
												<xsl:text/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:element>
										</xsl:when>
									</xsl:choose>
									<!-- hello2 -->
								</xsl:element>
							</xsl:when>
						</xsl:choose>
						<!-- Amended 4 here RDC Hello CASE Report Types -->
						<xsl:variable name="SubTypeWord">
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
									<xsl:for-each select="//jnl:topic[node()]">
										<xsl:variable name="contentc">
											<xsl:apply-templates/>
										</xsl:variable>
										<xsl:call-template name="write-typesubjmain">
											<xsl:with-param name="value" select="$contentc"/>
										</xsl:call-template>
									</xsl:for-each>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="SubTypeNum">
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
									<xsl:if test="$SubTypeWord = ''">
										<xsl:choose>
											<xsl:when test="//jnl:unit-info/jnl:rh-recto[. != '']">
												<xsl:variable name="contentc">
												<xsl:apply-templates
												select="//jnl:unit-info/jnl:rh-recto/."/>
												</xsl:variable>
												<xsl:call-template name="write-typesubjnum">
												<xsl:with-param name="value" select="$contentc"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:if>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="SubType">
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
									<xsl:choose>
										<xsl:when test="$SubTypeWord != ''">
											<xsl:value-of select="$SubTypeWord"/>
										</xsl:when>
										<xsl:when test="//jnl:unit-info/jnl:rh-recto[. != '']">
											<xsl:apply-templates
												select="//jnl:unit-info/jnl:rh-recto/."/>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
								<xsl:choose>
									<xsl:when
										test="//jnl:article[@logo and contains(@logo , 'edchoice')] and not(//jnl:topic/node()) and not(//jnl:front/jnl:metadata)">
										<xsl:element name="article-categories">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>hwp-journal-coll</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when test="$SubTypeNum != ''">
												<xsl:element name="subject">
												<xsl:value-of select="$SubTypeNum"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												<xsl:element name="subject">
												<xsl:text>1507</xsl:text>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:when>
									<xsl:when
										test="$SubTypeNum != '' and not(//jnl:topic/node()) and not(//jnl:front/jnl:metadata)">
										<xsl:element name="article-categories">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>hwp-journal-coll</xsl:text>
												</xsl:attribute>
												<xsl:element name="subject">
												<xsl:value-of select="$SubTypeNum"/>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:when>
									<xsl:when test="//jnl:topic/node() and //jnl:front/jnl:metadata">
										<xsl:element name="article-categories">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>hwp-journal-coll</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when test="$SubTypeNum != ''">
												<xsl:element name="subject">
												<xsl:value-of select="$SubTypeNum"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												<xsl:for-each select="//jnl:topic[node()]">
												<xsl:element name="subject">
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
												<xsl:variable name="contents">
												<xsl:apply-templates/>
												</xsl:variable>
												<xsl:variable name="nvalue">
												<xsl:call-template name="write-onlynumbers">
												<xsl:with-param name="value" select="$contents"/>
												</xsl:call-template>
												</xsl:variable>
												<xsl:value-of select="normalize-space($nvalue)"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:for-each>
												<xsl:choose>
												<xsl:when
												test="//jnl:article[@logo and contains(@logo , 'edchoice')]">
												<xsl:element name="subject">
												<xsl:text>1507</xsl:text>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
											</xsl:element>
											<xsl:call-template name="write-typesubj">
												<xsl:with-param name="value" select="$SubType"/>
											</xsl:call-template>
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>search-fields</xsl:text>
												</xsl:attribute>
												<xsl:for-each select="//jnl:front/jnl:metadata">
												<xsl:element name="subject">
												<xsl:attribute name="content-type">
												<xsl:choose>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Ethnicity') or contains(jnl:meta-name/. , 'ETHNICITY') or contains(jnl:meta-name/. , 'ethnicity')">
												<xsl:text>ethnicity</xsl:text>
												</xsl:when>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Region') or contains(jnl:meta-name/. , 'REGION') or contains(jnl:meta-name/. , 'region')">
												<xsl:text>region</xsl:text>
												</xsl:when>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Sex') or contains(jnl:meta-name/. , 'SEX') or contains(jnl:meta-name/. , 'sex')">
												<xsl:text>sex</xsl:text>
												</xsl:when>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Age') or contains(jnl:meta-name/. , 'AGE') or contains(jnl:meta-name/. , 'age')">
												<xsl:text>age</xsl:text>
												</xsl:when>
												</xsl:choose>
												</xsl:attribute>
												<xsl:apply-templates
												select="jnl:meta-value/node()"/>
												</xsl:element>
												</xsl:for-each>
											</xsl:element>
											<xsl:call-template name="write-seriestitle">
												<xsl:with-param name="value" select="$SubType"/>
											</xsl:call-template>
										</xsl:element>
									</xsl:when>
									<xsl:when test="//jnl:front/jnl:metadata">
										<xsl:element name="article-categories">
											<xsl:choose>
												<xsl:when
												test="//jnl:article[@logo and contains(@logo , 'edchoice')]">
												<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>hwp-journal-coll</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when test="$SubTypeNum != ''">
												<xsl:element name="subject">
												<xsl:value-of select="$SubTypeNum"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												<xsl:element name="subject">
												<xsl:text>1507</xsl:text>
												</xsl:element>
												</xsl:element>
												</xsl:when>
												<xsl:when test="$SubTypeNum != ''">
												<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>hwp-journal-coll</xsl:text>
												</xsl:attribute>
												<xsl:element name="subject">
												<xsl:value-of select="$SubTypeNum"/>
												</xsl:element>
												</xsl:element>
												</xsl:when>
											</xsl:choose>
											<xsl:call-template name="write-typesubj">
												<xsl:with-param name="value" select="$SubType"/>
											</xsl:call-template>
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>search-fields</xsl:text>
												</xsl:attribute>
												<xsl:for-each select="//jnl:front/jnl:metadata">
												<xsl:element name="subject">
												<xsl:attribute name="content-type">
												<xsl:choose>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Ethnicity') or contains(jnl:meta-name/. , 'ETHNICITY') or contains(jnl:meta-name/. , 'ethnicity')">
												<xsl:text>ethnicity</xsl:text>
												</xsl:when>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Region') or contains(jnl:meta-name/. , 'REGION') or contains(jnl:meta-name/. , 'region')">
												<xsl:text>region</xsl:text>
												</xsl:when>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Sex') or contains(jnl:meta-name/. , 'SEX') or contains(jnl:meta-name/. , 'sex')">
												<xsl:text>sex</xsl:text>
												</xsl:when>
												<xsl:when
												test="contains(jnl:meta-name/. , 'Age') or contains(jnl:meta-name/. , 'AGE') or contains(jnl:meta-name/. , 'age')">
												<xsl:text>age</xsl:text>
												</xsl:when>
												</xsl:choose>
												</xsl:attribute>
												<xsl:apply-templates
												select="jnl:meta-value/node()"/>
												</xsl:element>
												</xsl:for-each>
											</xsl:element>
											<xsl:call-template name="write-seriestitle">
												<xsl:with-param name="value" select="$SubType"/>
											</xsl:call-template>
										</xsl:element>
									</xsl:when>
									<xsl:when test="//jnl:topic/node()">
										<xsl:element name="article-categories">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>hwp-journal-coll</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when test="$SubTypeNum != ''">
												<xsl:element name="subject">
												<xsl:value-of select="$SubTypeNum"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												<xsl:for-each select="//jnl:topic[node()]">
												<xsl:element name="subject">
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
												<xsl:variable name="contents">
												<xsl:apply-templates/>
												</xsl:variable>
												<xsl:variable name="nvalue">
												<xsl:call-template name="write-onlynumbers">
												<xsl:with-param name="value" select="$contents"/>
												</xsl:call-template>
												</xsl:variable>
												<xsl:value-of select="normalize-space($nvalue)"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:for-each>
												<xsl:choose>
												<xsl:when
												test="//jnl:article[@logo and contains(@logo , 'edchoice')]">
												<xsl:element name="subject">
												<xsl:text>1507</xsl:text>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
											</xsl:element>
											<xsl:call-template name="write-typesubj">
												<xsl:with-param name="value" select="$SubType"/>
											</xsl:call-template>
											<xsl:call-template name="write-seriestitle">
												<xsl:with-param name="value" select="$SubType"/>
											</xsl:call-template>
										</xsl:element>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="//jnl:unit-info/node()[self::jnl:categ]/node()">
								<xsl:element name="article-categories">
									<xsl:element name="subj-group">
										<xsl:attribute name="subj-group-type">
											<xsl:text>heading</xsl:text>
										</xsl:attribute>
										<xsl:element name="subject">
											<xsl:apply-templates
												select="//jnl:unit-info/jnl:categ/node()"
												mode="justchar"/>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:unit-info/jnl:rh-recto[. = 'Reviews' or . = 'Review']">
								<xsl:element name="article-categories">
									<xsl:element name="subj-group">
										<xsl:attribute name="subj-group-type">
											<xsl:text>heading</xsl:text>
										</xsl:attribute>
										<xsl:element name="subject">
											<xsl:text>Review</xsl:text>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:unit-info/jnl:rh-recto[. = 'Editorial' or . = 'Editorials']">
								<xsl:element name="article-categories">
									<xsl:element name="subj-group">
										<xsl:attribute name="subj-group-type">
											<xsl:text>heading</xsl:text>
										</xsl:attribute>
										<xsl:element name="subject">
											<xsl:text>Editorials</xsl:text>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
						
						<xsl:element name="title-group">
							<xsl:element name="article-title">
								<xsl:choose>
									<xsl:when
										test="jnl:article and jnl:article/jnl:front/jnl:title-grp/jnl:title/node()">
										<xsl:apply-templates
											select="jnl:article/jnl:front/jnl:title-grp/jnl:title/node()"
										/>
									</xsl:when>
									<xsl:when
										test="jnl:article-rev and jnl:article-rev/jnl:title-grp/jnl:title/node()">
										<xsl:apply-templates
											select="jnl:article-rev/jnl:title-grp/jnl:title/node()"
										/>
									</xsl:when>
									<xsl:when
										test="//jnl:letter-grp and //jnl:letter/jnl:title/node()">
										<xsl:apply-templates select="//jnl:letter/jnl:title/node()"
										/>
									</xsl:when>
									<xsl:when
										test="//jnl:book-rev and //jnl:book-desc/jnl:title/node()">
										<xsl:apply-templates
											select="//jnl:book-desc/jnl:title/node()"/>
									</xsl:when>
								</xsl:choose>
							</xsl:element>
							<xsl:if
								test="jnl:article and jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl/node()">
								<xsl:if test="not(//jnl:bmj-module-no/. = '6')">
									<xsl:choose>
										<xsl:when
											test="//jnl:bmj-module-no/. = '5' and //jnl:jnl-info/jnl:abrv-jnl-tl = 'BHT'"/>
										<xsl:otherwise>
											<xsl:for-each
												select="jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl">
												<xsl:element name="subtitle">
												<xsl:apply-templates/>
												</xsl:element>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</xsl:if>
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'"/>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'"/>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"/>
								<xsl:when test="//jnl:bmj-module-no/. = '46'">
									<xsl:if test="//jnl:unit-info/jnl:rh-verso">
										<xsl:element name="alt-title">
											<xsl:attribute name="alt-title-type"
												>running-head</xsl:attribute>
											<xsl:apply-templates
												select="//jnl:unit-info/jnl:rh-verso/."/>
										</xsl:element>
									</xsl:if>
								</xsl:when>
								<xsl:when test="//jnl:bmj-module-no/. = '6'">
									<xsl:if test="//jnl:unit-info/jnl:rh-verso">
										<xsl:element name="alt-title">
											<xsl:attribute name="alt-title-type"
												>running-head</xsl:attribute>
											<xsl:apply-templates
												select="//jnl:unit-info/jnl:rh-verso/."/>
										</xsl:element>
									</xsl:if>
								</xsl:when>
								<xsl:when
									test="//jnl:bmj-module-no/. = '5' and //jnl:jnl-info/jnl:abrv-jnl-tl = 'BHT'"/>
								<xsl:when test="//jnl:unit-info/jnl:rh-recto[. != '']">
									<xsl:element name="alt-title">
										<xsl:attribute name="alt-title-type"
											>running-head</xsl:attribute>
										<xsl:apply-templates select="//jnl:unit-info/jnl:rh-recto/."
										/>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:element>
						<xsl:choose>
							<xsl:when test="//jnl:book-rev/jnl:revr">
								<xsl:for-each select="//jnl:book-rev/jnl:revr">
									<xsl:element name="contrib-group">
										<xsl:apply-templates select="self::jnl:revr"/>
										<xsl:if test="jnl:school">
											<xsl:element name="aff">
												<xsl:apply-templates select="jnl:school"/>
											</xsl:element>
										</xsl:if>
									</xsl:element>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="//jnl:author-grp[1]">
								<xsl:element name="contrib-group">
									<xsl:apply-templates
										select="//jnl:author-grp[1]/node()[self::jnl:corresponding-author or self::jnl:author or self::jnl:corporate-author]"
									/>
								</xsl:element>
								<xsl:for-each select="//jnl:author-grp[1]">
									<xsl:for-each select="jnl:aff | jnl:dept-list/jnl:dept">
										<xsl:choose>
											<xsl:when test="self::jnl:dept">
												<xsl:if
												test="node() | jnl:hdr-txt/node() | jnl:org-name/node() | jnl:org-div/node() | jnl:address/node()[not(self::jnl:email)]/node()">
												<xsl:variable name="Count">
												<xsl:value-of select="substring-after(@id, 'aff')"
												/>
												</xsl:variable>
												<xsl:element name="aff">
												<xsl:attribute name="id">
												<xsl:text>aff</xsl:text>
												<xsl:value-of select="$Count"/>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl[. = 'DMF'  or . = 'dmf']">
												<xsl:if test="@num and @num != ''">
												<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
												<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
												</xsl:call-template>
												<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
												<xsl:value-of select="substring-after(@id, 'aff')"/>
												<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:element name="addr-line">
												<xsl:if
												test="parent::jnl:dept-list/jnl:hdr-txt/node()">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:hdr-txt"
												mode="affs"/>
												<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:variable name="content">
												<xsl:apply-templates/>
												</xsl:variable>
												<xsl:choose>
												<xsl:when test="string-length($content) &gt; 5">
												<xsl:variable name="content2"
												select="substring($content, string-length($content) - 4 , 5)"/>
												<xsl:choose>
												<xsl:when test="$content2 = ', and'">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($content, 1, string-length($content) - 5)"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:if
												test="parent::jnl:dept-list/jnl:org-name/node()">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:org-name"
												mode="affs"/>
												</xsl:if>
												</xsl:element>
												<xsl:if
												test="parent::jnl:dept-list/jnl:address/jnl:street/node() | parent::jnl:dept-list/jnl:address/jnl:city/node() | parent::jnl:dept-list/jnl:address/jnl:state/node() | parent::jnl:dept-list/jnl:address/jnl:postcode/node() | parent::jnl:dept-list/jnl:address/jnl:postbox/node()">
												<xsl:element name="addr-line">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:address/jnl:street | parent::jnl:dept-list/jnl:address/jnl:city | parent::jnl:dept-list/jnl:address/jnl:state | parent::jnl:dept-list/jnl:address/jnl:postcode | parent::jnl:dept-list/jnl:address/jnl:postbox"
												mode="affs"/>
												</xsl:element>
												</xsl:if>
												<xsl:if
												test="parent::jnl:dept-list/jnl:address/jnl:country/node()">
												<xsl:element name="country">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:address/jnl:country"
												mode="affs"/>
												</xsl:element>
												</xsl:if>
												<xsl:if
												test="parent::jnl:dept-list/jnl:address/jnl:email/node()">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:address/jnl:email"
												mode="affs"/>
												</xsl:if>
												</xsl:element>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if
												test="jnl:org-name/node() | jnl:org-div/node() | jnl:address/node()">
												<xsl:variable name="Count">
												<xsl:value-of select="substring-after(@id, 'aff')"
												/>
												</xsl:variable>
												<xsl:element name="aff">
												<xsl:attribute name="id">
												<xsl:text>aff</xsl:text>
												<xsl:value-of select="$Count"/>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl[. = 'DMF'  or . = 'dmf']">
												<xsl:if test="@num and @num != ''">
												<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
												<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
												</xsl:call-template>
												<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
												</xsl:if>
												</xsl:when>
												<xsl:when
												test="count(//jnl:author-grp[not(jnl:corresponding-author)]/jnl:aff) &gt; 1 or //jnl:dept-list/jnl:dept">
												<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
												<xsl:value-of select="substring-after(@id, 'aff')"/>
												<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
												</xsl:when>
												</xsl:choose>
												<xsl:choose>
												<xsl:when
												test="jnl:org-name/node() | jnl:org-div/node()">
												<xsl:text disable-output-escaping="yes">&lt;institution&gt;</xsl:text>
												<xsl:apply-templates
												select="jnl:org-name | jnl:org-div" mode="affs"/>
												<xsl:text disable-output-escaping="yes">&lt;/institution&gt;</xsl:text>
												<xsl:if
												test="jnl:address/node()[not(self::jnl:email or self::jnl:country)]">
												<xsl:text disable-output-escaping="yes">, </xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;addr-line&gt;</xsl:text>
												<xsl:apply-templates
												select="jnl:address/node()[not(self::jnl:email or self::jnl:country)]"
												mode="affs"/>
												<xsl:text disable-output-escaping="yes">&lt;/addr-line&gt;</xsl:text>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:country/node()">
												<xsl:text disable-output-escaping="yes">, </xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;country&gt;</xsl:text>
												<xsl:apply-templates
												select="jnl:address/jnl:country" mode="affs"/>
												<xsl:text disable-output-escaping="yes">&lt;/country&gt;</xsl:text>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:email/node()">
												<xsl:text disable-output-escaping="yes">, </xsl:text>
												<xsl:apply-templates
												select="jnl:address/jnl:email" mode="affs"/>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<xsl:if
												test="jnl:address/node()[not(self::jnl:email or self::jnl:country)]">
												<xsl:text disable-output-escaping="yes">&lt;addr-line&gt;</xsl:text>
												<xsl:apply-templates
												select="jnl:address/node()[not(self::jnl:email or self::jnl:country)]"
												mode="affs"/>
												<xsl:text disable-output-escaping="yes">&lt;/addr-line&gt;</xsl:text>
												<xsl:if
												test="jnl:address/jnl:country/node() or jnl:address/jnl:email/node()">
												<xsl:text disable-output-escaping="yes">, </xsl:text>
												</xsl:if>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:country/node()">
												<xsl:text disable-output-escaping="yes">&lt;country&gt;</xsl:text>
												<xsl:apply-templates
												select="jnl:address/jnl:country" mode="affs"/>
												<xsl:text disable-output-escaping="yes">&lt;/country&gt;</xsl:text>
												<xsl:if test="jnl:address/jnl:email/node()">
												<xsl:text disable-output-escaping="yes">, </xsl:text>
												</xsl:if>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:email/node()">
												<xsl:apply-templates
												select="jnl:address/jnl:email" mode="affs"/>
												</xsl:if>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:when>
						</xsl:choose>
						<xsl:if
							test="//jnl:biog[not(@type)]/node()[position() = 1 and self::text() and contains(self::text(), 'Action Editor')]">
							<xsl:element name="contrib-group">
								<xsl:apply-templates
									select="//jnl:biog[not(@type) and node()[position() = 1 and self::text() and contains(self::text(), 'Action Editor')]]"
									mode="contrib"/>
							</xsl:element>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="//jnl:author-grp[jnl:editor]">
								<xsl:element name="contrib-group">
									<xsl:apply-templates
										select="//jnl:author-grp[jnl:editor]/node()[self::jnl:editor or self::jnl:corresponding-author]"
									/>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:author-grp[@type = 'editor']/jnl:author or //jnl:author-grp[@type = 'editor']/jnl:corresponding-author">
								<xsl:element name="contrib-group">
									<xsl:apply-templates
										select="//jnl:author-grp[@type = 'editor']/node()[self::jnl:author or self::jnl:corresponding-author]"
									/>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
						<xsl:for-each
							select="//jnl:author-grp[jnl:editor or @type = 'editor']/jnl:aff | //jnl:author-grp[jnl:editor or @type = 'editor']/jnl:dept-list/jnl:dept">
							<xsl:choose>
								<xsl:when test="self::jnl:dept">
									<xsl:if
										test="jnl:hdr-txt/node() | jnl:org-name/node() | jnl:org-div/node() | jnl:address/node()[not(self::jnl:email)]/node()">
										<xsl:element name="aff">
											<xsl:attribute name="id">
												<xsl:text>edit</xsl:text>
												<xsl:value-of select="substring-after(@id,'e')"/>
											</xsl:attribute>
											<xsl:element name="institution">
												<xsl:if
												test="parent::jnl:dept-list/jnl:hdr-txt/node()">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:hdr-txt"
												mode="affs"/>
												<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:apply-templates mode="affs"/>
												<xsl:if test="parent::jnl:dept-list/jnl:org-name">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:org-name"
												mode="affs"/>
												</xsl:if>
											</xsl:element>
											<xsl:if
												test="parent::jnl:dept-list/jnl:address/jnl:street/node() | parent::jnl:dept-list/jnl:address/jnl:city/node() | parent::jnl:dept-list/jnl:address/jnl:state/node() | parent::jnl:dept-list/jnl:address/jnl:postcode/node() | parent::jnl:dept-list/jnl:address/jnl:postbox/node()">
												<xsl:element name="addr-line">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:address/jnl:street | parent::jnl:dept-list/jnl:address/jnl:city | parent::jnl:dept-list/jnl:address/jnl:state | parent::jnl:dept-list/jnl:address/jnl:postcode | parent::jnl:dept-list/jnl:address/jnl:postbox"
												mode="affs"/>
												</xsl:element>
											</xsl:if>
											<xsl:if
												test="parent::jnl:dept-list/jnl:address/jnl:country/node()">
												<xsl:element name="country">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:address/jnl:country"
												mode="affs"/>
												</xsl:element>
											</xsl:if>
											<xsl:if
												test="parent::jnl:dept-list/jnl:address/jnl:email/node()">
												<xsl:apply-templates
												select="parent::jnl:dept-list/jnl:address/jnl:email"
												mode="affs"/>
											</xsl:if>
										</xsl:element>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if
										test="jnl:org-name/node() | jnl:org-div/node() | jnl:address/node()">
										<xsl:element name="aff">
											<xsl:attribute name="id">
												<xsl:text>edit</xsl:text>
												<xsl:value-of select="substring-after(@id,'e')"/>
											</xsl:attribute>
											<xsl:choose>
												<xsl:when
												test="jnl:org-name/node() | jnl:org-div/node()">
												<xsl:element name="institution">
												<xsl:apply-templates
												select="jnl:org-name | jnl:org-div" mode="affs"/>
												</xsl:element>
												<xsl:if
												test="jnl:address/node()[not(self::jnl:email or self::jnl:country)]">
												<xsl:element name="addr-line">
												<xsl:apply-templates
												select="jnl:address/node()[not(self::jnl:email or self::jnl:country)]"
												mode="affs"/>
												</xsl:element>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:country/node()">
												<xsl:element name="country">
												<xsl:apply-templates
												select="jnl:address/jnl:country" mode="affs"/>
												</xsl:element>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:email/node()">
												<xsl:apply-templates
												select="jnl:address/jnl:email" mode="affs"/>
												</xsl:if>
												</xsl:when>
												<xsl:otherwise>
												<xsl:if
												test="jnl:address/node()[not(self::jnl:email or self::jnl:country)]">
												<xsl:element name="addr-line">
												<xsl:apply-templates
												select="jnl:address/node()[not(self::jnl:email or self::jnl:country)]"
												mode="affs"/>
												</xsl:element>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:country/node()">
												<xsl:element name="country">
												<xsl:apply-templates
												select="jnl:address/jnl:country" mode="affs"/>
												</xsl:element>
												</xsl:if>
												<xsl:if test="jnl:address/jnl:email/node()">
												<xsl:apply-templates
												select="jnl:address/jnl:email" mode="affs"/>
												</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:element>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:if
							test="//jnl:section[@type = 'Contributions' or @type = 'MoreInfo'] | //jnl:front/jnl:note[@type = 'currentaddress'] | //jnl:corresponding-author[$CorresAuthor = '0'] | //jnl:footnote[ancestor::jnl:author-grp and ancestor::jnl:author] | //jnl:aff[$AffType = '1']/jnl:address/jnl:email/node() | //jnl:dept-list[$AffType = '1']/jnl:address/jnl:email/node()">
							<xsl:element name="author-notes">
								<xsl:apply-templates select="//jnl:section[@type = 'Contributions']"
									mode="contrib"/>
								<xsl:apply-templates
									select="//jnl:front/jnl:note[@type = 'currentaddress']"
									mode="current"/>
								<xsl:apply-templates
									select="//jnl:footnote[ancestor::jnl:author-grp]"/>
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl[. = 'BJR'  or . = 'bjr']">
										<xsl:apply-templates select="//jnl:corresponding-author"
											mode="corrname"/>
									</xsl:when>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl[. = 'DMF'  or . = 'dmf']">
										<xsl:apply-templates
											select="//jnl:corresponding-author[parent::jnl:author-grp[not(jnl:author)]]"
											mode="corrname"/>
									</xsl:when>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl[. = 'IMJ'  or . = 'imj']">
										<xsl:apply-templates select="//jnl:corresponding-author"
											mode="corrname"/>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
										<xsl:apply-templates
											select="//jnl:section[@type = 'MoreInfo']" mode="more"/>
									</xsl:when>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'"
									> </xsl:when>
								</xsl:choose>

							</xsl:element>
						</xsl:if>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:element name="pub-date">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:element name="year">
										<xsl:apply-templates
											select="jnl:jnl-info/jnl:date/jnl:year/."/>
									</xsl:element>
								</xsl:element>
								<xsl:element name="pub-date">
									<xsl:attribute name="pub-type">epub-ppub</xsl:attribute>
									<xsl:element name="day">14</xsl:element>
									<xsl:element name="month">7</xsl:element>
									<xsl:element name="year">
										<xsl:apply-templates
											select="jnl:jnl-info/jnl:date/jnl:year/."/>
									</xsl:element>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
								<xsl:element name="pub-date">
									<xsl:attribute name="pub-type">ppub</xsl:attribute>
									<xsl:element name="day">
										<xsl:apply-templates
											select="jnl:jnl-info/jnl:date/jnl:day/."/>
									</xsl:element>
									<xsl:element name="month">
										<xsl:apply-templates
											select="jnl:jnl-info/jnl:date/jnl:month/."/>
									</xsl:element>
									<xsl:element name="year">
										<xsl:apply-templates
											select="jnl:jnl-info/jnl:date/jnl:year/."/>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">

								<xsl:element name="elocation-id">
									<xsl:variable name="doi">
										<xsl:apply-templates
											select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
									</xsl:variable>
									<xsl:text>BIO</xsl:text>
									<xsl:choose>
										<xsl:when test="starts-with($doi , 'bio.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
										</xsl:when>
										<xsl:when test="starts-with($doi , 'BIO.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
										</xsl:when>
										<xsl:when test="starts-with($doi , 'bio')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
										</xsl:when>
										<xsl:when test="starts-with($doi , 'BIO')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
										</xsl:when>
										<xsl:when test="starts-with($doi , 'bin.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
										</xsl:when>
										<xsl:when test="starts-with($doi , 'BIN.')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
										</xsl:when>
										<xsl:when test="starts-with($doi , 'bin')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
										</xsl:when>
										<xsl:when test="starts-with($doi , 'BIN')">
											<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>

								<xsl:choose>
									<xsl:when test="jnl:article">
										<xsl:apply-templates
											select="jnl:article/jnl:front/jnl:history"/>
									</xsl:when>
									<xsl:when test="jnl:correspondence">
										<xsl:apply-templates select="//jnl:letter/jnl:history"/>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">

								<xsl:element name="volume">
									<xsl:value-of select="//jnl:jnl-info/jnl:vol/."/>
								</xsl:element>
								<xsl:element name="issue">
									<xsl:value-of select="//jnl:jnl-info/jnl:issue-no/."/>
								</xsl:element>
								<xsl:element name="fpage">
									<xsl:value-of select="//jnl:unit-info/jnl:fpage/."/>
								</xsl:element>
								<xsl:element name="lpage">
									<xsl:value-of select="//jnl:unit-info/jnl:lpage/."/>
								</xsl:element>

								<xsl:choose>
									<xsl:when test="jnl:article">
										<xsl:apply-templates
											select="jnl:article/jnl:front/jnl:history"/>
									</xsl:when>
									<xsl:when test="jnl:correspondence">
										<xsl:apply-templates select="//jnl:letter/jnl:history"/>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
						</xsl:choose>

						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
								<xsl:element name="permissions">
									<xsl:text disable-output-escaping="yes">&lt;copyright-statement&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;copy; 2012. Published by The Company of Biologists Ltd</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;/copyright-statement&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;copyright-year&gt;</xsl:text>
									<xsl:apply-templates
										select="//jnl:unit-info/jnl:cpyrt/jnl:date/jnl:year/."/>
									<xsl:text disable-output-escaping="yes">&lt;/copyright-year&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;license</xsl:text>
									<xsl:text disable-output-escaping="yes"> license-type="open-access"</xsl:text>
									<xsl:text disable-output-escaping="yes"> xlink:href="http://creativecommons.org/licenses/by-nc-sa/3.0"&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">This is an Open Access article distributed under the terms of the Creative Commons Attribution Non-Commercial Share Alike License &amp;lpar;</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;ext-link ext-link-type="uri" xlink:href="http://creativecommons.org/licenses/by-nc-sa/3.0/"&gt;http://creativecommons.org/licenses/by-nc-sa/3.0/&lt;/ext-link&gt;&amp;rpar;.</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;/license&gt;</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
								<xsl:element name="permissions">
									<xsl:text disable-output-escaping="yes">&lt;copyright-statement&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;copy; 2012. Published by The Company of Biologists Ltd</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;/copyright-statement&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;copyright-year&gt;</xsl:text>
									<xsl:apply-templates
										select="//jnl:unit-info/jnl:cpyrt/jnl:date/jnl:year/."/>
									<xsl:text disable-output-escaping="yes">&lt;/copyright-year&gt;</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text disable-output-escaping="yes">&lt;license</xsl:text>
								<xsl:text disable-output-escaping="yes"> license-type="open-access"</xsl:text>
								<xsl:text disable-output-escaping="yes"> xlink:href="http://creativecommons.org/licenses/by-nc-sa/3.0"&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
								<xsl:text>This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. To view a copy of this license, visit </xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;ext-link ext-link-type="uri" xlink:href="http://creativecommons.org/licenses/by-nc-sa/3.0/"&gt;http://creativecommons.org/licenses/by-nc-sa/3.0/&lt;/ext-link&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
								<xsl:text disable-output-escaping="yes">&lt;/license&gt;</xsl:text>
								<xsl:element name="permissions">
									<xsl:text disable-output-escaping="yes">&lt;copyright-statement&gt;</xsl:text>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
											<xsl:text disable-output-escaping="yes">&amp;copy; </xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:apply-templates
										select="//jnl:unit-info/jnl:cpyrt/jnl:date/jnl:year/."/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates
										select="//jnl:unit-info/jnl:cpyrt/jnl:cpyrt-name/jnl:org-name/node()"/>
									<xsl:text disable-output-escaping="yes">&lt;/copyright-statement&gt;</xsl:text>
									<xsl:text disable-output-escaping="yes">&lt;copyright-year&gt;</xsl:text>
									<xsl:apply-templates
										select="//jnl:unit-info/jnl:cpyrt/jnl:date/jnl:year/."/>
									<xsl:text disable-output-escaping="yes">&lt;/copyright-year&gt;</xsl:text>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="jnl:article">
								<xsl:apply-templates select="jnl:article/jnl:front/jnl:abstract"/>
								<xsl:if
									test="jnl:article and jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl/node()">
									<xsl:if test="//jnl:bmj-module-no/. = '6'">
										<xsl:element name="abstract">
											<xsl:attribute name="abstract-type">
												<xsl:text>teaser</xsl:text>
											</xsl:attribute>
											<xsl:for-each
												select="jnl:article/jnl:front/jnl:title-grp/jnl:sub-tl">
												<xsl:element name="p">
												<xsl:apply-templates/>
												</xsl:element>
											</xsl:for-each>
										</xsl:element>
									</xsl:if>
								</xsl:if>
								<xsl:apply-templates select="jnl:article/jnl:front/jnl:keywd-grp"/>
							</xsl:when>
							<xsl:when test="jnl:book-rev">
								<xsl:apply-templates select="jnl:book-rev/jnl:keywd-grp"/>
							</xsl:when>
							<xsl:when test="jnl:correspondence">
								<xsl:apply-templates
									select="//jnl:letter-grp/jnl:letter/jnl:keywd-grp"/>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="$CustCode = 'plos'">
							<xsl:element name="counts">
								<xsl:variable name="tlpage">
									<xsl:apply-templates select="//jnl:unit-info[1]/jnl:lpage/."/>
								</xsl:variable>
								<xsl:variable name="tfpage">
									<xsl:apply-templates select="//jnl:unit-info[1]/jnl:fpage/."/>
								</xsl:variable>
								<xsl:variable name="pages">
									<xsl:value-of select="number(number($tlpage) - number($tfpage))"
									/>
								</xsl:variable>
								<xsl:text disable-output-escaping="yes">&lt;page-count count="</xsl:text>
								<xsl:choose>
									<xsl:when test="$pages != 'NaN'">
										<xsl:value-of select="$pages + 1"/>
									</xsl:when>
								</xsl:choose>
								<xsl:text disable-output-escaping="yes">"/&gt;</xsl:text>
							</xsl:element>
						</xsl:if>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'XXX' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'XXX'">
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']"/>
									<xsl:when test="//jnl:front/jnl:metadata">
										<xsl:element name="custom-meta-wrap">
											<xsl:for-each select="//jnl:front/jnl:metadata">
												<xsl:element name="custom-meta">
												<xsl:text disable-output-escaping="yes">&lt;meta-name&gt;</xsl:text>
												<xsl:if test="jnl:meta-name/node()">
												<xsl:apply-templates select="jnl:meta-name/node()"
												/>
												</xsl:if>
												<xsl:text disable-output-escaping="yes">&lt;/meta-name&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;meta-value&gt;</xsl:text>
												<xsl:if test="jnl:meta-value/node()">
												<xsl:apply-templates
												select="jnl:meta-value/node()"/>
												</xsl:if>
												<xsl:text disable-output-escaping="yes">&lt;/meta-value&gt;</xsl:text>
												</xsl:element>
											</xsl:for-each>
										</xsl:element>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
				</xsl:element>
				<xsl:choose>
					<xsl:when test="jnl:article-rev">
						<xsl:if test="jnl:article-rev/jnl:intro">
							<xsl:element name="body">
								<xsl:apply-templates select="jnl:article-rev/jnl:intro"/>
							</xsl:element>
						</xsl:if>
						<xsl:apply-templates select="jnl:article-rev/jnl:sub-art-rev-group"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="body">
							<xsl:choose>
								<xsl:when test="jnl:article/jnl:body">
									<xsl:apply-templates select="jnl:article/jnl:body"/>
								</xsl:when>
								<xsl:when test="//jnl:correction/node()">
									<xsl:apply-templates select="//jnl:correction/node()"/>
								</xsl:when>
								<xsl:when test="jnl:article-rev">
									<xsl:if test="jnl:article-rev/jnl:intro">
										<xsl:apply-templates select="jnl:article-rev/jnl:intro"/>
									</xsl:if>
									<xsl:apply-templates
										select="jnl:article-rev/jnl:sub-art-rev-group"/>
								</xsl:when>
								<xsl:when test="//jnl:letter/jnl:section">
									<xsl:apply-templates select="//jnl:letter/jnl:section"/>
								</xsl:when>
								<xsl:when test="//jnl:toc-section">
									<xsl:apply-templates select="//jnl:toc-section"/>
								</xsl:when>
								<xsl:when test="//jnl:book-rev/jnl:rev-bdy/jnl:p">
									<xsl:apply-templates select="//jnl:book-rev/jnl:rev-bdy/jnl:p"/>
								</xsl:when>
								<xsl:when test="jnl:news/jnl:p|jnl:news/jnl:news-section">
									<xsl:apply-templates
										select="jnl:news/jnl:p|jnl:news/jnl:news-section"/>
								</xsl:when>
							</xsl:choose>
						</xsl:element>
						<xsl:choose>
							<xsl:when
								test="//jnl:news/jnl:refs | //jnl:footnote[not(ancestor::jnl:author-grp) and ancestor::jnl:news]">
								<xsl:element name="back">
									<xsl:if test="//jnl:news">
										<xsl:apply-templates select="//jnl:news/jnl:refs"/>
									</xsl:if>
									<xsl:if test="//jnl:footnote[not(ancestor::jnl:author-grp)]">
										<xsl:element name="fn-group">
											<xsl:apply-templates
												select="//jnl:footnote[not(ancestor::jnl:author-grp)]"
												mode="backfoot"/>
										</xsl:element>
									</xsl:if>
								</xsl:element>
							</xsl:when>
							<xsl:when test="$CustCode = 'plos'">
								<xsl:choose>
									<xsl:when
										test="//jnl:front/jnl:note[@type = 'conflict'] | //jnl:grant/node() | //jnl:book-rev/jnl:refs | //jnl:letter/jnl:refs | jnl:article/jnl:front/jnl:abrv-grp | jnl:article//jnl:acks | jnl:article/jnl:back/jnl:refs  | jnl:article/jnl:apps/jnl:app | jnl:article/jnl:back/jnl:apps/jnl:app | //jnl:footnote[not(ancestor::jnl:author-grp)]">
										<xsl:element name="back">
											<xsl:if test="jnl:article//jnl:acks">
												<xsl:element name="ack">
												<xsl:apply-templates
												select="jnl:article//jnl:acks/node()"/>

												</xsl:element>
											</xsl:if>
											<xsl:apply-templates
												select="jnl:article/jnl:back/node()[self::jnl:refs | self::jnl:apps[jnl:app]]"/>
											<xsl:if test="//jnl:letter">
												<xsl:apply-templates select="//jnl:letter/jnl:refs"
												/>
											</xsl:if>
											<xsl:if test="//jnl:book-rev">
												<xsl:apply-templates
												select="//jnl:book-rev/jnl:refs"/>
											</xsl:if>
											<xsl:if test="jnl:article/jnl:apps/jnl:app">
												<xsl:element name="app-group">
												<xsl:apply-templates
												select="jnl:article/jnl:apps/jnl:app"/>

												</xsl:element>
											</xsl:if>

											<xsl:if
												test="jnl:article/jnl:front/jnl:abrv-grp/jnl:abrv-item">
												<xsl:element name="glossary">
												<xsl:element name="title">
												<xsl:text>Abbreviations</xsl:text>
												</xsl:element>
												<xsl:element name="def-list">
												<xsl:apply-templates
												select="jnl:article/jnl:front/jnl:abrv-grp/jnl:abrv-item"
												/>
												</xsl:element>
												</xsl:element>
											</xsl:if>
											<xsl:if
												test="//jnl:front/jnl:note[@type = 'conflict'] | //jnl:grant/node() | //jnl:footnote[not(ancestor::jnl:author-grp)]">
												<xsl:element name="fn-group">
												<xsl:apply-templates
												select="//jnl:footnote[not(ancestor::jnl:author-grp)]"
												mode="backfoot"/>
												<xsl:apply-templates
												select="//jnl:front/jnl:note[@type = 'conflict']"
												mode="conflict"/>
												<xsl:apply-templates select="//jnl:grant[node()]"
												mode="footgrant"/>
												</xsl:element>
											</xsl:if>
										</xsl:element>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when
								test="//jnl:section[@type = 'ConflictingInterests' or @type = 'Funding' or @type = 'PPR' or @type = 'CompetingInterests'] | //jnl:book-rev/jnl:refs | //jnl:letter/jnl:refs | jnl:article/jnl:front/jnl:abrv-grp | jnl:article//jnl:acks | jnl:article/jnl:back/node()[self::jnl:refs | self::jnl:apps]  | jnl:article/jnl:apps/jnl:app | //jnl:footnote[not(ancestor::jnl:author-grp)]">
								<xsl:element name="back">
									<xsl:if test="jnl:article//jnl:acks">
										<xsl:element name="ack">
											<xsl:apply-templates
												select="jnl:article//jnl:acks/node()"/>

										</xsl:element>
									</xsl:if>
									<xsl:apply-templates
										select="jnl:article/jnl:back/node()[self::jnl:refs | self::jnl:apps[jnl:app]]"/>
									<xsl:if test="//jnl:letter">
										<xsl:apply-templates select="//jnl:letter/jnl:refs"/>
									</xsl:if>
									<xsl:if test="//jnl:book-rev">
										<xsl:apply-templates select="//jnl:book-rev/jnl:refs"/>
									</xsl:if>
									<xsl:if test="jnl:article/jnl:apps/jnl:app">
										<xsl:element name="app-group">
											<xsl:apply-templates
												select="jnl:article/jnl:apps/jnl:app"/>

										</xsl:element>
									</xsl:if>

									<xsl:if test="jnl:article/jnl:front/jnl:abrv-grp/jnl:abrv-item">
										<xsl:element name="glossary">
											<xsl:element name="title">
												<xsl:text>Abbreviations</xsl:text>
											</xsl:element>
											<xsl:element name="def-list">
												<xsl:apply-templates
												select="jnl:article/jnl:front/jnl:abrv-grp/jnl:abrv-item"
												/>
											</xsl:element>
										</xsl:element>
									</xsl:if>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
											<xsl:if
												test="//jnl:section[@type = 'ConflictingInterests' or @type = 'Funding' or @type = 'PPR' or @type = 'CompetingInterests' or @type = 'PatientConsent'] | //jnl:footnote[not(ancestor::jnl:author-grp)]">
												<xsl:element name="fn-group">
												<xsl:if
												test="//jnl:section[@type = 'ConflictingInterests' or @type = 'Funding' or @type = 'PPR' or @type = 'CompetingInterests']">
												<xsl:for-each
												select="//jnl:section[@type = 'CompetingInterests']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:attribute name="fn-type">
												<xsl:text>conflict</xsl:text>
												</xsl:attribute>
												<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
												<xsl:text>Competing interests:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/label&gt; </xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'ConflictingInterests']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
												<xsl:text>Competing interests:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/bold&gt; </xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'Funding']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
												<xsl:text>Funding:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/bold&gt; </xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'PPR']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<!--
<xsl:attribute name="fn-type">
<xsl:text>provenance</xsl:text>
</xsl:attribute>
-->
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
												<xsl:text>Provenance and Peer review:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/bold&gt; </xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'PatientConsent']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
												<xsl:text>Patient consent:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/bold&gt; </xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												</xsl:if>
												<xsl:apply-templates
												select="//jnl:footnote[not(ancestor::jnl:author-grp)]"
												mode="backfoot"/>
												</xsl:element>
											</xsl:if>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
											<xsl:if
												test="//jnl:section[@type = 'ConflictingInterests' or @type = 'MoreInfo' or @type = 'Funding' or @type = 'PPR' or @type = 'EthicsApproval'] | //jnl:footnote[not(ancestor::jnl:author-grp)]">
												<xsl:element name="fn-group">
												<xsl:if
												test="//jnl:section[@type = 'ConflictingInterests' or @type = 'Funding' or @type = 'PPR' or @type = 'EthicsApproval']">
												<xsl:for-each
												select="//jnl:section[@type = 'ConflictingInterests']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;Competing interests:&lt;/bold&gt;</xsl:text>
												<xsl:if test="node()">
												<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'Funding']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'PPR']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<!--
<xsl:attribute name="fn-type">
<xsl:text>provenance</xsl:text>
</xsl:attribute>
-->
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
												<xsl:text>Provenance and Peer review:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/bold&gt; </xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'EthicsApproval']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;Ethics approval:&lt;/bold&gt;</xsl:text>
												<xsl:if test="node()">
												<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												</xsl:if>
												<xsl:apply-templates
												select="//jnl:section[@type = 'MoreInfo']"
												mode="more"/>
												<xsl:apply-templates
												select="//jnl:footnote[not(ancestor::jnl:author-grp)]"
												mode="backfoot"/>
												</xsl:element>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if
												test="//jnl:section[@type = 'ConflictingInterests' or @type = 'CompetingInterests' or @type = 'Funding' or @type = 'PPR'] | //jnl:footnote[not(ancestor::jnl:author-grp)]">
												<xsl:element name="fn-group">
												<xsl:if
												test="//jnl:section[@type = 'ConflictingInterests' or @type = 'CompetingInterests' or @type = 'Funding' or @type = 'PPR']">
												<xsl:for-each
												select="//jnl:section[@type = 'CompetingInterests']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:attribute name="fn-type">
												<xsl:text>conflict</xsl:text>
												</xsl:attribute>
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
												<xsl:text>Competing interests</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/label&gt; </xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
												<xsl:text>Competing interests:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/label&gt; </xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'ConflictingInterests']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'Funding']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												<xsl:for-each
												select="//jnl:section[@type = 'PPR']">
												<xsl:for-each select="jnl:p">
												<xsl:element name="fn">
												<!--
<xsl:attribute name="fn-type">
<xsl:text>provenance</xsl:text>
</xsl:attribute>
-->
												<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
												<xsl:text>Provenance and Peer review:</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/bold&gt; </xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
												</xsl:element>
												</xsl:for-each>
												</xsl:for-each>
												</xsl:if>
												<xsl:apply-templates
												select="//jnl:footnote[not(ancestor::jnl:author-grp)]"
												mode="backfoot"/>
												</xsl:element>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"> </xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
											<xsl:if
												test="//jnl:section[@type = 'MoreInfo'] or //jnl:section[@type = 'SupplementaryMaterial']">
												<xsl:element name="fn-group">
												<xsl:apply-templates
												select="//jnl:section[@type = 'MoreInfo']"
												mode="moreCES"/>
												<xsl:apply-templates
												select="//jnl:section[@type = 'SupplementaryMaterial']"
												mode="supplementaryMaterial"/>
												</xsl:element>
											</xsl:if>
										</xsl:when>
									</xsl:choose>


								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="//jnl:body/jnl:section[@type and @type = 'TextBox']">
				<xsl:for-each
					select="//jnl:article/jnl:body/jnl:section[@type and @type = 'TextBox']">
					<xsl:choose>
						<xsl:when test="jnl:section/jnl:title[. = 'Commentary']">
							<xsl:element name="sub-article">
								<xsl:text disable-output-escaping="yes">&lt;front&gt;</xsl:text>
								<xsl:call-template name="newline"/>
								<xsl:apply-templates select="ancestor::jnl:doc" mode="jnlinfo"/>
								<xsl:text disable-output-escaping="yes">&lt;article-meta&gt;</xsl:text>
								<xsl:call-template name="newline"/>
								<xsl:element name="article-id">
									<xsl:attribute name="pub-id-type">publisher-id</xsl:attribute>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
											<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
											</xsl:variable>
											<xsl:text>bio.</xsl:text>
											<xsl:choose>
												<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
											<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
											</xsl:variable>
											<xsl:text>jcs.</xsl:text>
											<xsl:choose>
												<xsl:when test="starts-with($doi , 'ces.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'ces')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="article-id">
									<xsl:attribute name="pub-id-type">doi</xsl:attribute>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
											<xsl:variable name="doitext">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="contains($doitext , '/cr.')">
												<xsl:value-of
												select="substring-before($doitext,'/cr.')"/>
												<xsl:text>/bcr.</xsl:text>
												<xsl:value-of
												select="substring-after($doitext,'/cr.')"/>
												</xsl:when>
												<xsl:when test="contains($doitext , '/bcr.')">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>10.1136/bcr.</xsl:text>
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
											<xsl:variable name="doitext">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="contains($doitext , '/am.')">
												<xsl:value-of
												select="substring-before($doitext,'/am.')"/>
												<xsl:text>/acupmed.</xsl:text>
												<xsl:value-of
												select="substring-after($doitext,'/am.')"/>
												</xsl:when>
												<xsl:when test="contains($doitext , '/aim.')">
												<xsl:value-of
												select="substring-before($doitext,'/aim.')"/>
												<xsl:text>/acupmed.</xsl:text>
												<xsl:value-of
												select="substring-after($doitext,'/aim.')"/>
												</xsl:when>
												<xsl:when test="contains($doitext , '/acupmed.')">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>10.1136/acupmed.</xsl:text>
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:doi/."/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:choose>
									<xsl:when
										test="//jnl:unit-info[1]/node()[self::jnl:categ]/node()">
										<xsl:element name="article-categories">
											<xsl:element name="subj-group">
												<xsl:attribute name="subj-group-type">
												<xsl:text>heading</xsl:text>
												</xsl:attribute>
												<xsl:element name="subject">
												<xsl:choose>
												<xsl:when
												test="//jnl:unit-info[1]/jnl:categ[text()[contains(. , 'article')] and text()[contains(. , 'research')]]">
												<xsl:text>Research Articles</xsl:text>
												</xsl:when>
												<xsl:when
												test="//jnl:unit-info[1]/jnl:categ[text()[contains(. , 'article')] and text()[contains(. , 'research')]]">
												<xsl:text>Research Articles</xsl:text>
												</xsl:when>
												<xsl:when
												test="//jnl:unit-info/jnl:categ/node() = 'EXTENDED REPORT'">
												<xsl:text>Extended report</xsl:text>
												</xsl:when>
												<xsl:when
												test="//jnl:unit-info/jnl:categ/node() = 'Extended Report'">
												<xsl:text>Extended report</xsl:text>
												</xsl:when>
												<xsl:when
												test="//jnl:unit-info[1]/jnl:categ/node() = 'Articles'">
												<xsl:text>Research Articles</xsl:text>
												</xsl:when>
												<xsl:when
												test="//jnl:unit-info[1]/jnl:categ/node() = 'ARTICLES'">
												<xsl:text>Research Articles</xsl:text>
												</xsl:when>
												<xsl:when
												test="//jnl:unit-info[1]/jnl:categ/node() = 'Article'">
												<xsl:text>Research Articles</xsl:text>
												</xsl:when>
												<xsl:when
												test="//jnl:unit-info[1]/jnl:categ/node() = 'ARTICLE'">
												<xsl:text>Research Articles</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:categ/node()"
												mode="sentence"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:when>
								</xsl:choose>
								<xsl:element name="title-group">
									<xsl:element name="article-title">
										<xsl:text>Commentary</xsl:text>
									</xsl:element>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'"/>
										<xsl:when test="//jnl:unit-info[1]/jnl:rh-recto[. != '']">
											<xsl:element name="alt-title">
												<xsl:attribute name="alt-title-type"
												>running-head</xsl:attribute>
												<xsl:apply-templates
												select="//jnl:unit-info/jnl:rh-recto/."/>
											</xsl:element>
										</xsl:when>
									</xsl:choose>
								</xsl:element>
								<xsl:if test="jnl:section[@type = 'Author']">
									<xsl:if
										test="jnl:section[@type= 'Author']/jnl:p[processing-instruction('Author')]">
										<xsl:element name="contrib-group">
											<xsl:for-each
												select="jnl:section[@type= 'Author']/jnl:p[processing-instruction('Author')]">
												<xsl:choose>
												<xsl:when test="text()[following-sibling::node()]">
												<xsl:element name="contrib">
												<xsl:attribute name="contrib-type"
												>author</xsl:attribute>
												<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:variable name="Content" select="."/>
												<xsl:variable name="normal-string"
												select="normalize-space($Content)"/>
												<xsl:choose>
												<xsl:when test="$normal-string != ''">
												<xsl:variable name="first"
												select="normalize-space(substring-before($normal-string,','))"/>
												<xsl:variable name="rest"
												select="normalize-space(substring-after($normal-string,','))"/>
												<xsl:choose>
												<xsl:when test="$first != ''">
												<xsl:element name="contrib">
												<xsl:attribute name="contrib-type"
												>author</xsl:attribute>
												<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
												<xsl:variable name="normal-sstring"
												select="normalize-space($first)"/>
												<xsl:choose>
												<xsl:when test="$normal-sstring != ' '">
												<xsl:variable name="s1first"
												select="normalize-space(substring-before($normal-sstring,' '))"/>
												<xsl:variable name="s1rest"
												select="normalize-space(substring-after($normal-sstring,' '))"/>
												<xsl:if
												test="$s1first = 'Professor' or $s1first = 'professor' or $s1first = 'Prof' or $s1first = 'Dr' or $s1first = 'Doctor'">
												<nomen>
												<xsl:value-of select="normalize-space($s1first)"/>
												</nomen>
												</xsl:if>
												<xsl:variable name="s2first">
												<xsl:choose>
												<xsl:when
												test="$s1first = 'Professor' or $s1first = 'professor' or $s1first = 'Prof' or $s1first = 'Dr' or $s1first = 'Doctor'">
												<xsl:value-of
												select="normalize-space(substring-before($s1rest,' '))"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of
												select="normalize-space(substring-before($normal-sstring,' '))"
												/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:variable>
												<xsl:variable name="s2rest">
												<xsl:choose>
												<xsl:when
												test="$s1first = 'Professor' or $s1first = 'professor' or $s1first = 'Prof' or $s1first = 'Dr' or $s1first = 'Doctor'">
												<xsl:value-of
												select="normalize-space(substring-after($s1rest,' '))"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of
												select="normalize-space(substring-after($normal-sstring,' '))"
												/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:variable>
												<xsl:choose>
												<xsl:when test="$s2first != ''">
												<xsl:variable name="ssecond"
												select="normalize-space(substring-before($s2rest,' '))"/>
												<xsl:variable name="srests"
												select="normalize-space(substring-after($s2rest,' '))"/>
												<xsl:choose>
												<xsl:when test="$ssecond != '' and $srests != ''">
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:value-of select="normalize-space($srests)"/>
												<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
												<xsl:value-of select="normalize-space($s2first)"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="normalize-space($ssecond)"/>
												<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:value-of select="normalize-space($s2rest)"/>
												<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
												<xsl:value-of select="normalize-space($s2first)"/>
												<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:value-of
												select="normalize-space($normal-sstring)"/>
												<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												</xsl:choose>
												<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;degrees&gt;</xsl:text>
												<xsl:value-of select="normalize-space($rest)"/>
												<xsl:text disable-output-escaping="yes">&lt;/degrees&gt;</xsl:text>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="contrib">
												<xsl:attribute name="contrib-type"
												>author</xsl:attribute>
												<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
												<xsl:variable name="normal-sstring"
												select="normalize-space($normal-string)"/>
												<xsl:choose>
												<xsl:when test="$normal-sstring != ' '">
												<xsl:variable name="s1first"
												select="normalize-space(substring-before($normal-sstring,' '))"/>
												<xsl:variable name="s1rest"
												select="normalize-space(substring-after($normal-sstring,' '))"/>
												<xsl:if
												test="$s1first = 'Professor' or $s1first = 'professor' or $s1first = 'Prof' or $s1first = 'Dr' or $s1first = 'Doctor'">
												<nomen>
												<xsl:value-of select="normalize-space($s1first)"/>
												</nomen>
												</xsl:if>
												<xsl:variable name="s2first">
												<xsl:choose>
												<xsl:when
												test="$s1first = 'Professor' or $s1first = 'professor' or $s1first = 'Prof' or $s1first = 'Dr' or $s1first = 'Doctor'">
												<xsl:value-of
												select="normalize-space(substring-before($s1rest,' '))"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of
												select="normalize-space(substring-before($normal-sstring,' '))"
												/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:variable>
												<xsl:variable name="s2rest">
												<xsl:choose>
												<xsl:when
												test="$s1first = 'Professor' or $s1first = 'professor' or $s1first = 'Prof' or $s1first = 'Dr' or $s1first = 'Doctor'">
												<xsl:value-of
												select="normalize-space(substring-after($s1rest,' '))"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of
												select="normalize-space(substring-after($normal-sstring,' '))"
												/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:variable>
												<xsl:choose>
												<xsl:when test="$s2first != ''">
												<xsl:variable name="ssecond"
												select="normalize-space(substring-before($s2rest,' '))"/>
												<xsl:variable name="srests"
												select="normalize-space(substring-after($s2rest,' '))"/>
												<xsl:choose>
												<xsl:when test="$ssecond != '' and $srests != ''">
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:value-of select="normalize-space($srests)"/>
												<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
												<xsl:value-of select="normalize-space($s2first)"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="normalize-space($ssecond)"/>
												<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:value-of select="normalize-space($s2rest)"/>
												<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
												<xsl:value-of select="normalize-space($s2first)"/>
												<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
												<xsl:value-of
												select="normalize-space($normal-sstring)"/>
												<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												</xsl:choose>
												<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise> </xsl:otherwise>
												</xsl:choose>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</xsl:element>
									</xsl:if>
									<xsl:if
										test="jnl:section[@type= 'Author']/jnl:p[processing-instruction('Address')]">
										<xsl:if
											test="jnl:section[@type= 'Author']/jnl:p[processing-instruction('Author')]">
											<xsl:call-template name="newline"/>
										</xsl:if>
										<xsl:for-each
											select="jnl:section[@type= 'Author']/jnl:p[processing-instruction('Address')]">
											<xsl:choose>
												<xsl:when
												test="not(preceding-sibling::node()[position() = 1 and self::jnl:p[processing-instruction('Address')]])">
												<xsl:variable name="c1count"
												select="count(//jnl:author-grp[jnl:author]/jnl:aff)"/>
												<xsl:variable name="c2count"
												select="count(preceding-sibling::jnl:p[processing-instruction('Address') and not(preceding-sibling::node()[position() = 1 and self::jnl:p[processing-instruction('Address')]])])"/>
												<xsl:text disable-output-escaping="yes">&lt;aff id="aff</xsl:text>
												<xsl:value-of select="$c1count + $c2count + 1"/>
												<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
												<xsl:text disable-output-escaping="yes">&lt;institution&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:text disable-output-escaping="yes">&lt;/institution&gt;</xsl:text>
												<xsl:choose>
												<xsl:when
												test="not(following-sibling::node()[position() = 1 and self::jnl:p[processing-instruction('Address')]])">
												<xsl:text disable-output-escaping="yes">&lt;/aff&gt;</xsl:text>
												<xsl:call-template name="newline"/>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="not(preceding-sibling::node()[position() = 2 and self::jnl:p[processing-instruction('Address')]])">
												<xsl:text disable-output-escaping="yes">&lt;addr-line&gt;</xsl:text>
												<xsl:apply-templates/>
												<xsl:choose>
												<xsl:when
												test="not(following-sibling::node()[position() = 1 and self::jnl:p[processing-instruction('Address')]])">
												<xsl:text disable-output-escaping="yes">&lt;/addr-line&gt;&lt;/aff&gt;</xsl:text>
												<xsl:call-template name="newline"/>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text> </xsl:text>
												<xsl:apply-templates/>
												<xsl:choose>
												<xsl:when
												test="not(following-sibling::node()[position() = 1 and self::jnl:p[processing-instruction('Address')]])">
												<xsl:text disable-output-escaping="yes">&lt;/addr-line&gt;&lt;/aff&gt;</xsl:text>
												<xsl:call-template name="newline"/>
												</xsl:when>
												</xsl:choose>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</xsl:if>
								</xsl:if>
								<xsl:apply-templates select="jnl:doc" mode="info"/>
								<xsl:text disable-output-escaping="yes">&lt;/article-meta&gt;</xsl:text>
								<xsl:call-template name="newline"/>
								<xsl:text disable-output-escaping="yes">&lt;/front&gt;</xsl:text>
								<xsl:call-template name="newline"/>
								<xsl:element name="body">
									<!--<xsl:element name="boxed-text">-->
									<xsl:apply-templates
										select="jnl:section[not(@type = 'MoreInfo' or @type = 'Author')]"/>
									<!--</xsl:element>-->
								</xsl:element>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
		<xsl:text disable-output-escaping="yes">&lt;/article&gt;</xsl:text>
	</xsl:template>
	
	<xsl:template match="jnl:intro[parent::jnl:article-rev]">
		<xsl:element name="sec">
			<xsl:attribute name="id">
				<xsl:text>s1</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="sec-type">
				<xsl:text>intro</xsl:text>
			</xsl:attribute>
			<xsl:element name="title"> </xsl:element>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:sub-art-rev-group">
		<xsl:element name="sub-article">
			<xsl:element name="front">
				<xsl:element name="journal-meta">
					<xsl:choose>
						<xsl:when test="$CustCode = 'eego'">
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">publisher</xsl:attribute>
								<xsl:text>Eego</xsl:text>
							</xsl:element>
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">flc</xsl:attribute>
								<xsl:value-of select="$CustCode"/>
							</xsl:element>
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
								<xsl:text>Environmental and Engineering Geophysics</xsl:text>
							</xsl:element>
						</xsl:when>
						<xsl:when test="$CustCode = 'plos'">
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
								<xsl:apply-templates select="//jnl:jnl-info/jnl:medline-jnl-tl/."/>
							</xsl:element>
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">publisher-id</xsl:attribute>
								<xsl:value-of select="$CustCode"/>
							</xsl:element>
						</xsl:when>
						<xsl:when test="$JrnalCode != ''">
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">publisher</xsl:attribute>
								<xsl:value-of select="$CustCode"/>
							</xsl:element>
							<xsl:choose>
								<xsl:when test="$CustCode = 'estu'"/>
								<xsl:when
									test="$CustCode = 'jaba' or $CustCode = 'jeab' or //jnl:jnl-info/jnl:medline-jnl-tl/. != ''">
									<xsl:element name="journal-id">
										<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
										<xsl:choose>
											<xsl:when test="$CustCode = 'jaba'">
												<xsl:text>J Appl Behav Analysis</xsl:text>
											</xsl:when>
											<xsl:when test="$CustCode = 'jeab'">
												<xsl:text>Journal of the Experimental Analysis of Behavior</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:jnl-info/jnl:medline-jnl-tl/."/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="$CustCode = 'estu'"/>
								<xsl:when
									test="$CustCode = 'jaba' or $CustCode = 'jeab' or //jnl:jnl-info/jnl:medline-jnl-tl/. != ''">
									<xsl:element name="journal-id">
										<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
										<xsl:choose>
											<xsl:when test="$CustCode = 'jaba'">
												<xsl:text>J Appl Behav Analysis</xsl:text>
											</xsl:when>
											<xsl:when test="$CustCode = 'jeab'">
												<xsl:text>Journal of the Experimental Analysis of Behavior</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:jnl-info/jnl:medline-jnl-tl/."/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
							<xsl:element name="journal-id">
								<xsl:choose>
									<xsl:when test="$CustCode = 'plos'">
										<xsl:attribute name="journal-id-type"
											>publisher-id</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="journal-id-type"
											>publisher</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select="$CustCode"/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:element name="journal-title">
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
								<xsl:text>Acupuncture in Medicine</xsl:text>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
								<xsl:text>BMJ Case Reports</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="jnl:jnl-info/jnl:jnl-tl"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
					<xsl:choose>
						<xsl:when test="$CustCode = 'plos'">
							<xsl:if test="jnl:jnl-info/jnl:issn[@type = 'online']">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:apply-templates
										select="jnl:jnl-info/jnl:issn[@type='online']/."/>
								</xsl:element>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$CustCode = 'addi'">
							<xsl:if test="jnl:jnl-info/jnl:issn[@type = 'online']">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:apply-templates
										select="jnl:jnl-info/jnl:issn[@type='online']/."/>
								</xsl:element>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$CustCode = 'estu'">
							<xsl:element name="issn">
								<xsl:attribute name="pub-type">ppub</xsl:attribute>
								<xsl:text>1559-2723</xsl:text>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="//jnl:jnl-info/jnl:issn[@type = 'online']">
								<xsl:element name="issn">
									<xsl:attribute name="pub-type">epub</xsl:attribute>
									<xsl:apply-templates
										select="//jnl:jnl-info/jnl:issn[@type='online']/."/>
								</xsl:element>
							</xsl:if>
							<xsl:element name="issn">
								<xsl:attribute name="pub-type">ppub</xsl:attribute>
								<xsl:apply-templates
									select="//jnl:jnl-info/jnl:issn[@type='print']/."/>
							</xsl:element>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:element name="publisher">
						<xsl:choose>
							<xsl:when test="$CustCode = 'eego'">
								<xsl:element name="publisher-name">
									<xsl:text>Environmental and Engineering Geophysics</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when test="$CustCode = 'jaba'">
								<xsl:element name="publisher-name">
									<xsl:text>The Society for the Experimental Analysis of Behavior</xsl:text>
								</xsl:element>
								<xsl:element name="publisher-loc">
									<xsl:text>Bloomington, Indiana</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when test="$CustCode = 'jeab'">
								<xsl:element name="publisher-name">
									<xsl:text>Society for the Experimental Analysis of Behavior, Inc.</xsl:text>
								</xsl:element>
								<xsl:element name="publisher-loc">
									<xsl:text>Bloomington, Indiana</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
								<xsl:element name="publisher-name">
									<xsl:text>BMJ Publishing Group Limited</xsl:text>
								</xsl:element>
								<xsl:element name="publisher-loc">
									<xsl:text>BMA House, Tavistock Square, London, WC1H 9JR</xsl:text>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="publisher-name">
									<xsl:apply-templates select="//jnl:jnl-info/jnl:pub-name/."/>
								</xsl:element>
								<xsl:element name="publisher-loc">
									<xsl:apply-templates select="//jnl:jnl-info/jnl:pub-loc/."/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:element>
				<xsl:element name="article-meta">
					<xsl:element name="article-id">
						<xsl:attribute name="pub-id-type">publisher-id</xsl:attribute>
						<xsl:apply-templates
							select="//jnl:article-rev/jnl:unit-info/jnl:c-tracker-id/."/>
					</xsl:element>
					<xsl:element name="article-id">
						<xsl:attribute name="pub-id-type">doi</xsl:attribute>
						<xsl:apply-templates select="//jnl:article-rev/jnl:unit-info/jnl:doi/."/>
					</xsl:element>
					<xsl:choose>
						<xsl:when test="//jnl:unit-info/node()[self::jnl:categ]/node()">
							<xsl:element name="article-categories">
								<xsl:element name="subj-group">
									<xsl:attribute name="subj-group-type">
										<xsl:text>heading</xsl:text>
									</xsl:attribute>
									<xsl:element name="subject">
										<xsl:variable name="contt">
											<xsl:apply-templates
												select="//jnl:unit-info/jnl:categ/node()"
												mode="justchar"/>
										</xsl:variable>
										<xsl:variable name="contal">
											<xsl:value-of disable-output-escaping="yes"
												select="translate($contt , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
											/>
										</xsl:variable>
										<xsl:choose>
											<xsl:when test="starts-with($contal , '&amp;')">
												<xsl:value-of disable-output-escaping="yes"
												select="$contal"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="translate(substring($contal, 1 , 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
												<xsl:value-of disable-output-escaping="yes"
												select="substring($contal, 2)"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
					<xsl:element name="title-group">
						<xsl:choose>
							<xsl:when test="jnl:title/node()">
								<xsl:element name="article-title">
									<xsl:apply-templates select="jnl:title"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text disable-output-escaping="yes">&lt;article-title/&gt;</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when
								test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'"/>
							<xsl:when test="//jnl:bmj-module-no/. = '46'">
								<xsl:if test="//jnl:unit-info/jnl:rh-verso">
									<xsl:element name="alt-title">
										<xsl:attribute name="alt-title-type"
											>running-head</xsl:attribute>
										<xsl:apply-templates select="//jnl:unit-info/jnl:rh-verso/."
										/>
									</xsl:element>
								</xsl:if>
							</xsl:when>
							<xsl:when test="//jnl:unit-info/jnl:rh-recto[. != '']">
								<xsl:element name="alt-title">
									<xsl:attribute name="alt-title-type"
										>running-head</xsl:attribute>
									<xsl:apply-templates select="//jnl:unit-info/jnl:rh-recto/."/>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:element>
					<xsl:choose>
						<xsl:when test="$CustCode = 'plos'"> </xsl:when>
						<xsl:otherwise>
							<xsl:if test="//jnl:article[@logo and contains(@logo , 'unlocked')]">
								<xsl:element name="pub-date">
									<xsl:attribute name="pub-type">collection</xsl:attribute>
									<xsl:element name="year">
										<xsl:choose>
											<xsl:when
												test="//jnl:misc-date[jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]]/jnl:year">
												<xsl:apply-templates
												select="//jnl:misc-date[jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]]/jnl:year/."
												/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:jnl-info/jnl:date/jnl:year/."/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:element>
							</xsl:if>
							<xsl:element name="pub-date">
								<xsl:attribute name="pub-type">ppub</xsl:attribute>
								<xsl:element name="month">
									<xsl:value-of select="$EEMonth"/>
								</xsl:element>
								<xsl:element name="year">
									<xsl:apply-templates select="//jnl:jnl-info/jnl:date/jnl:year/."
									/>
								</xsl:element>
							</xsl:element>
							<xsl:choose>
								<xsl:when
									test="//jnl:misc-date/jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]">
									<xsl:element name="pub-date">
										<xsl:attribute name="pub-type">epub</xsl:attribute>
										<xsl:apply-templates
											select="//jnl:misc-date[jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]]/jnl:date"
										/>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:element name="volume">
						<xsl:apply-templates select="//jnl:jnl-info/jnl:vol/."/>
					</xsl:element>
					<xsl:element name="issue">
						<xsl:apply-templates select="//jnl:jnl-info/jnl:issue-no/."/>
					</xsl:element>
					<xsl:element name="permissions">
						<xsl:text disable-output-escaping="yes">&lt;copyright-statement&gt;</xsl:text>
						<xsl:choose>
							<xsl:when test="//jnl:article[@logo and contains(@logo , 'unlocked')]">
								<xsl:text disable-output-escaping="yes">&amp;copy; </xsl:text>
								<xsl:choose>
									<xsl:when
										test="//jnl:author-grp[jnl:author or jnl:corporate-author or jnl:editor or jnl:corresponding-author]">
										<xsl:for-each
											select="//jnl:author-grp[jnl:author or jnl:corporate-author or jnl:editor or jnl:corresponding-author]">
											<xsl:choose>
												<xsl:when
												test="preceding::jnl:author-grp[jnl:author or jnl:corporate-author or jnl:editor or jnl:corresponding-author]"/>
												<xsl:otherwise>
												<xsl:for-each select="node()">
												<xsl:choose>
												<xsl:when
												test="preceding-sibling::node()[self::jnl:author or self::jnl:corporate-author or jnl:editor or jnl:corresponding-author]"/>
												<xsl:when
												test="preceding::jnl:author-grp[jnl:author or jnl:corporate-author or jnl:editor or jnl:corresponding-author]"/>
												<xsl:when test="self::jnl:corporate-author">
												<xsl:apply-templates select="jnl:org-name/node()"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates select="jnl:surname/node()"/>
												<xsl:choose>
												<xsl:when
												test="following-sibling::node()[self::jnl:author or self::jnl:corporate-author or jnl:editor]">
												<xsl:text> et al</xsl:text>
												</xsl:when>
												<xsl:when
												test="preceding::jnl:author-grp[jnl:author or jnl:corporate-author or jnl:editor]">
												<xsl:text> et al</xsl:text>
												</xsl:when>
												</xsl:choose>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
										<xsl:text> </xsl:text>
									</xsl:when>
								</xsl:choose>
								<xsl:apply-templates
									select="//jnl:unit-info/jnl:cpyrt/jnl:date/jnl:year/."/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates
									select="//jnl:unit-info/jnl:cpyrt/jnl:date/jnl:year/."/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates
									select="//jnl:unit-info/jnl:cpyrt/jnl:cpyrt-name/jnl:org-name/node()"
								/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text disable-output-escaping="yes">&lt;/copyright-statement&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;copyright-year&gt;</xsl:text>
						<xsl:apply-templates select="//jnl:unit-info/jnl:cpyrt/jnl:date/jnl:year/."/>
						<xsl:text disable-output-escaping="yes">&lt;/copyright-year&gt;</xsl:text>
						<xsl:if test="//jnl:article[@logo and contains(@logo , 'unlocked')]">
							<xsl:text disable-output-escaping="yes">&lt;license</xsl:text>
							<xsl:text disable-output-escaping="yes"> license-type="open-access"</xsl:text>
							<xsl:text disable-output-escaping="yes">  xlink:href="http://creativecommons.org/licenses/by/2.0/"&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
							<xsl:text>This is an open-access article distributed under the terms of the Creative </xsl:text>
							<xsl:text>Commons Attribution Non-commercial License, which permits unrestricted </xsl:text>
							<xsl:text>use, distribution, and reproduction in any medium, provided the original </xsl:text>
							<xsl:text>work is properly cited.</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;/license&gt;</xsl:text>
						</xsl:if>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="body">
				<xsl:apply-templates select="node()[not(self::jnl:title)]"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:sub-art-rev[parent::jnl:sub-art-rev-group]">
		<xsl:variable name="subsect">
			<xsl:choose>
				<xsl:when test="//jnl:article-rev/jnl:intro">
					<xsl:value-of select="count(preceding::jnl:sub-art-rev) + 2"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(preceding::jnl:sub-art-rev) + 1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="sec">
			<xsl:attribute name="id">
				<xsl:text>s</xsl:text>
				<xsl:value-of select="$subsect"/>
			</xsl:attribute>
			<xsl:attribute name="sec-type">
				<xsl:text>cases</xsl:text>
			</xsl:attribute>
			<xsl:element name="title"> </xsl:element>
			<xsl:if test="jnl:art-desc">
				<xsl:element name="ref-list">
					<xsl:apply-templates select="jnl:art-desc"/>
				</xsl:element>
			</xsl:if>
			<xsl:apply-templates select="jnl:section/."/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:item-list">
		<xsl:variable name="list-type">
			<xsl:choose>
				<xsl:when test="@type='Bullet' or @type='bullet' or @type='Dash' or @type='dash'">
					<xsl:value-of select="'bullet'"/>
				</xsl:when>
				<xsl:when test="@type='UAlpha'">
					<xsl:value-of select="'alpha-upper'"/>
				</xsl:when>
				<xsl:when test="@type='UAlphap'">
					<xsl:value-of select="'alpha-upper'"/>
				</xsl:when>
				<xsl:when test="@type='PUAlpha'">
					<xsl:value-of select="'alpha-upper'"/>
				</xsl:when>
				<xsl:when test="@type='LAlpha'">
					<xsl:value-of select="'alpha-lower'"/>
				</xsl:when>
				<xsl:when test="@type='LAlphap'">
					<xsl:value-of select="'alpha-lower'"/>
				</xsl:when>
				<xsl:when test="@type='PLAlpha'">
					<xsl:value-of select="'alpha-lower'"/>
				</xsl:when>
				<xsl:when test="@type='URoman'">
					<xsl:value-of select="'roman-upper'"/>
				</xsl:when>
				<xsl:when test="@type='LRoman'">
					<xsl:value-of select="'roman-lower'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'order'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="parent::jnl:item-list">
				<xsl:element name="list-item">
					<xsl:element name="list">
						<xsl:attribute name="list-type">
							<xsl:value-of select="$list-type"/>
						</xsl:attribute>
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="list">
					<xsl:attribute name="list-type">
						<xsl:value-of select="$list-type"/>
					</xsl:attribute>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="ancestor::jnl:item-list"/>
			<xsl:when test="ancestor::jnl:footnote"/>
			<xsl:when test="ancestor::jnl:tbl"/>
			<xsl:when test="ancestor::jnl:fig"/>
			<xsl:when test="descendant::jnl:figref or descendant::jnl:tblref">
				<xsl:for-each select="descendant::jnl:figref">
					<xsl:sort select="string-length(@rids)"/>
					<xsl:sort select="@rids"/>
					<xsl:variable name="fids">
						<xsl:value-of select="@rids"/>
					</xsl:variable>
					<xsl:variable name="fidused">
						<xsl:for-each select="preceding::jnl:figref">
							<xsl:choose>
								<xsl:when test="@rids and @rids = $fids">
									<xsl:choose>
										<xsl:when test="ancestor::jnl:footnote"/>
										<xsl:when test="ancestor::jnl:tbl"/>
										<xsl:when test="ancestor::jnl:fig"/>
										<xsl:when test="ancestor::jnl:p">
											<xsl:text>1</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="$fidused = ''">
						<xsl:for-each select="//jnl:fig[@id and @id = $fids]">
							<xsl:variable name="ftype">
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
										<xsl:apply-templates select="self::node()" mode="Mtype"/>
									</xsl:when>
								</xsl:choose>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$ftype = ''">
									<xsl:variable name="fid">
										<xsl:value-of select="substring-after(@id,'fig')"/>
									</xsl:variable>
									<xsl:variable name="gid">
										<xsl:value-of select="jnl:graphic/@id"/>
									</xsl:variable>
									<xsl:element name="fig">
										<xsl:attribute name="id">
											<xsl:text>f</xsl:text>
											<xsl:choose>
												<xsl:when test="$fid > 9">
												<xsl:text/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>0</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="$fid"/>
										</xsl:attribute>
										<xsl:attribute name="position">
											<xsl:text>float</xsl:text>
										</xsl:attribute>
										<xsl:if test="@num and @num !=''">
											<xsl:element name="label">
												<xsl:choose>
												<xsl:when test="$FigReduce = 1">
												<xsl:text>Fig. </xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>Figure </xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:apply-templates select="@num"/>
												<xsl:text>.</xsl:text>
											</xsl:element>
										</xsl:if>
										<xsl:element name="caption">
											<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
												<xsl:element name="title">
												<xsl:apply-templates select="jnl:caption[1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="p">
												<xsl:apply-templates select="jnl:caption[1]"/>
												</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:apply-templates
												select="jnl:caption[position() > 1]"/>
										</xsl:element>
										<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
										<xsl:choose>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>bio.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>jcs.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'ces.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'ces')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:text>-f</xsl:text>
										<xsl:choose>
											<xsl:when test="$fid > 9">
												<xsl:text/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>0</xsl:text>
												<xsl:value-of select="$fid"/>
												<xsl:text>.tif</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:text disable-output-escaping="yes">"&gt;&lt;/graphic&gt;</xsl:text>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="descendant::jnl:tblref">
					<xsl:sort select="string-length(@rids)"/>
					<xsl:sort select="@rids"/>
					<xsl:variable name="fids">
						<xsl:value-of select="@rids"/>
					</xsl:variable>
					<xsl:variable name="fidused">
						<xsl:for-each select="preceding::jnl:tblref">
							<xsl:choose>
								<xsl:when test="@rids and @rids = $fids">
									<xsl:choose>
										<xsl:when test="ancestor::jnl:footnote"/>
										<xsl:when test="ancestor::jnl:tbl"/>
										<xsl:when test="ancestor::jnl:fig"/>
										<xsl:when test="ancestor::jnl:p">
											<xsl:text>1</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="$fidused = ''">
						<xsl:for-each select="//jnl:tbl[@id and @id = $fids]">
							<xsl:variable name="ftype">
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
										<xsl:apply-templates select="self::node()" mode="Mtype"/>
									</xsl:when>
								</xsl:choose>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$ftype = ''">
									<xsl:variable name="fid">
										<xsl:value-of select="substring-after(@id,'tbl')"/>
									</xsl:variable>
									<xsl:element name="table-wrap">
										<xsl:attribute name="id">
											<xsl:text>t</xsl:text>
											<xsl:choose>
												<xsl:when test="$fid > 9">
												<xsl:text/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>0</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="$fid"/>
										</xsl:attribute>
										<xsl:attribute name="position">
											<xsl:text>float</xsl:text>
										</xsl:attribute>
										<xsl:if test="@num and @num !=''">
											<xsl:element name="label">
												<xsl:text>Table </xsl:text>
												<xsl:apply-templates select="@num"/>
												<xsl:text>.</xsl:text>
											</xsl:element>
										</xsl:if>
										<xsl:apply-templates select="tbl:table"/>
										<xsl:choose>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>bio.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>bio.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>jcs.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'ces.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'ces')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:text>-t</xsl:text>
												<xsl:choose>
												<xsl:when test="$fid > 9">
												<xsl:text/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>0</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:value-of select="$fid"/>
												<xsl:text>.tif</xsl:text>
												<xsl:text disable-output-escaping="yes">"&gt;&lt;/graphic&gt;</xsl:text>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"/>
											<xsl:otherwise>
												<xsl:if test="jnl:tfootnote">
												<xsl:element name="table-wrap-foot">
												<xsl:apply-templates select="jnl:tfootnote"/>
												</xsl:element>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>

	</xsl:template>
	<xsl:template match="jnl:item[parent::jnl:item-list]">
		<xsl:element name="list-item">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:intraref">
		<xsl:variable name="ReferNo">
			<xsl:value-of select="@rids"/>
		</xsl:variable>
		<xsl:text disable-output-escaping="yes">&lt;xref ref-type="</xsl:text>
		<xsl:choose>
			<xsl:when test="contains(@rids, 'section')">
				<xsl:text>sec</xsl:text>
				<xsl:text>" rid="</xsl:text>
				<xsl:apply-templates select="//jnl:section[@id = $ReferNo]" mode="secrefer"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>app</xsl:text>
				<xsl:text>" rid="</xsl:text>
				<xsl:value-of select="@rids"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:apps">
		<xsl:for-each select="node()">
			<xsl:choose>
				<xsl:when test="self::jnl:refs and preceding-sibling::jnl:app"/>
				<xsl:when test="self::jnl:refs">
					<xsl:element name="ref-list">
						<xsl:apply-templates select="node()[not(self::jnl:title)]"/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="self::jnl:app">
					<xsl:variable name="Number" select="count(preceding-sibling::jnl:app) + 1"/>
					<xsl:element name="app-group">
						<xsl:apply-templates select="self::node()"/>
						<xsl:if test="following-sibling::node()[position() = 1 and self::jnl:refs]">
							<xsl:for-each select="following-sibling::node()[self::jnl:refs]">
								<xsl:variable name="Number2"
									select="count(preceding-sibling::jnl:app)"/>
								<xsl:choose>
									<xsl:when test="$Number = $Number2">
										<xsl:element name="ref-list">
											<xsl:apply-templates
												select="node()[not(self::jnl:title)]"/>
										</xsl:element>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</xsl:if>
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="jnl:app">
		<xsl:element name="app">
			<xsl:choose>
				<xsl:when test="@id and @id != ''">
					<xsl:attribute name="id">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template
		match="jnl:refs[ancestor::jnl:back] | jnl:refs[ancestor::jnl:letter] | jnl:refs[ancestor::jnl:abstract[parent::jnl:doc]]">
		<xsl:element name="ref-list">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:refs[ancestor::jnl:news]">
		<xsl:element name="ref-list">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:refs[ancestor::jnl:book-rev]">
		<xsl:element name="ref-list">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:school[ancestor::jnl:revr and ancestor::jnl:book-rev]">
		<xsl:if test="jnl:org-name/node() | jnl:org-div/node()">
			<xsl:element name="institution">
				<xsl:apply-templates select="jnl:org-name | jnl:org-div" mode="affs"/>
			</xsl:element>
		</xsl:if>
		<xsl:if
			test="jnl:address/jnl:street/node() | jnl:address/jnl:city/node() | jnl:address/jnl:postbox/node() | jnl:address/jnl:state/node() | jnl:address/jnl:postcode/node() | jnl:address/jnl:postbox/node()">
			<xsl:element name="addr-line">
				<xsl:apply-templates
					select="jnl:address/jnl:street | jnl:address/jnl:city | jnl:address/jnl:state | jnl:address/jnl:postbox | jnl:address/jnl:postcode | jnl:address/jnl:postbox"
					mode="affs"/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="jnl:address/jnl:country/node()">
			<xsl:element name="country">
				<xsl:apply-templates select="jnl:address/jnl:country" mode="affs"/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="jnl:address/jnl:email/node()">
			<xsl:apply-templates select="jnl:address/jnl:email" mode="affs"/>
		</xsl:if>
	</xsl:template>
	<xsl:template
		match="jnl:cit[ancestor::jnl:back | ancestor::jnl:letter | ancestor::jnl:book-rev | ancestor::jnl:news | ancestor::jnl:abstract[parent::jnl:doc]]">
		<xsl:element name="ref">
			<xsl:attribute name="id">
				<xsl:text>b</xsl:text>
				<xsl:variable name="Number">
					<xsl:value-of select="substring-after(@id,'ref')"/>
				</xsl:variable>
				<xsl:value-of select="$Number"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@num and @num != ''">
					<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
					<xsl:apply-templates select="@num"/>
					<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
				</xsl:when>
			</xsl:choose>
			<xsl:text disable-output-escaping="yes">&lt;citation citation-type="</xsl:text>
			<xsl:choose>
				<xsl:when test="@type and @type != '' and @type != 'other'">
					<xsl:value-of select="@type"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>journal</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
			<!--<xsl:choose>
<xsl:when test="@num and @num != ''">
<xsl:text> </xsl:text>
</xsl:when>
</xsl:choose>-->
			<xsl:apply-templates/>
			<xsl:choose>
				<xsl:when test="processing-instruction('show')">
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="processing-instruction('show')" mode="cit"/>
				</xsl:when>
			</xsl:choose>
			<xsl:text disable-output-escaping="yes">&lt;/citation&gt;</xsl:text>
		</xsl:element>
	</xsl:template>
	<xsl:template match="processing-instruction('show')[parent::jnl:cit]" priority="1"/>
	<xsl:template match="processing-instruction('show')[parent::jnl:cit]" priority="1" mode="cit">
		<xsl:variable name="content1" select="."/>

		<xsl:text disable-output-escaping="yes">&lt;pub-id pub-id-type="doi"&gt;</xsl:text>

		<xsl:value-of select="$content1"/>

		<xsl:text disable-output-escaping="yes">&lt;/pub-id&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:note[ancestor::jnl:body]">
		<xsl:choose>
			<xsl:when test="jnl:fx-graphic">
				<xsl:apply-templates/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:fx-graphic">
		<xsl:variable name="fid">
			<xsl:value-of select="substring-after(@id,'fig')"/>
		</xsl:variable>
		<xsl:variable name="gid">
			<xsl:value-of select="jnl:graphic/@id"/>
		</xsl:variable>
		<xsl:element name="fig">
			<!--<xsl:attribute name="id">
<xsl:choose>
<xsl:when test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
<xsl:value-of select="$fileCcode"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$filecode"/>
</xsl:otherwise>
</xsl:choose>
<xsl:text>-f</xsl:text>
<xsl:choose>
<xsl:when test="$fid > 9">
<xsl:text></xsl:text>
</xsl:when>
<xsl:otherwise>
<xsl:text>0</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:value-of select="$fid"/>
</xsl:attribute>-->
			<xsl:attribute name="position">
				<xsl:text>float</xsl:text>
			</xsl:attribute>
			<xsl:if test="@num and @num !=''">
				<xsl:element name="label">
					<xsl:choose>
						<xsl:when test="$FigReduce = 1">
							<xsl:text>Fig. </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Figure </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="@num"/>
					<xsl:text>.</xsl:text>
				</xsl:element>
			</xsl:if>
			<xsl:element name="caption">
				<xsl:apply-templates select="jnl:caption"/>
			</xsl:element>
			<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
			<xsl:choose>
				<xsl:when test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
					<xsl:value-of select="substring-after($gid, 'graphic')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="part1">
						<xsl:apply-templates select="@img-data"/>
					</xsl:variable>
					<xsl:variable name="partA">
						<xsl:choose>
							<xsl:when test="contains($part1 , '-')">
								<xsl:value-of select="substring-before(@part1,'-')"/>
							</xsl:when>
							<xsl:when test="string-length($part1) &gt; 4">
								<xsl:value-of select="substring($part1,1,4)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@part1"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="partB">
						<xsl:choose>
							<xsl:when test="contains($part1 , '-')">
								<xsl:text>-</xsl:text>
								<xsl:value-of select="substring-after(@part1,'-')"/>
							</xsl:when>
							<xsl:when test="string-length($part1) &gt; 4">
								<xsl:value-of select="substring($part1,4)"/>
							</xsl:when>
							<xsl:otherwise> </xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of
						select="translate($partA , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
					<xsl:value-of select="$partB"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text disable-output-escaping="yes">"/&gt;</xsl:text>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:author-query" mode="corraff"/>
	<xsl:template match="jnl:author-query" mode="corrs"/>
	<xsl:template match="jnl:author-query" mode="aff"/>
	<xsl:template match="jnl:author-query" mode="affs"/>
	<xsl:template match="jnl:author-query" mode="affss"/>
	<xsl:template match="jnl:author-query" mode="justchar"/>
	<xsl:template match="jnl:author-query" mode="AuthCorres"/>
	<xsl:template match="jnl:author-query" mode="justname"/>
	<xsl:template match="jnl:author-query"/>
	<xsl:template match="jnl:note[ancestor::jnl:back]">
		<xsl:element name="ref">
			<xsl:attribute name="id">
				<xsl:text>nr</xsl:text>
				<xsl:value-of select="substring-after(@id,'noteref')"/>
			</xsl:attribute>
			<xsl:element name="note">
				<xsl:if test="@num">
					<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
					<xsl:apply-templates select="@num"/>
					<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:etal[ancestor::jnl:cit]">
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"> </xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="preceding-sibling::node()[position() = 1 and self::jnl:author]"/>
					<xsl:when test="preceding-sibling::node()[position() = 1 and self::jnl:etal]"/>
					<xsl:when test="preceding-sibling::node()[position() = 1 and self::jnl:editor]"/>
					<xsl:when
						test="preceding-sibling::node()[position() = 1 and self::text()] and preceding-sibling::node()[position() = 2 and self::jnl:author]"/>
					<xsl:when
						test="preceding-sibling::node()[position() = 1 and self::text()] and preceding-sibling::node()[position() = 2 and self::jnl:etal]"/>
					<xsl:when
						test="preceding-sibling::node()[position() = 1 and self::text()] and preceding-sibling::node()[position() = 2 and self::jnl:editor]"/>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;person-group person-group-type="author"&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="newline"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text disable-output-escaping="yes">&lt;etal/&gt;</xsl:text>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
				<xsl:choose>
					<xsl:when test="preceding-sibling::node()[position() = 1 and self::jnl:editor]">
						<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
						<xsl:text>, eds. </xsl:text>
					</xsl:when>
					<xsl:when
						test="preceding-sibling::node()[position() = 1 and self::text()] and preceding-sibling::node()[position() = 2 and self::jnl:editor]">
						<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
						<xsl:text>, eds. </xsl:text>
					</xsl:when>
					<xsl:when
						test="following-sibling::node()[not(self::text() or self::jnl:emph or self::processing-instruction())]">
						<xsl:text> </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:etal]"/>
					<xsl:when
						test="following-sibling::node()[position() = 1 and self::text()] and following-sibling::node()[position() = 2 and self::jnl:etal]"/>
					<xsl:when test="preceding-sibling::node()[position() = 1 and self::jnl:editor]">
						<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
						<xsl:text>, eds. </xsl:text>
					</xsl:when>
					<xsl:when
						test="preceding-sibling::node()[position() = 1 and self::text()] and preceding-sibling::node()[position() = 2 and self::jnl:editor]">
						<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
						<!--<xsl:text>, eds. </xsl:text>-->
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:corporate-author[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;collab&gt;</xsl:text>
		<xsl:apply-templates select="jnl:org-name/node()"/>
		<xsl:text disable-output-escaping="yes">&lt;/collab&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:corporate-author[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;collab&gt;</xsl:text>
		<xsl:apply-templates select="jnl:org-name/node()"/>
		<xsl:text disable-output-escaping="yes">&lt;/collab&gt;. </xsl:text>
	</xsl:template>
	<xsl:template match="jnl:author[parent::jnl:cit]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:author]"/>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;person-group person-group-type="author"&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when
				test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism | jnl:role">
				<xsl:text>
</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism">
			<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
			<xsl:if test="jnl:surname">
				<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
				<xsl:apply-templates select="jnl:surname/."/>
				<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:initial | jnl:forename">
				<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
				<xsl:apply-templates select="jnl:forename | jnl:initial"/>
				<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:ac-degree | jnl:americanism">
				<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
				<xsl:apply-templates select="jnl:ac-degree | jnl:americanism"/>
				<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="jnl:role">
			<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
			<xsl:apply-templates select="jnl:role"/>
			<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="following-sibling::node()[self::jnl:author]"/>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
				<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:etal]"/>
			<xsl:when
				test="following-sibling::node()[position() = 1 and self::text()] and following-sibling::node()[position() = 2 and self::jnl:etal]"/>
			<xsl:otherwise>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:editor[parent::jnl:cit]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[position() = 1 and self::jnl:editor]"/>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::text()] and preceding-sibling::node()[position() = 2 and self::jnl:editor]"/>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;person-group person-group-type="editor"&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when
				test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism | jnl:role">
				<xsl:text>
</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism">
			<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
			<xsl:if test="jnl:surname">
				<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
				<xsl:apply-templates select="jnl:surname/."/>
				<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:initial | jnl:forename">
				<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
				<xsl:apply-templates select="jnl:forename | jnl:initial"/>
				<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:ac-degree | jnl:americanism">
				<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
				<xsl:apply-templates select="jnl:ac-degree | jnl:americanism"/>
				<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="jnl:role">
			<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
			<xsl:apply-templates select="jnl:role"/>
			<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:editor]"/>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:etal]"/>
			<xsl:when
				test="following-sibling::node()[position() = 1 and self::text()] and following-sibling::node()[position() = 2 and self::jnl:editor]"/>
			<xsl:when
				test="following-sibling::node()[position() = 1 and self::text()] and following-sibling::node()[position() = 2 and self::jnl:etal]"/>
			<xsl:otherwise>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;/person-group&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:editor[parent::jnl:art-desc]|jnl:author[parent::jnl:art-desc]">
		<xsl:choose>
			<xsl:when
				test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism | jnl:role">
				<xsl:text>
</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism">
			<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
			<xsl:if test="jnl:surname">
				<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
				<xsl:apply-templates select="jnl:surname/."/>
				<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:initial | jnl:forename">
				<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
				<xsl:apply-templates select="jnl:forename | jnl:initial"/>
				<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:ac-degree | jnl:americanism">
				<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
				<xsl:apply-templates select="jnl:ac-degree | jnl:americanism"/>
				<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="jnl:role">
			<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
			<xsl:apply-templates select="jnl:role"/>
			<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:art-desc[parent::jnl:sub-art-rev]">
		<xsl:element name="ref">
			<xsl:attribute name="id">
				<xsl:choose>
					<xsl:when test="ancestor::jnl:article">
						<xsl:apply-templates
							select="ancestor::jnl:article/jnl:unit-info/jnl:c-tracker-id/."/>
					</xsl:when>
					<xsl:when test="ancestor::jnl:article-rev">
						<xsl:apply-templates
							select="ancestor::jnl:article-rev/jnl:unit-info/jnl:c-tracker-id/."/>
					</xsl:when>
					<xsl:when test="ancestor::jnl:letter-grp">
						<xsl:apply-templates
							select="ancestor::jnl:letter-grp/jnl:unit-info/jnl:c-tracker-id/."/>
					</xsl:when>
				</xsl:choose>
				<xsl:text>-</xsl:text>
				<xsl:choose>
					<xsl:when test="jnl:author">
						<xsl:variable name="Name" select="jnl:author[1]/jnl:surname/."/>
						<xsl:apply-templates select="$Name" mode="justname"/>
						<xsl:variable name="Number"
							select="count(preceding::jnl:art-desc/jnl:author[1][jnl:surname/. = $Name]) + count(preceding::jnl:art-desc[jnl:editor and not(jnl:author)]/jnl:editor[1][jnl:surname/. = $Name])+ 1"/>
						<xsl:value-of select="$Number"/>
					</xsl:when>
					<xsl:when test="jnl:editor">
						<xsl:variable name="Name" select="jnl:editor[1]/jnl:surname/."/>
						<xsl:apply-templates select="$Name" mode="justname"/>
						<xsl:variable name="Number"
							select="count(preceding::jnl:art-desc/jnl:author[1][jnl:surname/. = $Name]) + count(preceding::jnl:art-desc[jnl:editor and not(jnl:author)]/jnl:editor[1][jnl:surname/. = $Name])+ 1"/>
						<xsl:value-of select="$Number"/>
					</xsl:when>
					<xsl:when test="jnl:corporate-author">
						<xsl:text>b</xsl:text>
						<xsl:variable name="Number"
							select="count(preceding::jnl:art-desc/jnl:corporate-author) + 1"/>
						<xsl:value-of select="$Number"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:element name="nlm-citation">
				<xsl:attribute name="citation-type">
					<xsl:choose>
						<xsl:when test="@type and @type != ''">
							<xsl:value-of select="@type"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>journal</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:if test="jnl:author">
					<xsl:element name="person-group">
						<xsl:attribute name="person-group-type">author</xsl:attribute>
						<xsl:apply-templates
							select="jnl:author|jnl:etal[preceding-sibling::node()[position() = 1 and self::jnl:author]]"
						/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="jnl:corporate-author">
					<xsl:element name="collab">
						<xsl:apply-templates select="jnl:corporate-author/jnl:org-name/node()"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="jnl:editor">
					<xsl:element name="person-group">
						<xsl:attribute name="person-group-type">editor</xsl:attribute>
						<xsl:apply-templates
							select="jnl:editor|jnl:etal[preceding-sibling::node()[position() = 1 and self::jnl:editor]]"
						/>
					</xsl:element>
				</xsl:if>
				<xsl:apply-templates select="jnl:cit-tl"/>
				<xsl:apply-templates select="jnl:pub-tl"/>
				<xsl:apply-templates select="jnl:date/jnl:year|jnl:date/jnl:month|jnl:date/jnl:day"/>
				<xsl:apply-templates select="jnl:vol"/>
				<xsl:apply-templates select="jnl:suppl-tl"/>
				<xsl:apply-templates select="jnl:issue-no"/>
				<xsl:apply-templates select="jnl:pub-loc"/>
				<xsl:apply-templates select="jnl:pub-name"/>
				<xsl:apply-templates select="jnl:pages/."/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:author[parent::jnl:art-desc]">
		<xsl:choose>
			<xsl:when
				test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism | jnl:role">
				<xsl:text>
</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:if
			test="jnl:surname | jnl:initial | jnl:forename | jnl:ac-degree | jnl:americanism | jnl:role">
			<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
			<xsl:if test="jnl:surname">
				<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
				<xsl:apply-templates select="jnl:surname/."/>
				<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:initial | jnl:forename">
				<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
				<xsl:apply-templates select="jnl:forename | jnl:initial"/>
				<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:ac-degree | jnl:americanism">
				<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
				<xsl:apply-templates select="jnl:ac-degree | jnl:americanism"/>
				<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:role">
				<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
				<xsl:apply-templates select="jnl:role"/>
				<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:cit-tl[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;article-title&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/article-title&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:pub-tl]">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:doi[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;pub-id pub-id-type="doi"&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/pub-id&gt;</xsl:text>
		<xsl:choose>
			<xsl:when
				test="following-sibling::node()[not(self::text() or self::jnl:emph or self::processing-instruction())]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:cit-tl[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;article-title&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/article-title&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:othinfo[parent::jnl:art-desc]">
		<xsl:choose>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit and not(parent::jnl:cit/jnl:pub-tl)">
				<xsl:text disable-output-escaping="yes">&lt;source&gt;</xsl:text>
				<xsl:variable name="TtT">
					<xsl:apply-templates/>
				</xsl:variable>
				<xsl:variable name="lsize">
					<xsl:value-of select="string-length($TtT)"/>
				</xsl:variable>
				<xsl:variable name="fsize">
					<xsl:value-of select="$lsize - 1"/>
				</xsl:variable>
				<xsl:variable name="Tto">
					<xsl:value-of select="substring($TtT,$lsize,1)"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$Tto != '.'">
						<xsl:value-of disable-output-escaping="yes" select="$TtT"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of disable-output-escaping="yes" select="substring(.,1,$fsize)"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text disable-output-escaping="yes">&lt;/source&gt;</xsl:text>
				<xsl:if test="parent::jnl:cit[@type and @type = 'book']">
					<xsl:text>.</xsl:text>
				</xsl:if>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit">
				<xsl:text disable-output-escaping="yes">&lt;comment&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/comment&gt; </xsl:text>
			</xsl:when>
			<xsl:when
				test="following-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit">
				<xsl:text disable-output-escaping="yes">&lt;comment&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/comment&gt; </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;comment&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/comment&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:othinfo[parent::jnl:cit]">
		<xsl:choose>
			<xsl:when
				test="not(parent::jnl:cit/jnl:pub-name) and not(parent::jnl:cit/jnl:pub-tl) and processing-instruction('ENTCHAR')[. = 'colon']">
				<xsl:text disable-output-escaping="yes">&lt;source&gt;</xsl:text>
				<xsl:for-each select="node()">
					<xsl:choose>
						<xsl:when
							test="self::text() and preceding-sibling::node()[position() = 1 and self::processing-instruction('ENTCHAR')[. = 'colon']]">
							<xsl:choose>
								<xsl:when test="starts-with(. , ' ')">
									<xsl:value-of select="substring-after(.,' ')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="."/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when
							test="self::text() and preceding-sibling::processing-instruction('ENTCHAR')[. = 'colon']">
							<xsl:value-of select="."/>
						</xsl:when>
						<xsl:when
							test="preceding-sibling::processing-instruction('ENTCHAR')[. = 'colon']">
							<xsl:apply-templates select="self::node()"/>
						</xsl:when>
						<xsl:when test="self::processing-instruction('ENTCHAR')[. = 'colon']">
							<xsl:text disable-output-escaping="yes">&lt;/source&gt;: </xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;publisher-name&gt;</xsl:text>
						</xsl:when>
						<xsl:when test="self::text()">
							<xsl:value-of select="."/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="self::node()"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:text disable-output-escaping="yes">&lt;/publisher-name&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;comment&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/comment&gt;</xsl:text>
				<xsl:choose>
					<xsl:when
						test="following-sibling::node()[not(self::text() or self::jnl:emph or self::processing-instruction())]">
						<xsl:text> </xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:fpage[ancestor::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;fpage&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/fpage&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:lpage]">
				<xsl:text disable-output-escaping="yes">&amp;ndash;</xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:fpage]">
				<xsl:text disable-output-escaping="yes">, </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:pages/following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:fpage[ancestor::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;fpage&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/fpage&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:lpage[ancestor::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;lpage&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/lpage&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:lpage[ancestor::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;lpage&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/lpage&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:vol[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;volume&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/volume&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:vol[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;volume&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/volume&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="parent::jnl:cit/jnl:pub-loc">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:issue">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:suppl-tl">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:pages">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:date[parent::jnl:cit or parent::jnl:art-desc]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:vol[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;volume&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/volume&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="parent::jnl:cit/jnl:suppl-tl"/>
			<xsl:when test="parent::jnl:cit/jnl:pub-loc">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:issue">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:suppl-tl">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:pages">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:issue-no[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;issue&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/issue&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="parent::jnl:cit/jnl:pub-loc">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:pages">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:issue-no[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;issue&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/issue&gt;</xsl:text>
		<xsl:choose>
			<xsl:when
				test="following-sibling::node()[not(self::text() or self::jnl:emph or self::processing-instruction())]">
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:suppl-tl[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;supplement&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/supplement&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="parent::jnl:cit/jnl:pub-loc">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:pages">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:suppl-tl[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;supplement&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/supplement&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:pub-tl[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;source&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/source&gt;</xsl:text>
		<xsl:if test="parent::jnl:cit[@type and @type = 'book']">
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:date]">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:pub-tl[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;source&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/source&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:pub-name[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;publisher-name&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/publisher-name&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="parent::jnl:cit[@type and @type = 'book']/jnl:date">
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:pages">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:pub-name[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;publisher-name&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/publisher-name&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:pub-loc[parent::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;publisher-loc&gt;</xsl:text>
		<xsl:apply-templates select="jnl:address/jnl:city"/>
		<xsl:if test="jnl:address/jnl:city and jnl:address/jnl:state">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="jnl:address/jnl:state"/>
		<xsl:choose>
			<xsl:when test="jnl:address/jnl:state and jnl:address/jnl:country">
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:when test="jnl:address/jnl:city and jnl:address/jnl:country">
				<xsl:text>, </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="jnl:address/jnl:country"/>
		<xsl:text disable-output-escaping="yes">&lt;/publisher-loc&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="parent::jnl:cit[@type and @type = 'book']/jnl:pub-name">
				<xsl:text>: </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:pub-name">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:cit/jnl:pages">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:pub-loc[parent::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;publisher-loc&gt;</xsl:text>
		<xsl:apply-templates select="jnl:address/jnl:city"/>
		<xsl:if test="jnl:address/jnl:city and jnl:address/jnl:state">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="jnl:address/jnl:state"/>
		<xsl:choose>
			<xsl:when test="jnl:address/jnl:state and jnl:address/jnl:country">
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:when test="jnl:address/jnl:city and jnl:address/jnl:country">
				<xsl:text>, </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="jnl:address/jnl:country"/>
		<xsl:text disable-output-escaping="yes">&lt;/publisher-loc&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:year[ancestor::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;year&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/year&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="following-sibling::node()"> </xsl:when>
			<xsl:when
				test="parent::jnl:date/following-sibling::node()[position() = 1 and self::jnl:vol]">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when
				test="parent::jnl:date/following-sibling::node()[position() = 1 and self::jnl:pages]">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:date/following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:year[ancestor::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;year&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/year&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:month[ancestor::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;month&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/month&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="following-sibling::node()"> </xsl:when>
			<xsl:when
				test="parent::jnl:date/following-sibling::node()[position() = 1 and self::jnl:vol]">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when
				test="parent::jnl:date/following-sibling::node()[position() = 1 and self::jnl:pages]">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:date/following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:month[ancestor::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;month&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/month&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:day[ancestor::jnl:cit]">
		<xsl:text disable-output-escaping="yes">&lt;day&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/day&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:day[ancestor::jnl:art-desc]">
		<xsl:text disable-output-escaping="yes">&lt;day&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/day&gt;</xsl:text>
		<xsl:choose>
			<xsl:when test="following-sibling::node()"> </xsl:when>
			<xsl:when
				test="parent::jnl:date/following-sibling::node()[position() = 1 and self::jnl:vol]">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when test="parent::jnl:date/following-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:initial[ancestor::jnl:cit]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:initial or self::jnl:forename]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="nodot"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>.</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:initial[ancestor::jnl:art-desc]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:ac-degree[ancestor::jnl:art-desc]">
		<xsl:if
			test="preceding-sibling::jnl:ac-degree or preceding-sibling::jnl:americanism or preceding-sibling::jnl:role">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:ac-degree[ancestor::jnl:cit]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:role[ancestor::jnl:art-desc]">
		<xsl:if
			test="preceding-sibling::jnl:ac-degree or preceding-sibling::jnl:americanism or preceding-sibling::jnl:role">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:role[ancestor::jnl:cit]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:americanism[ancestor::jnl:art-desc]">
		<xsl:if
			test="preceding-sibling::jnl:ac-degree or preceding-sibling::jnl:americanism or preceding-sibling::jnl:role">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:americanism[ancestor::jnl:cit]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:forename[ancestor::jnl:art-desc]">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:forename[ancestor::jnl:cit]">
		<xsl:choose>
			<xsl:when test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
				<xsl:choose>
					<xsl:when test="preceding-sibling::jnl:initial">
						<xsl:text> </xsl:text>
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates/>
				<xsl:choose>
					<xsl:when test="following-sibling::jnl:initial">
						<xsl:text> </xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:acks]" priority="1"/>
	<xsl:template match="jnl:title[parent::jnl:acks]">
		<xsl:element name="title">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:keywd-grp]">
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"/>
			<xsl:otherwise>
				<xsl:element name="title">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:refs]">
		<xsl:element name="title">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:abstract]">
		<xsl:element name="title">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:app]">
		<xsl:element name="title">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:keywd-grp[parent::jnl:book-rev]">
		<xsl:element name="kwd-group">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:keywd-grp[parent::jnl:letter]">
		<xsl:element name="kwd-group">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:keyword[ancestor::jnl:book-rev]">
		<xsl:element name="kwd">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:keyword[ancestor::jnl:letter]">
		<xsl:element name="kwd">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:keywd-grp[parent::jnl:front]">
		<xsl:element name="kwd-group">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
					<xsl:element name="title">
						<xsl:text>Key words</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
					<xsl:element name="title">
						<xsl:text>Key words</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:when test="not(jnl:title)">
					<xsl:element name="title">
						<xsl:text>Key words:</xsl:text>
					</xsl:element>
				</xsl:when>
			</xsl:choose>



			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:keyword[ancestor::jnl:front]">
		<xsl:element name="kwd">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:abrv-item[ancestor::jnl:abrv-grp]">
		<xsl:element name="def-item">
			<xsl:element name="term">
				<xsl:apply-templates select="jnl:abrv/."/>
			</xsl:element>
			<xsl:element name="def">
				<xsl:element name="p">
					<xsl:apply-templates select="jnl:expn/."/>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:corporate-author[parent::jnl:author-grp]">
		<xsl:element name="contrib">
			<xsl:attribute name="contrib-type">author</xsl:attribute>
			<xsl:text disable-output-escaping="yes">&lt;collab&gt;</xsl:text>
			<xsl:apply-templates select="jnl:org-name/."/>
			<xsl:text disable-output-escaping="yes">&lt;/collab&gt;</xsl:text>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:author[parent::jnl:author-grp]">
		<xsl:variable name="ASurname">
			<xsl:apply-templates select="jnl:surname" mode="getname"/>
		</xsl:variable>
		<xsl:variable name="AForename">
			<xsl:apply-templates select="jnl:forename" mode="getname"/>
			<xsl:apply-templates select="jnl:initial" mode="getname"/>
		</xsl:variable>
		<xsl:variable name="NewAuth"> </xsl:variable>
		<xsl:choose>
			<xsl:when test="$NewAuth = ''">
				<xsl:element name="contrib">
					<xsl:choose>
						<xsl:when test="parent::jnl:author-grp[@type = 'editor']">
							<xsl:attribute name="contrib-type">editor</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="contrib-type">author</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
							<xsl:variable name="corres">
								<xsl:for-each select="jnl:noteref">
									<xsl:variable name="fid">
										<xsl:value-of select="@rids"/>
									</xsl:variable>

									<xsl:choose>
										<xsl:when test="contains($fid, 'fn')">
											<xsl:variable name="partA">
												<xsl:apply-templates
												select="//jnl:footnote[@id = $fid]/node()"/>
											</xsl:variable>
											<xsl:variable name="corr"
												select="translate($partA , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
											<xsl:choose>
												<xsl:when test="contains($corr , 'CORRESP')">
												<xsl:text>1</xsl:text>
												</xsl:when>
											</xsl:choose>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</xsl:variable>
							<xsl:if test="$corres != ''">
								<xsl:attribute name="corresp">yes</xsl:attribute>
							</xsl:if>
						</xsl:when>
					</xsl:choose>
					<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:americanism">
						<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
						<xsl:if test="jnl:surname">
							<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
							<xsl:apply-templates select="jnl:surname/node()"/>
							<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						</xsl:if>
						<xsl:if test="jnl:initial | jnl:forename">
							<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
							<xsl:apply-templates select="jnl:forename | jnl:initial"/>
							<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
						</xsl:if>
						<xsl:if test="jnl:americanism">
							<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
							<xsl:apply-templates select="jnl:americanism"/>
							<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
					</xsl:if>
					<xsl:if test="jnl:role">
						<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
						<xsl:apply-templates select="jnl:role"/>
						<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
					</xsl:if>
					<xsl:if test="jnl:ac-degree">
						<xsl:text disable-output-escaping="yes">&lt;degrees&gt;</xsl:text>
						<xsl:apply-templates select="jnl:ac-degree"/>
						<xsl:text disable-output-escaping="yes">&lt;/degrees&gt;</xsl:text>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="ancestor::jnl:abstract">
							<xsl:choose>
								<xsl:when test="jnl:emph[@type and @type = 'sup']">
									<xsl:variable name="rtext">
										<xsl:apply-templates
											select="jnl:emph[@type and @type = 'sup']/node()"/>
									</xsl:variable>
									<xsl:call-template name="write-affsnum">
										<xsl:with-param name="rids-attribute-value" select="$rtext"
										/>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="contains(@affs,' ')">
									<xsl:call-template name="write-affs">
										<xsl:with-param name="rids-attribute-value" select="@affs"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="@affs and @affs != ''">
									<xsl:variable name="rrids" select="@affs"/>
									<xsl:apply-templates select="//jnl:aff[@id = $rrids]"
										mode="Refers"/>
									<xsl:apply-templates select="//jnl:dept[@id = $rrids]"
										mode="Refers"/>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
									<xsl:choose>
										<xsl:when
											test="following-sibling::jnl:aff or following-sibling::jnl:dept-list/jnl:dept">
											<xsl:choose>
												<xsl:when
												test="parent::jnl:author-grp/jnl:author[@affs and @affs != ''] or parent::jnl:author-grp/jnl:corresponding-author[@affs and @affs != '']"> </xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates
												select="following-sibling::jnl:aff" mode="Refers"/>
												<xsl:apply-templates
												select="following-sibling::jnl:dept-list/jnl:dept"
												mode="Refers"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise> </xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="jnl:noteref"/>
				</xsl:element>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:revr[parent::jnl:book-rev]">
		<xsl:element name="contrib">
			<xsl:attribute name="contrib-type">author</xsl:attribute>
			<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:americanism">
				<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
				<xsl:if test="jnl:surname">
					<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
					<xsl:apply-templates select="jnl:surname/."/>
					<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="jnl:initial | jnl:forename">
					<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
					<xsl:apply-templates select="jnl:forename | jnl:initial"/>
					<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="jnl:americanism">
					<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
					<xsl:apply-templates select="jnl:americanism"/>
					<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:role">
				<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
				<xsl:apply-templates select="jnl:role"/>
				<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:ac-degree">
				<xsl:text disable-output-escaping="yes">&lt;degrees&gt;</xsl:text>
				<xsl:apply-templates select="jnl:ac-degree"/>
				<xsl:text disable-output-escaping="yes">&lt;/degrees&gt;</xsl:text>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:aff[parent::jnl:author-grp]" mode="corraff">
		<xsl:variable name="content">
			<xsl:apply-templates select="jnl:org-name | jnl:org-div | jnl:address" mode="corraff"/>
		</xsl:variable>
		<xsl:value-of disable-output-escaping="yes" select="$content"/>
	</xsl:template>
	<xsl:template name="splitcorrs">
		<xsl:param name="Chars"/>
		<xsl:if test="$Chars != ''">
			<xsl:choose>
				<xsl:when test="contains($Chars , ' ')">
					<xsl:variable name="first">
						<xsl:value-of disable-output-escaping="yes"
							select="substring-before($Chars,' ')"/>
					</xsl:variable>
					<xsl:variable name="rest">
						<xsl:value-of disable-output-escaping="yes"
							select="substring-after($Chars,' ')"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="contains($first , '&amp;commat;')">
							<xsl:variable name="lsize">
								<xsl:value-of select="string-length($first)"/>
							</xsl:variable>
							<xsl:variable name="fsize">
								<xsl:value-of select="$lsize - 1"/>
							</xsl:variable>
							<xsl:variable name="Tto">
								<xsl:value-of select="substring($first,$lsize,1)"/>
							</xsl:variable>
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
									<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
									<xsl:choose>
										<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
											<xsl:variable name="first1">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first,1,$fsize)"/>
											</xsl:variable>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
								</xsl:when>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
									<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
									<xsl:choose>
										<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
											<xsl:variable name="first1">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first,1,$fsize)"/>
											</xsl:variable>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
									<xsl:variable name="first1">
										<xsl:value-of disable-output-escaping="yes"
											select="substring($first,1,$fsize)"/>
									</xsl:variable>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$first1"/>
									</xsl:call-template>
									<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
									<!--<xsl:value-of select="$Tto"/>-->
									<xsl:text>, </xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$first"/>
									</xsl:call-template>
									<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
									<xsl:text> </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$rest != ''">
								<xsl:call-template name="splitcorrs">
									<xsl:with-param name="Chars" select="$rest"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$rest != '' and starts-with($rest , '&amp;commat;')">
							<xsl:choose>
								<xsl:when test="contains($rest , ' ')">
									<xsl:variable name="first1">
										<xsl:value-of disable-output-escaping="yes" select="$first"/>
										<xsl:value-of disable-output-escaping="yes"
											select="substring-before($rest,' ')"/>
									</xsl:variable>
									<xsl:variable name="lsize">
										<xsl:value-of select="string-length($first1)"/>
									</xsl:variable>
									<xsl:variable name="fsize">
										<xsl:value-of select="$lsize - 1"/>
									</xsl:variable>
									<xsl:variable name="Tto">
										<xsl:value-of select="substring($first1,$lsize,1)"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
											<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
											<xsl:choose>
												<xsl:when
												test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
												<xsl:variable name="first2">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first1,1,$fsize)"/>
												</xsl:variable>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first2"/>
												</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
												</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
											<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
											<xsl:choose>
												<xsl:when
												test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
												<xsl:variable name="first2">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first1,1,$fsize)"/>
												</xsl:variable>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first2"/>
												</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
												</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
											<xsl:variable name="first2">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first1,1,$fsize)"/>
											</xsl:variable>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first2"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
											<!--<xsl:value-of select="$Tto"/>-->
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
											<xsl:text> </xsl:text>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:variable name="rest2">
										<xsl:value-of disable-output-escaping="yes"
											select="substring-after($rest,' ')"/>
									</xsl:variable>
									<xsl:if test="$rest2 != ''">
										<xsl:call-template name="splitcorrs">
											<xsl:with-param name="Chars" select="$rest2"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="first1">
										<xsl:value-of disable-output-escaping="yes" select="$first"/>
										<xsl:value-of disable-output-escaping="yes" select="$rest"/>
									</xsl:variable>
									<xsl:variable name="lsize">
										<xsl:value-of select="string-length($first1)"/>
									</xsl:variable>
									<xsl:variable name="fsize">
										<xsl:value-of select="$lsize - 1"/>
									</xsl:variable>
									<xsl:variable name="Tto">
										<xsl:value-of select="substring($first1,$lsize,1)"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when
											test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
											<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
											<xsl:choose>
												<xsl:when
												test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
												<xsl:variable name="first2">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first1,1,$fsize)"/>
												</xsl:variable>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first2"/>
												</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
												</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
										</xsl:when>
										<xsl:when
											test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
											<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
											<xsl:choose>
												<xsl:when
												test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
												<xsl:variable name="first2">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first1,1,$fsize)"/>
												</xsl:variable>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first2"/>
												</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
												<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
												</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
											<xsl:variable name="first2">
												<xsl:value-of disable-output-escaping="yes"
												select="substring($first1,1,$fsize)"/>
											</xsl:variable>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first2"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
											<xsl:value-of select="$Tto"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="write-content">
												<xsl:with-param name="value" select="$first1"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of disable-output-escaping="yes" select="$first"/>
							<xsl:text> </xsl:text>
							<xsl:if test="$rest != ''">
								<xsl:call-template name="splitcorrs">
									<xsl:with-param name="Chars" select="$rest"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="contains($Chars , '&amp;commat;')">
					<xsl:variable name="lsize">
						<xsl:value-of select="string-length($Chars)"/>
					</xsl:variable>
					<xsl:variable name="fsize">
						<xsl:value-of select="$lsize - 1"/>
					</xsl:variable>
					<xsl:variable name="Tto">
						<xsl:value-of select="substring($Chars,$lsize,1)"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when
							test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
							<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
							<xsl:choose>
								<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
									<xsl:variable name="first2">
										<xsl:value-of disable-output-escaping="yes"
											select="substring($Chars,1,$fsize)"/>
									</xsl:variable>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$first2"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$Chars"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						</xsl:when>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
							<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
							<xsl:choose>
								<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
									<xsl:variable name="first2">
										<xsl:value-of disable-output-escaping="yes"
											select="substring($Chars,1,$fsize)"/>
									</xsl:variable>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$first2"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$Chars"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						</xsl:when>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
							<xsl:text disable-output-escaping="yes">&lt;email content-type="email" xlink:href="</xsl:text>
							<xsl:choose>
								<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
									<xsl:variable name="first2">
										<xsl:value-of disable-output-escaping="yes"
											select="substring($Chars,1,$fsize)"/>
									</xsl:variable>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$first2"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="write-content">
										<xsl:with-param name="value" select="$Chars"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="$Tto = '.' or $Tto = ',' or $Tto = ';'">
							<xsl:variable name="first2">
								<xsl:value-of disable-output-escaping="yes"
									select="substring($Chars,1,$fsize)"/>
							</xsl:variable>
							<xsl:call-template name="write-content">
								<xsl:with-param name="value" select="$first2"/>
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
							<xsl:value-of select="$Tto"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="write-content">
								<xsl:with-param name="value" select="$Chars"/>
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of disable-output-escaping="yes" select="$Chars"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:aff[parent::jnl:author-grp]" mode="Refers">
		<xsl:choose>
			<xsl:when test="$AffType = 1">
				<xsl:if
					test="jnl:org-name/node() | jnl:org-div/node() | jnl:address/node()[not(self::jnl:email)]/node()">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="aff" rid="</xsl:text>
					<xsl:value-of select="@id"/>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of select="substring-after(@id,'aff')"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:when test="parent::jnl:author-grp[@type = 'editor']">
				<xsl:text disable-output-escaping="yes">&lt;xref ref-type="aff" rid="</xsl:text>
				<xsl:text>edit</xsl:text>
				<xsl:value-of select="substring-after(@id,'e')"/>
				<xsl:text disable-output-escaping="yes">"&gt;&lt;/xref&gt;</xsl:text>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
				<xsl:text disable-output-escaping="yes">&lt;xref ref-type="aff" rid="</xsl:text>
				<xsl:value-of select="@id"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:value-of select="substring-after(@id,'aff')"/>
				<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="count(//jnl:author-grp[1]/jnl:aff) &gt; 1 or //jnl:dept-list/jnl:dept">
				<xsl:text disable-output-escaping="yes">&lt;xref ref-type="aff" rid="</xsl:text>
				<xsl:value-of select="@id"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:value-of select="substring-after(@id,'aff')"/>
				<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise> </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:aff[parent::jnl:author-grp]" mode="Referss">
		<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
		<xsl:value-of select="@num"/>
		<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:dept[parent::jnl:dept-list and ancestor::jnl:author-grp]" mode="Refers">
		<xsl:choose>
			<xsl:when test="$AffType = 1">
				<xsl:if
					test="jnl:org-name/node() | jnl:org-div/node() | jnl:address/node()[not(self::jnl:email)]/node()">
					<xsl:element name="xref">
						<xsl:attribute name="ref-type">aff</xsl:attribute>
						<xsl:attribute name="rid">
							<xsl:value-of select="@id"/>
						</xsl:attribute>
						<xsl:if test="@num and @num != ''">
							<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
							<xsl:apply-templates select="@num"/>
							<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
						</xsl:if>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="xref">
					<xsl:attribute name="ref-type">aff</xsl:attribute>
					<xsl:attribute name="rid">
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<xsl:if test="@num and @num != ''">
						<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
						<xsl:apply-templates select="@num"/>
						<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					</xsl:if>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:aff[parent::jnl:author-grp]" mode="Refersemail">
		<xsl:variable name="CorAuthors">
			<xsl:choose>
				<xsl:when test="//jnl:corresponding-author">
					<xsl:value-of select="count(//jnl:corresponding-author)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Authemail">
			<xsl:choose>
				<xsl:when test="preceding-sibling::jnl:aff/jnl:address/jnl:email/node()">
					<xsl:value-of
						select="count(preceding-sibling::jnl:aff[jnl:address/jnl:email/node()])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="jnl:address/jnl:email/node()"> </xsl:if>
	</xsl:template>
	<xsl:template match="jnl:dept[parent::jnl:dept-list and ancestor::jnl:author-grp]"
		mode="Refersemail">
		<xsl:variable name="CorAuthors">
			<xsl:choose>
				<xsl:when test="//jnl:corresponding-author">
					<xsl:value-of select="count(//jnl:corresponding-author)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Authemail">
			<xsl:choose>
				<xsl:when test="preceding-sibling::jnl:aff/jnl:address/jnl:email/node()">
					<xsl:value-of
						select="count(preceding-sibling::jnl:aff[jnl:address/jnl:email/node()])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="jnl:address/jnl:email/node()"> </xsl:if>
	</xsl:template>
	<xsl:template match="jnl:aff[parent::jnl:author-grp]" mode="JEmail">
		<xsl:variable name="CorAuthors">
			<xsl:choose>
				<xsl:when test="//jnl:corresponding-author">
					<xsl:value-of select="count(//jnl:corresponding-author)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Authemail">
			<xsl:choose>
				<xsl:when test="preceding-sibling::jnl:aff/jnl:address/jnl:email/node()">
					<xsl:value-of
						select="count(preceding-sibling::jnl:aff[jnl:address/jnl:email/node()])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="jnl:address/jnl:email/node()">
			<xsl:element name="corresp">
				<xsl:attribute name="id">
					<xsl:text>n</xsl:text>
					<xsl:value-of select="$CorAuthors + $Authemail + 101"/>
				</xsl:attribute>
				<xsl:apply-templates select="jnl:address/jnl:email" mode="corraff"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:dept-list[parent::jnl:author-grp]" mode="JEmail">
		<xsl:variable name="CorAuthors">
			<xsl:choose>
				<xsl:when test="//jnl:corresponding-author">
					<xsl:value-of select="count(//jnl:corresponding-author)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Authemail">
			<xsl:choose>
				<xsl:when test="preceding-sibling::jnl:aff/jnl:address/jnl:email/node()">
					<xsl:value-of
						select="count(preceding-sibling::jnl:aff[jnl:address/jnl:email/node()])"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="jnl:address/jnl:email/node()">
			<xsl:element name="corresp">
				<xsl:attribute name="id">
					<xsl:text>n</xsl:text>
					<xsl:value-of select="$CorAuthors + $Authemail + 101"/>
				</xsl:attribute>
				<xsl:apply-templates select="jnl:address/jnl:email" mode="corraff"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:aff[parent::jnl:author-grp]" mode="Email">
		<xsl:if test="jnl:address/jnl:email/node()">
			<xsl:apply-templates select="jnl:address/jnl:email" mode="affss"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:initial[ancestor::jnl:author-grp and parent::jnl:author]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:initial or self::jnl:forename]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'"/>
			<xsl:otherwise>
				<xsl:text>.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:initial[parent::jnl:revr]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:initial or self::jnl:forename]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates mode="nodot"/>
		<xsl:choose>
			<xsl:when test="ancestor::jnl:abstract">
				<xsl:text>.</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:initial[parent::jnl:editor]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:initial or self::jnl:forename]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates mode="nodot"/>
		<xsl:choose>
			<xsl:when test="ancestor::jnl:abstract">
				<xsl:text>.</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:initial[ancestor::jnl:author-grp and parent::jnl:corresponding-author]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates mode="nodot"/>
	</xsl:template>
	<xsl:template match="jnl:forename[ancestor::jnl:author-grp and parent::jnl:author]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:initial or self::jnl:forename]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:forename[parent::jnl:revr]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:initial or self::jnl:forename]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:forename[parent::jnl:editor]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[self::jnl:initial or self::jnl:forename]">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template
		match="jnl:forename[ancestor::jnl:author-grp and parent::jnl:corresponding-author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template
		match="jnl:forename[ancestor::jnl:author-grp and parent::jnl:corresponding-author]"
		mode="getname">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template
		match="jnl:ac-degree[ancestor::jnl:author-grp and parent::jnl:corresponding-author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:role[ancestor::jnl:author-grp and parent::jnl:corresponding-author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template
		match="jnl:americanism[ancestor::jnl:author-grp and parent::jnl:corresponding-author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:role[ancestor::jnl:author-grp and parent::jnl:author]">
		<xsl:if test="preceding-sibling::jnl:role">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:americanism[ancestor::jnl:author-grp and parent::jnl:author]">
		<xsl:if test="preceding-sibling::jnl:americanism">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:ac-degree[ancestor::jnl:author-grp and parent::jnl:author]">
		<xsl:if test="preceding-sibling::jnl:ac-degree">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:emph" mode="justchar">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:emph" mode="justcharr">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:emph">
		<xsl:choose>
			<xsl:when test="@type='italic' and ancestor::jnl:pub-tl">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when
				test="@type='bold' and parent::tbl:title[parent::tbl:table] and //jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@type='sup' and parent::jnl:surname">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="ancestor::jnl:noteref">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@type='bold'">
				<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='underline'">
				<xsl:text disable-output-escaping="yes">&lt;underline&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/underline&gt;</xsl:text>
			</xsl:when>
			<xsl:when
				test="@type='italic' and parent::jnl:p[@type = 'genus-normal-para' or @type = 'genus-small-para']">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus-species"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='italic' and parent::jnl:p[@type = 'genus-centre']">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='genus'">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='genus-species'">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus-species"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='italic'">
				<xsl:choose>
					<xsl:when
						test="ancestor::jnl:othinfo[preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit and not(parent::jnl:cit/jnl:pub-tl)]">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;italic&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='bold-italic'">
				<xsl:choose>
					<xsl:when
						test="ancestor::jnl:othinfo[preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit and not(parent::jnl:cit/jnl:pub-tl)]">
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;&lt;italic&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;&lt;/bold&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='bold_italic'">
				<xsl:choose>
					<xsl:when
						test="ancestor::jnl:othinfo[preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit and not(parent::jnl:cit/jnl:pub-tl)]">
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;&lt;italic&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;&lt;/bold&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='smallcaps' and parent::jnl:title">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@type='smallcaps'">
				<xsl:choose>
					<xsl:when test="parent::jnl:city or parent::jnl:postbox or parent::jnl:postcode">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:when test="parent::jnl:street or parent::jnl:state or parent::jnl:country">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:when test="parent::jnl:org-name or parent::jnl:org-div">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:when test="ancestor::jnl:citref and $RefSup = '1'">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;sc&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/sc&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='sup'">
				<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='inf'">
				<xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:surname[ancestor::jnl:toc-entry and parent::jnl:author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:forename[ancestor::jnl:toc-entry and parent::jnl:author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:initial[ancestor::jnl:toc-entry and parent::jnl:author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:ac-degree[ancestor::jnl:toc-entry and parent::jnl:author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:surname[ancestor::jnl:author-grp and parent::jnl:corresponding-author]">
		<xsl:if test="preceding-sibling::node()">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:note[ancestor::jnl:author-grp and parent::jnl:corresponding-author]">
		<xsl:choose>
			<xsl:when test="$CustCode = 'plos'">
				<xsl:if test="preceding-sibling::jnl:note[@type = 'email']">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>E-mail: </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="preceding-sibling::node()">
					<xsl:text>. </xsl:text>
				</xsl:if>
				<xsl:text>E-mail:</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:surname[ancestor::jnl:author-grp and parent::jnl:corresponding-author]"
		mode="getname">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:history">
		<xsl:element name="history">
			<xsl:apply-templates select="jnl:received"/>
			<xsl:apply-templates select="jnl:revised"/>
			<xsl:apply-templates select="jnl:accepted"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:abstract">
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'GHS'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ghs'">

				<xsl:choose>
					<xsl:when test="@type and @type = 'summary'">

						<xsl:element name="abstract">
							<xsl:attribute name="abstract-type">
								<xsl:text>precis</xsl:text>
							</xsl:attribute>
							<xsl:apply-templates/>
						</xsl:element>

						<xsl:element name="abstract">
							<xsl:attribute name="abstract-type">
								<xsl:text>teaser</xsl:text>
							</xsl:attribute>
							<xsl:apply-templates/>
						</xsl:element>

					</xsl:when>
					<xsl:otherwise>

						<xsl:element name="abstract">
							<xsl:apply-templates/>
						</xsl:element>


					</xsl:otherwise>
				</xsl:choose>

			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="abstract">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-centre']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_centre</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-centre-contents']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_centre</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-left']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_left</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-hang']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_hang</xsl:text>
			</xsl:attribute>
			<xsl:if test="@num and @num != ''">
				<xsl:apply-templates select="@num"/>
				<xsl:if test="node()">
					<xsl:text> </xsl:text>
				</xsl:if>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-hang-small']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_hang_small</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-indent']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_indent</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-normal-para']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_indent</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:p[@type = 'genus-small-para']" priority="2">
		<xsl:element name="p">
			<xsl:attribute name="content-type">
				<xsl:text>syn_hang</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="write-pages">
		<xsl:param name="rids-content"/>
		<xsl:variable name="normal-attr-value" select="normalize-space($rids-content)"/>
		<xsl:if test="$normal-attr-value != ''">
			<xsl:choose>
				<xsl:when test="contains($normal-attr-value, ',')">
					<xsl:variable name="first" select="substring-before($normal-attr-value,',')"/>
					<xsl:variable name="rest" select="substring-after($normal-attr-value,',')"/>
					<xsl:text disable-output-escaping="yes">&lt;related-article related-article-type="in-this-issue" vol="</xsl:text>
					<xsl:value-of select="$fissue"/>
					<xsl:text>" page="</xsl:text>
					<xsl:value-of select="$first"/>
					<xsl:text>" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="</xsl:text>
					<xsl:value-of select="$RfileCcode"/>
					<xsl:value-of select="$first"/>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of select="$first"/>
					<xsl:text disable-output-escaping="yes">&lt;/related-article&gt;, </xsl:text>
					<xsl:call-template name="write-pages">
						<xsl:with-param name="rids-content" select="$rest"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&lt;related-article related-article-type="in-this-issue" vol="</xsl:text>
					<xsl:value-of select="$fissue"/>
					<xsl:text>" page="</xsl:text>
					<xsl:value-of select="$normal-attr-value"/>
					<xsl:text>" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="</xsl:text>
					<xsl:value-of select="$RfileCcode"/>
					<xsl:value-of select="$normal-attr-value"/>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of select="$normal-attr-value"/>
					<xsl:text disable-output-escaping="yes">&lt;/related-article&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:p" priority="1">
		<xsl:element name="p">
			<xsl:choose>
				<xsl:when test="parent::jnl:section[@type and @type = 'RelatedTo']">
					<xsl:variable name="part1">
						<xsl:apply-templates mode="justchar"/>
					</xsl:variable>
					<xsl:variable name="part2">
						<xsl:value-of
							select="translate($part1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
						/>
					</xsl:variable>
					<xsl:variable name="otext">
						<xsl:choose>
							<xsl:when test="starts-with($part2 , 'see p ')">
								<xsl:text>See pages </xsl:text>
							</xsl:when>
							<xsl:when test="starts-with($part2 , 'see pages ')">
								<xsl:text>See pages </xsl:text>
							</xsl:when>
							<xsl:when test="starts-with($part2 , 'see page ')">
								<xsl:text>See pages </xsl:text>
							</xsl:when>
							<xsl:when test="starts-with($part2 , 'see pages')">
								<xsl:text>See pages </xsl:text>
							</xsl:when>
							<xsl:when test="starts-with($part2 , 'see page')">
								<xsl:text>See pages </xsl:text>
							</xsl:when>
							<xsl:when test="starts-with($part2 , 'see p')">
								<xsl:text>See pages </xsl:text>
							</xsl:when>
							<xsl:otherwise> </xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$otext != ''">
							<xsl:variable name="rtext">
								<xsl:choose>
									<xsl:when test="starts-with($part2 , 'see p ')">
										<xsl:value-of select="substring-after($part2,'see p ')"/>
									</xsl:when>
									<xsl:when test="starts-with($part2 , 'see pages ')">
										<xsl:value-of select="substring-after($part2,'see pages ')"
										/>
									</xsl:when>
									<xsl:when test="starts-with($part2 , 'see page ')">
										<xsl:value-of select="substring-after($part2,'see page ')"/>
									</xsl:when>
									<xsl:when test="starts-with($part2 , 'see pages')">
										<xsl:value-of select="substring-after($part2,'see pages')"/>
									</xsl:when>
									<xsl:when test="starts-with($part2 , 'see page')">
										<xsl:value-of select="substring-after($part2,'see page')"/>
									</xsl:when>
									<xsl:when test="starts-with($part2 , 'see p')">
										<xsl:value-of select="substring-after($part2,'see p')"/>
									</xsl:when>
								</xsl:choose>
							</xsl:variable>
							<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
							<xsl:value-of select="$otext"/>
							<xsl:call-template name="write-pages">
								<xsl:with-param name="rids-content" select="$rtext"/>
							</xsl:call-template>
							<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
					<xsl:choose>
						<xsl:when test="parent::jnl:acks">
							<xsl:choose>
								<xsl:when test="jnl:url">
									<xsl:choose>
										<xsl:when test="jnl:emph[@type and @type = 'italic']">
											<xsl:for-each select="node()">
												<xsl:choose>
												<xsl:when
												test="following-sibling::jnl:emph[@type and @type = 'italic']">
												<xsl:apply-templates select="self::node()"/>
												</xsl:when>
												<xsl:when
												test="self::jnl:emph[@type and @type = 'italic']">
												<xsl:text disable-output-escaping="yes">&lt;uri xlink:href="</xsl:text>
												<xsl:apply-templates
												select="following-sibling::jnl:url/node()"
												mode="justcharr"/>
												<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
												<xsl:apply-templates select="self::node()"
												mode="justchar"/>
												</xsl:when>
												<xsl:when test="self::jnl:url"/>
												<xsl:when test="self::jnl:emph">
												<xsl:apply-templates select="self::node()"
												mode="justchar"/>
												</xsl:when>
												<xsl:when
												test="self::text() and following-sibling::node()[position() = 1 and self::jnl:url]">
												<xsl:variable name="content" select="."/>
												<xsl:choose>
												<xsl:when test="contains($content , '. ')">
												<xsl:value-of
												select="substring-before($content,'. ')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="$content"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates select="self::node()"/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="node()">
												<xsl:choose>
												<xsl:when
												test="following-sibling::node()[self::text()[contains(. , '.')] and following-sibling::node()[position() = 1 and self::processing-instruction('ENTCHAR')[. = 'semi']]]">
												<xsl:apply-templates select="self::node()"/>
												</xsl:when>
												<xsl:when
												test="self::text()[contains(. , '.')] and following-sibling::node()[position() = 1 and self::processing-instruction('ENTCHAR')[. = 'semi']]">
												<xsl:call-template name="write-before-period">
												<xsl:with-param name="rids-text" select="."/>
												</xsl:call-template>
												<xsl:text disable-output-escaping="yes">&lt;uri xlink:href="</xsl:text>
												<xsl:apply-templates
												select="following-sibling::jnl:url/node()"
												mode="justcharr"/>
												<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
												<xsl:call-template name="write-after-period">
												<xsl:with-param name="rids-text" select="."/>
												</xsl:call-template>
												</xsl:when>
												<xsl:when test="self::jnl:url"/>
												<xsl:when test="self::jnl:emph">
												<xsl:apply-templates select="self::node()"
												mode="justchar"/>
												</xsl:when>
												<xsl:when
												test="self::text() and following-sibling::node()[position() = 1 and self::jnl:url]">
												<xsl:variable name="content" select="."/>
												<xsl:choose>
												<xsl:when test="contains($content , '. ')">
												<xsl:value-of
												select="substring-before($content,'. ')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="$content"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates select="self::node()"/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text disable-output-escaping="yes">&lt;/uri&gt;.</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:choose>
			<xsl:when test="ancestor::jnl:footnote"/>
			<xsl:when test="ancestor::jnl:tbl"/>
			<xsl:when test="ancestor::jnl:fig"/>
			<xsl:when test="descendant::jnl:figref or descendant::jnl:tblref">
				<xsl:for-each select="descendant::jnl:figref">
					<xsl:sort select="string-length(@rids)"/>
					<xsl:sort select="@rids"/>
					<xsl:variable name="fids">
						<xsl:value-of select="@rids"/>
					</xsl:variable>
					<xsl:variable name="fidused">
						<xsl:for-each select="preceding::jnl:figref">
							<xsl:choose>
								<xsl:when test="@rids and @rids = $fids">
									<xsl:choose>
										<xsl:when test="ancestor::jnl:footnote"/>
										<xsl:when test="ancestor::jnl:tbl"/>
										<xsl:when test="ancestor::jnl:fig"/>
										<xsl:when test="ancestor::jnl:p">
											<xsl:text>1</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="$fidused = ''">
						<xsl:for-each select="//jnl:fig[@id and @id = $fids]">
							<xsl:variable name="ftype">
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
										<xsl:apply-templates select="self::node()" mode="Mtype"/>
									</xsl:when>
								</xsl:choose>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$ftype = ''">
									<xsl:variable name="fid">
										<xsl:value-of select="substring-after(@id,'fig')"/>
									</xsl:variable>
									<xsl:variable name="gid">
										<xsl:value-of select="jnl:graphic/@id"/>
									</xsl:variable>
									<xsl:element name="fig">
										<xsl:attribute name="id">
											<xsl:text>f</xsl:text>
											<xsl:choose>
												<xsl:when test="$fid > 9">
												<xsl:text/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>0</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="$fid"/>
										</xsl:attribute>
										<xsl:attribute name="position">
											<xsl:text>float</xsl:text>
										</xsl:attribute>
										<xsl:if test="@num and @num !=''">
											<xsl:element name="label">
												<xsl:choose>
												<xsl:when test="$FigReduce = 1">
												<xsl:text>Fig. </xsl:text>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>Figure </xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:apply-templates select="@num"/>
												<xsl:text>.</xsl:text>
											</xsl:element>
										</xsl:if>
										<xsl:choose>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">

												<xsl:element name="caption">
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
												<xsl:element name="title">
												<xsl:apply-templates select="jnl:caption[1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:for-each select="jnl:caption[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
												<xsl:variable name="contents">
												<xsl:for-each select="node()[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												</xsl:variable>
												<xsl:choose>
												<xsl:when test="$contents != ''">
												<xsl:for-each select="node()[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title">
												<xsl:apply-templates/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												<xsl:choose>
												<xsl:when
												test="node()[position() = 2 and self::text()[. = ' ']] and node()[position() &gt; 2]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="p">
												<xsl:value-of
												select="substring-after(node()[position() = 2]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when test="node()[position() = 2]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[. = ' ']] and node()[position() = 3 and self::jnl:emph[@type = 'bold']]">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 3]/node()"/>
												</xsl:element>
												<xsl:choose>
												<xsl:when
												test="node()[position() = 4 and self::text()[. = ' ']] and node()[position() &gt; 4]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 4]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 4 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="p">
												<xsl:value-of
												select="substring-after(node()[position() = 4]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 4]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when test="node()[position() = 4]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 3]"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="title">
												<xsl:value-of
												select="substring-after(node()[position() = 2]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title20">
												<xsl:apply-templates/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="p">
												<xsl:apply-templates select="jnl:caption[1]"/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:apply-templates
												select="jnl:caption[position() > 1]"/>
												</xsl:element>
											</xsl:when>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
												<xsl:element name="caption">
												<xsl:element name="p">
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
												<xsl:element name="title">
												<xsl:apply-templates select="jnl:caption[1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:for-each select="jnl:caption[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::jnl:emph[@type = 'bold']]">
												<xsl:variable name="contents">
												<xsl:for-each select="node()[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												</xsl:variable>
												<xsl:choose>
												<xsl:when test="$contents != ''">
												<xsl:for-each select="node()[position() = 1]">
												<xsl:choose>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title">
												<xsl:apply-templates/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												<xsl:choose>
												<xsl:when
												test="node()[position() = 2 and self::text()[. = ' ']] and node()[position() &gt; 2]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="p">
												<xsl:value-of
												select="substring-after(node()[position() = 2]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when test="node()[position() = 2]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[. = ' ']] and node()[position() = 3 and self::jnl:emph[@type = 'bold']]">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 3]/node()"/>
												</xsl:element>
												<xsl:choose>
												<xsl:when
												test="node()[position() = 4 and self::text()[. = ' ']] and node()[position() &gt; 4]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 4]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 4 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="p">
												<xsl:value-of
												select="substring-after(node()[position() = 4]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 4]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when test="node()[position() = 4]">
												<xsl:element name="p">
												<xsl:apply-templates
												select="node()[position() > 3]"/>
												</xsl:element>
												</xsl:when>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 2 and self::text()[starts-with(. , ' ')]]">
												<xsl:element name="title">
												<xsl:value-of
												select="substring-after(node()[position() = 2]/. ,' ')"/>
												<xsl:apply-templates
												select="node()[position() > 2]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'Fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'fig')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:when
												test="node()[position() = 1 and self::text()] and contains(node()[position() = 1 and self::text()]/. , 'FIG')">
												<xsl:element name="title">
												<xsl:apply-templates
												select="node()[position() = 1]" mode="removefig"/>
												<xsl:apply-templates
												select="node()[position() > 1]"/>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:element name="title20">
												<xsl:apply-templates/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates select="jnl:caption[1]"/>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:apply-templates
												select="jnl:caption[position() > 1]"/>
												</xsl:element>
												</xsl:element>
											</xsl:when>
										</xsl:choose>

										<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
										<xsl:choose>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>bio.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
												<xsl:text>jcs-</xsl:text>
												<xsl:value-of select="$fvolume"/>
												<xsl:text>-</xsl:text>
												<xsl:choose>
												<xsl:when test="$fissue > 9">
												<xsl:text/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>0</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:value-of select="$fissue"/>
												<xsl:text>-</xsl:text>
												<xsl:value-of select="$ffpage"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:text>-f</xsl:text>
										<xsl:choose>
											<xsl:when test="$fid > 9">
												<xsl:text/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>0</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:value-of select="$fid"/>
										<xsl:text>.tif</xsl:text>
										<xsl:text disable-output-escaping="yes">"&gt;&lt;/graphic&gt;</xsl:text>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="descendant::jnl:tblref">
					<xsl:sort select="string-length(@rids)"/>
					<xsl:sort select="@rids"/>
					<xsl:variable name="fids">
						<xsl:value-of select="@rids"/>
					</xsl:variable>
					<xsl:variable name="fidused">
						<xsl:for-each select="preceding::jnl:tblref">
							<xsl:choose>
								<xsl:when test="@rids and @rids = $fids">
									<xsl:choose>
										<xsl:when test="ancestor::jnl:footnote"/>
										<xsl:when test="ancestor::jnl:tbl"/>
										<xsl:when test="ancestor::jnl:fig"/>
										<xsl:when test="ancestor::jnl:p">
											<xsl:text>1</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="$fidused = ''">
						<xsl:for-each select="//jnl:tbl[@id and @id = $fids]">
							<xsl:variable name="ftype">
								<xsl:choose>
									<xsl:when
										test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
										<xsl:apply-templates select="self::node()" mode="Mtype"/>
									</xsl:when>
								</xsl:choose>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$ftype = ''">
									<xsl:variable name="fid">
										<xsl:value-of select="substring-after(@id,'tbl')"/>
									</xsl:variable>
									<xsl:element name="table-wrap">
										<xsl:attribute name="id">
											<xsl:text>t</xsl:text>
											<xsl:choose>
												<xsl:when test="$fid > 9">
												<xsl:text/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>0</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="$fid"/>
										</xsl:attribute>
										<xsl:attribute name="position">
											<xsl:text>float</xsl:text>
										</xsl:attribute>
										<xsl:if test="@num and @num !=''">
											<xsl:element name="label">
												<xsl:text>Table </xsl:text>
												<xsl:apply-templates select="@num"/>
												<xsl:text>.</xsl:text>
											</xsl:element>
										</xsl:if>
										<xsl:apply-templates select="tbl:table"/>
										<xsl:choose>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
												<xsl:choose>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>bio.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>bio.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'bio.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bio')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bio')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIO')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIO')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'bin')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'bin')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'BIN')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'BIN')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
												<xsl:variable name="doi">
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:variable>
												<xsl:text>jcs.</xsl:text>
												<xsl:choose>
												<xsl:when test="starts-with($doi , 'ces.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES.')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES.')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'ces')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'ces')"/>
												</xsl:when>
												<xsl:when test="starts-with($doi , 'CES')">
												<xsl:value-of disable-output-escaping="yes"
												select="substring-after($doi, 'CES')"/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of disable-output-escaping="yes"
												select="$doi"/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates
												select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:text>-t</xsl:text>
												<xsl:choose>
												<xsl:when test="$fid > 9">
												<xsl:text/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>0</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												<xsl:value-of select="$fid"/>
												<xsl:text>.tif</xsl:text>
												<xsl:text disable-output-escaping="yes">"&gt;&lt;/graphic&gt;</xsl:text>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when
												test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"/>
											<xsl:otherwise>
												<xsl:if test="jnl:tfootnote">
												<xsl:element name="table-wrap-foot">
												<xsl:apply-templates select="jnl:tfootnote"/>
												</xsl:element>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:p[parent::tbl:entry]" priority="3">
		<xsl:choose>
			<xsl:when test="node()[position() = 1 and self::processing-instruction('ENTCHAR')]">
				<xsl:apply-templates select="node()[position() = 1]" mode="notemph"/>
				<xsl:apply-templates select="node()[position() > 1]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="jnl:p[parent::tbl:entry]" priority="4">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:body">
		<xsl:apply-templates
			select="node()[not(self::jnl:section) or self::jnl:section[not(@type = 'MoreInfo')]]"/>
	</xsl:template>
	<xsl:template match="jnl:citref">
		<xsl:choose>
			<xsl:when test="contains(@rids,' ')">
				<xsl:variable name="rline" select="node()"/>
				<xsl:variable name="tline">
					<xsl:apply-templates/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="contains($tline ,'-') and contains($tline , ', ')">
						<xsl:call-template name="write-refs-both">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($tline ,'-') and contains($tline , ',')">
						<xsl:call-template name="write-refs-both">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($tline ,'-') and contains($tline , ' ')">
						<xsl:call-template name="write-refs-both">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($tline,'-')">
						<xsl:call-template name="write-refs-ndash">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($tline,', ')">
						<xsl:call-template name="write-refs-comma">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($tline,',')">
						<xsl:call-template name="write-refs-comma">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="contains($tline,' ')">
						<xsl:call-template name="write-refs-comma">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="write-refs">
							<xsl:with-param name="rids-attribute-value" select="@rids"/>
							<xsl:with-param name="rids-content" select="$rline"/>
							<xsl:with-param name="rids-text" select="$tline"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="rrids" select="@rids"/>
				<xsl:choose>
					<xsl:when test="//jnl:cit[@id = $rrids]">
						<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
						<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						<xsl:if test="$CustCode = 'plos' and node()">
							<xsl:text disable-output-escaping="yes"> &amp;lsqb;</xsl:text>
						</xsl:if>
						<xsl:apply-templates/>
						<xsl:if test="$CustCode = 'plos' and node()">
							<xsl:text disable-output-escaping="yes">&amp;rsqb;</xsl:text>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					</xsl:when>
					<xsl:when test="//jnl:art-desc[@id = $rrids]">
						<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
						<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"/>
						<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						<xsl:if test="$CustCode = 'plos' and node()">
							<xsl:text disable-output-escaping="yes"> &amp;lsqb;</xsl:text>
						</xsl:if>
						<xsl:apply-templates/>
						<xsl:if test="$CustCode = 'plos' and node()">
							<xsl:text disable-output-escaping="yes">&amp;rsqb;</xsl:text>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:art-desc[parent::jnl:sub-art-rev]" mode="refer">
		<xsl:text>b</xsl:text>
		<xsl:variable name="Number" select="count(preceding::jnl:art-desc/jnl:corporate-author) + 1"/>
		<xsl:value-of select="$Number"/>
	</xsl:template>
	<xsl:template
		match="jnl:cit[ancestor::jnl:abstract[parent::jnl:doc]] |jnl:cit[ancestor::jnl:back] | jnl:cit[ancestor::jnl:letter] | jnl:cit[ancestor::jnl:book-rev]"
		mode="refer">
		<xsl:text>b</xsl:text>
		<xsl:variable name="Number">
			<xsl:value-of select="substring-after(@id,'ref')"/>
		</xsl:variable>
		<xsl:value-of select="$Number"/>
	</xsl:template>
	<xsl:template match="jnl:fig" mode="Mtype">
		<xsl:choose>
			<xsl:when test="@num and starts-with(@num , 's')">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="@num and starts-with(@num , 'S')">
				<xsl:text>1</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:tbl" mode="Mtype">
		<xsl:choose>
			<xsl:when test="@num and starts-with(@num , 's')">
				<xsl:text>1</xsl:text>
			</xsl:when>
			<xsl:when test="@num and starts-with(@num , 'S')">
				<xsl:text>1</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:figref">
		<xsl:choose>
			<xsl:when test="@rids and @rids != ''">
				<xsl:variable name="fids">
					<xsl:value-of select="@rids"/>
				</xsl:variable>
				<xsl:variable name="ftype">
					<xsl:choose>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
							<xsl:apply-templates select="//jnl:fig[@id = $fids]" mode="Mtype"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$ftype = ''">
						<xsl:variable name="fid">
							<xsl:value-of select="substring-after(@rids,'fig')"/>
						</xsl:variable>
						<xsl:text disable-output-escaping="yes">&lt;xref ref-type="fig" rid="</xsl:text>
						<xsl:text>f</xsl:text>
						<xsl:choose>
							<xsl:when test="$fid > 9">
								<xsl:text/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>0</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="$fid"/>
						<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:noteref">
		<xsl:variable name="fid">
			<xsl:value-of select="@rids"/>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="contains($fid, 'fn') and ancestor::jnl:author">
				<xsl:variable name="partA">
					<xsl:apply-templates select="//jnl:footnote[@id = $fid]/node()"/>
				</xsl:variable>
				<xsl:variable name="corr"
					select="translate($partA , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:choose>
					<xsl:when test="contains($corr , 'CORRESP')">
						<xsl:text disable-output-escaping="yes">&lt;xref ref-type="corresp" rid="cor1"&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;xref ref-type="fn" rid="</xsl:text>
						<xsl:value-of select="$fid"/>
						<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="contains($fid, 'tfootnote')">
				<xsl:text disable-output-escaping="yes">&lt;xref ref-type="table-fn" rid="</xsl:text>
				<xsl:text>nt</xsl:text>
				<xsl:value-of select="substring-after(@rids,'tfootnote') + 100"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="contains($fid, 'noteref')">
				<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
				<xsl:text>nr</xsl:text>
				<xsl:value-of select="substring-after(@rids,'noteref')"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="//jnl:footnote[not(ancestor::jnl:author-grp) and @id = $fid]">
				<xsl:variable name="footref">
					<xsl:apply-templates
						select="//jnl:footnote[not(ancestor::jnl:author-grp) and @id = $fid]"
						mode="backfootref"/>
				</xsl:variable>
				<xsl:text disable-output-escaping="yes">&lt;xref ref-type="fn" rid="</xsl:text>
				<xsl:value-of select="$footref"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:tblref">
		<xsl:variable name="fid">
			<xsl:value-of select="substring-after(@rids,'tbl')"/>
		</xsl:variable>
		<xsl:variable name="fids">
			<xsl:value-of select="@rids"/>
		</xsl:variable>
		<xsl:variable name="ftype">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
					<xsl:apply-templates select="//jnl:tbl[@id = $fids]" mode="Mtype"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$ftype = ''">
				<xsl:text disable-output-escaping="yes">&lt;xref ref-type="table" rid="</xsl:text>
				<xsl:text>t</xsl:text>
				<xsl:choose>
					<xsl:when test="$fid > 9">
						<xsl:text/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$fid"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:equref">
		<xsl:variable name="fid">
			<xsl:value-of select="substring-after(@rids,'equ')"/>
		</xsl:variable>
		<xsl:variable name="fids">
			<xsl:value-of select="@rids"/>
		</xsl:variable>
		<xsl:text disable-output-escaping="yes">&lt;xref ref-type="disp-formula" rid="</xsl:text>
		<xsl:text>e</xsl:text>
		<xsl:choose>
			<xsl:when test="$fid > 9">
				<xsl:text/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>0</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$fid"/>
		<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
	</xsl:template>
	<xsl:template name="write-refs">
		<xsl:param name="rids-attribute-value"/>
		<xsl:param name="rids-content"/>
		<xsl:param name="rids-text"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
			<xsl:variable name="refer" select="substring-after($first,'ref')"/>
			<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
			<xsl:choose>
				<xsl:when test="$rest !=''">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:choose>
						<xsl:when test="contains($rids-text, '&amp;semi;')">
							<xsl:variable name="first1"
								select="substring-before($rids-text,'&amp;semi;')"/>
							<xsl:variable name="rest1"
								select="substring-after($rids-text,'&amp;semi;')"/>
							<xsl:if test="$CustCode = 'plos'">
								<xsl:text disable-output-escaping="yes"> &amp;lsqb;</xsl:text>
							</xsl:if>
							<xsl:call-template name="write-amps">
								<xsl:with-param name="string" select="$first1"/>
							</xsl:call-template>
							<xsl:if test="$CustCode = 'plos'">
								<xsl:text disable-output-escaping="yes">&amp;rsqb;</xsl:text>
							</xsl:if>
							<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&amp;semi; </xsl:text>
							<xsl:call-template name="write-refs">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rids-content"/>
								<xsl:with-param name="rids-text" select="normalize-space($rest1)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
							<xsl:call-template name="write-refs">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rids-content"/>
								<xsl:with-param name="rids-text" select="$rids-text"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:if test="$CustCode = 'plos'">
						<xsl:text disable-output-escaping="yes"> &amp;lsqb;</xsl:text>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="contains($rids-text , '&amp;')">
							<xsl:call-template name="write-amps">
								<xsl:with-param name="string" select="$rids-text"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$rids-text"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$CustCode = 'plos'">
						<xsl:text disable-output-escaping="yes">&amp;rsqb;</xsl:text>
					</xsl:if>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-affs">
		<xsl:param name="rids-attribute-value"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
			<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
			<xsl:apply-templates select="//jnl:aff[@id = $first]" mode="Refers"/>
			<xsl:apply-templates select="//jnl:dept[@id = $first]" mode="Refers"/>
			<xsl:if test="$rest !=''">
				<xsl:call-template name="write-affs">
					<xsl:with-param name="rids-attribute-value" select="$rest"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-affss">
		<xsl:param name="rids-attribute-value"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
			<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
			<xsl:apply-templates select="//jnl:aff[@id = $first]" mode="Referss"/>
			<xsl:if test="$rest !=''">
				<xsl:text>, </xsl:text>
				<xsl:call-template name="write-affss">
					<xsl:with-param name="rids-attribute-value" select="$rest"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-affs-email">
		<xsl:param name="rids-attribute-value"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
			<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
			<xsl:apply-templates select="//jnl:aff[@id = $first]" mode="Refersemail"/>
			<xsl:if test="$rest !=''">
				<xsl:call-template name="write-affs-email">
					<xsl:with-param name="rids-attribute-value" select="$rest"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-amps">
		<xsl:param name="string"/>
		<xsl:variable name="normal-string" select="$string"/>
		<xsl:choose>
			<xsl:when test="$normal-string != ''">
				<xsl:variable name="start" select="substring-before($normal-string,'&amp;')"/>
				<xsl:variable name="rest" select="substring-after($normal-string,'&amp;')"/>
				<xsl:choose>
					<xsl:when test="$start != '' or $rest != ''">
						<xsl:if test="$start != ''">
							<xsl:value-of select="$start"/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="$rest != ''">
								<xsl:choose>
									<xsl:when
										test="contains($rest,';') and not(contains($rest, '&amp;'))">
										<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
									</xsl:when>
									<xsl:when test="not(contains($rest,';'))">
										<xsl:text disable-output-escaping="yes">&amp;amp;</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="start2"
											select="substring-before($rest,'&amp;')"/>
										<xsl:choose>
											<xsl:when test="contains($start2, ';')">
												<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">&amp;amp;</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="write-amps">
									<xsl:with-param name="string" select="$rest"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text disable-output-escaping="yes">&amp;amp;</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$normal-string"/>
					</xsl:otherwise>
				</xsl:choose>

			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="sectionida">
		<xsl:param name="inumb"/>
		<xsl:param name="ipart"/>
		<xsl:choose>
			<xsl:when test="$inumb &gt; 26">
				<xsl:text>a</xsl:text>
				<xsl:call-template name="sectionida">
					<xsl:with-param name="inumb" select="$inumb - 26"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$inumb &gt; 19">
				<xsl:variable name="bnumb" select="$inumb - 20"/>
				<xsl:value-of select="translate($bnumb , '0123456', 'tuvwxyz')"/>
			</xsl:when>
			<xsl:when test="$inumb &gt; 9">
				<xsl:variable name="bnumb" select="$inumb - 10"/>
				<xsl:value-of select="translate($bnumb , '0123456789', 'jklmnopqrs')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="translate($inumb , '123456789', 'abcdefghi')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="sectionid">
		<xsl:param name="isect"/>
		<xsl:choose>
			<xsl:when test="$isect/ancestor::jnl:section and $isect/parent::jnl:section">
				<xsl:variable name="start" select="count($isect/ancestor::jnl:section)"/>
				<xsl:variable name="next" select="$start div 2"/>
				<xsl:call-template name="sectionid">
					<xsl:with-param name="isect" select="$isect/parent::jnl:section"/>
				</xsl:call-template>
				<xsl:choose>
					<xsl:when test="contains($next,'.')">
						<xsl:choose>
							<xsl:when test="$isect/preceding-sibling::jnl:section">
								<xsl:variable name="subsect"
									select="count($isect/preceding-sibling::jnl:section) + 1"/>
								<xsl:call-template name="sectionida">
									<xsl:with-param name="inumb" select="$subsect"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>a</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$isect/preceding-sibling::jnl:section">
								<xsl:value-of
									select="count($isect/preceding-sibling::jnl:section) + 1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>1</xsl:text>
							</xsl:otherwise>
						</xsl:choose>

					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$isect/parent::jnl:app">
				<xsl:choose>
					<xsl:when test="$isect/preceding::jnl:section[parent::jnl:app]">
						<xsl:value-of
							select="count($isect/preceding::jnl:section[parent::jnl:app]) + 1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$isect/preceding-sibling::jnl:section">
						<xsl:value-of select="count($isect/preceding-sibling::jnl:section) + 1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:section[ancestor::jnl:abstract]">
		<xsl:choose>
			<xsl:when test="@type and @type = 'TextBox'">
				<xsl:element name="boxed-text">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="sec">
					<xsl:if test="not(jnl:title)">
						<xsl:text disable-output-escaping="yes">&lt;title&gt;&lt;/title&gt;</xsl:text>
					</xsl:if>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:toc-section">
		<xsl:element name="sec">
			<xsl:if test="not(jnl:label)">
				<xsl:element name="title"> </xsl:element>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:label[parent::jnl:toc-section]">
		<xsl:element name="title">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:toc-entry">
		<xsl:element name="sec">
			<xsl:choose>
				<xsl:when test="not(jnl:title)">
					<xsl:element name="title"> </xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="jnl:title"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="jnl:author or jnl:fpage">
				<xsl:element name="p">
					<xsl:apply-templates select="jnl:author|jnl:fpage"/>
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:toc-entry]">
		<xsl:element name="title">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:author[parent::jnl:toc-entry]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()[position() = 1 and self::jnl:author]">
				<xsl:text>; </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;italic&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates/>

		<xsl:choose>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:author]"/>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;/italic&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:fpage[parent::jnl:toc-entry]">
		<xsl:choose>
			<xsl:when test="preceding-sibling::node()">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jnl:section[ancestor::jnl:letter]">
		<xsl:choose>
			<xsl:when test="@type and @type = 'TextBox'">
				<xsl:element name="boxed-text">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="sec">
					<xsl:choose>
						<xsl:when test="ancestor::jnl:section and parent::jnl:section">
							<xsl:variable name="start" select="count(ancestor::jnl:section)"/>
							<xsl:variable name="next" select="$start div 2"/>

							<xsl:attribute name="id">
								<xsl:text>s</xsl:text>
								<xsl:call-template name="sectionid">
									<xsl:with-param name="isect" select="parent::jnl:section"/>
								</xsl:call-template>

								<xsl:choose>
									<xsl:when test="contains($next,'.')">
										<xsl:choose>
											<xsl:when test="$CustCode = 'plos'">
												<xsl:variable name="subsect"
												select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"/>
												<xsl:call-template name="sectionida">
												<xsl:with-param name="inumb" select="$subsect"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="preceding-sibling::jnl:section">
												<xsl:variable name="subsect"
												select="count(preceding-sibling::jnl:section) + 1"/>
												<xsl:call-template name="sectionida">
												<xsl:with-param name="inumb" select="$subsect"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>a</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="$CustCode = 'plos'">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
												/>
											</xsl:when>
											<xsl:when test="preceding-sibling::jnl:section">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section) + 1"
												/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>1</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="id">
								<xsl:text>s</xsl:text>
								<xsl:choose>
									<xsl:when test="$CustCode = 'plos'">
										<xsl:value-of
											select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
										/>
									</xsl:when>
									<xsl:when test="preceding-sibling::jnl:section">
										<xsl:value-of
											select="count(preceding-sibling::jnl:section) + 1"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>1</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when
							test="parent::jnl:letter and not(preceding-sibling::jnl:section) and not(following-sibling::jnl:section) and not(jnl:title) and //jnl:salutation/node()">
							<xsl:element name="title">
								<xsl:apply-templates select="//jnl:salutation/."/>
							</xsl:element>
						</xsl:when>
						<xsl:when test="not(jnl:title)">
							<xsl:element name="title"> </xsl:element>
						</xsl:when>
					</xsl:choose>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:section[ancestor::jnl:body or ancestor::jnl:correction]">
		<xsl:choose>
			<xsl:when test="@type and @type = 'CompetingInterests'"/>
			<xsl:when test="@type and @type = 'Contributions'"/>
			<xsl:when test="@type and @type = 'ConflictingInterests'"/>
			<xsl:when
				test="@type and @type = 'EthicsApproval' and //jnl:jnl-info/jnl:abrv-jnl-tl[. = 'BAM'  or . = 'bam']"/>
			<xsl:when
				test="@type and @type = 'PatientConsent' and //jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']"/>
			<xsl:when test="@type and @type = 'Funding'"/>
			<xsl:when test="@type and @type = 'PPR'"/>
			<xsl:when test="@type and @type = 'supplementary-material'">
				<xsl:if test="jnl:p[@type and @type = 'doi']">
					<xsl:text disable-output-escaping="yes">&lt;supplementary-material id="</xsl:text>
					<xsl:variable name="doicontentt">
						<xsl:apply-templates select="jnl:p[@type and @type = 'doi']"/>
					</xsl:variable>
					<xsl:variable name="doicontentn">
						<xsl:choose>
							<xsl:when test="contains($doicontentt, 'journal.')">
								<xsl:value-of select="substring-after($doicontentt,'journal.')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentt, 'JOURNAL.')">
								<xsl:value-of select="substring-after($doicontentt,'JOURNAL.')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentt, 'journal_')">
								<xsl:value-of select="substring-after($doicontentt,'journal_')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentt, 'JOURNAL_')">
								<xsl:value-of select="substring-after($doicontentt,'JOURNAL_')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentt, 'journal-')">
								<xsl:value-of select="substring-after($doicontentt,'journal-')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentt, 'JOURNAL-')">
								<xsl:value-of select="substring-after($doicontentt,'JOURNAL-')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$doicontentt"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="SupType">
						<xsl:choose>
							<xsl:when test="jnl:section/node()[position() = 2 ]">
								<xsl:choose>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'Excel')">
										<xsl:text>1</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'EXCEL')">
										<xsl:text>1</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'Adobe')">
										<xsl:text>3</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'ADOBE')">
										<xsl:text>3</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'Word')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'WORD')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'Tiff')">
										<xsl:text>4</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'TIFF')">
										<xsl:text>4</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'PostScript')">
										<xsl:text>5</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'POSTSCRIPT')">
										<xsl:text>5</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 2 ]/. ,'Postscript')">
										<xsl:text>5</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.txt')">
										<xsl:text>7</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.doc')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.pdf')">
										<xsl:text>3</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.xls')">
										<xsl:text>1</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.gif')">
										<xsl:text>6</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.tif')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.eps')">
										<xsl:text>5</xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="jnl:section/node()[position() = 1 ]">
								<xsl:choose>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'Excel')">
										<xsl:text>1</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'EXCEL')">
										<xsl:text>1</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'Adobe')">
										<xsl:text>3</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'ADOBE')">
										<xsl:text>3</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'Word')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'WORD')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'Tiff')">
										<xsl:text>4</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'TIFF')">
										<xsl:text>4</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'PostScript')">
										<xsl:text>5</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'POSTSCRIPT')">
										<xsl:text>5</xsl:text>
									</xsl:when>
									<xsl:when
										test="contains(jnl:section/node()[position() = 1 ]/. ,'Postscript')">
										<xsl:text>5</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.txt')">
										<xsl:text>7</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.doc')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.pdf')">
										<xsl:text>3</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.xls')">
										<xsl:text>1</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.gif')">
										<xsl:text>6</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.tif')">
										<xsl:text>2</xsl:text>
									</xsl:when>
									<xsl:when test="contains($doicontentn, '.eps')">
										<xsl:text>5</xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.txt')">
								<xsl:text>7</xsl:text>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.doc')">
								<xsl:text>2</xsl:text>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.pdf')">
								<xsl:text>3</xsl:text>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.xls')">
								<xsl:text>1</xsl:text>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.gif')">
								<xsl:text>6</xsl:text>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.tif')">
								<xsl:text>2</xsl:text>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.eps')">
								<xsl:text>5</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="doicontents">
						<xsl:choose>
							<xsl:when test="contains($doicontentn, '.doc')">
								<xsl:value-of select="substring-before($doicontentn,'.doc')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.pdf')">
								<xsl:value-of select="substring-before($doicontentn,'.pdf')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.xls')">
								<xsl:value-of select="substring-before($doicontentn,'.xls')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.gif')">
								<xsl:value-of select="substring-before($doicontentn,'.gif')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.tif')">
								<xsl:value-of select="substring-before($doicontentn,'.tif')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.eps')">
								<xsl:value-of select="substring-before($doicontentn,'.eps')"/>
							</xsl:when>
							<xsl:when test="contains($doicontentn, '.txt')">
								<xsl:value-of select="substring-before($doicontentn,'.txt')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$doicontentn"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="translate($doicontents , '-', '.')"/>
					<xsl:choose>
						<xsl:when test="$SupType = '1'">
							<xsl:text>" mimetype="</xsl:text>
							<xsl:text>application/x-excel</xsl:text>
						</xsl:when>
						<xsl:when test="$SupType = '2'">
							<xsl:text>" mimetype="</xsl:text>
							<xsl:text>application/msword</xsl:text>
						</xsl:when>
						<xsl:when test="$SupType = '3'">
							<xsl:text>" mimetype="</xsl:text>
							<xsl:text>application/pdf</xsl:text>
						</xsl:when>
						<xsl:when test="$SupType = '4'">
							<xsl:text>" mimetype="</xsl:text>
							<xsl:text>image/tif</xsl:text>
						</xsl:when>
						<xsl:when test="$SupType = '5'">
							<xsl:text>" mimetype="</xsl:text>
							<xsl:text>application/postscript</xsl:text>
						</xsl:when>
						<xsl:when test="$SupType = '6'">
							<xsl:text>" mimetype="</xsl:text>
							<xsl:text>image/gif</xsl:text>
						</xsl:when>
						<xsl:when test="$SupType = '7'">
							<xsl:text>" mimetype="</xsl:text>
							<xsl:text>text/plain</xsl:text>
						</xsl:when>
						<xsl:otherwise> </xsl:otherwise>
					</xsl:choose>
					<xsl:text>" xlink:href="</xsl:text>
					<xsl:variable name="part1">
						<xsl:value-of select="translate($doicontents , '-', '.')"/>
						<xsl:choose>
							<xsl:when test="$SupType = '1'">
								<xsl:text>.xls</xsl:text>
							</xsl:when>
							<xsl:when test="$SupType = '2'">
								<xsl:text>.doc</xsl:text>
							</xsl:when>
							<xsl:when test="$SupType = '3'">
								<xsl:text>.pdf</xsl:text>
							</xsl:when>
							<xsl:when test="$SupType = '4'">
								<xsl:text>.tif</xsl:text>
							</xsl:when>
							<xsl:when test="$SupType = '5'">
								<xsl:text>.eps</xsl:text>
							</xsl:when>
							<xsl:when test="$SupType = '6'">
								<xsl:text>.gif</xsl:text>
							</xsl:when>
							<xsl:when test="$SupType = '7'">
								<xsl:text>.txt</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="partA">
						<xsl:choose>
							<xsl:when test="contains($part1 , '-')">
								<xsl:value-of select="substring-before(@part1,'-')"/>
							</xsl:when>
							<xsl:when test="string-length($part1) &gt; 4">
								<xsl:value-of select="substring($part1,1,4)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@part1"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="partB">
						<xsl:choose>
							<xsl:when test="contains($part1 , '-')">
								<xsl:text>-</xsl:text>
								<xsl:value-of select="substring-after(@part1,'-')"/>
							</xsl:when>
							<xsl:when test="string-length($part1) &gt; 4">
								<xsl:value-of select="substring($part1,4)"/>
							</xsl:when>
							<xsl:otherwise> </xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of
						select="translate($partA , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
					<xsl:value-of select="$partB"/>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:call-template name="newline"/>
					<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
					<xsl:apply-templates select="jnl:p[@type and @type = 'label']/node()"/>
					<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
					<xsl:call-template name="newline"/>
					<xsl:text disable-output-escaping="yes">&lt;caption&gt;</xsl:text>
					<xsl:choose>
						<xsl:when test="jnl:section/node()[position() = 2 ]">
							<xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text>
							<xsl:apply-templates select="jnl:section/node()[position() = 1 ]/node()"/>
							<xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
							<xsl:call-template name="newline"/>
							<xsl:apply-templates select="jnl:section/node()[position() > 1 ]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="jnl:section/node()[position() = 1 ]"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&lt;/caption&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/supplementary-material&gt;</xsl:text>
					<xsl:call-template name="newline"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="@type and @type = 'TextBox'">
				<xsl:choose>
					<xsl:when test="jnl:section/jnl:title[. = 'Commentary']"/>
					<xsl:otherwise>
						<xsl:element name="boxed-text">
							<xsl:apply-templates/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="sec">
					<xsl:choose>
						<xsl:when test="ancestor::jnl:section and parent::jnl:section">
							<xsl:variable name="start" select="count(ancestor::jnl:section)"/>
							<xsl:variable name="next" select="$start div 2"/>

							<xsl:attribute name="id">
								<xsl:text>s</xsl:text>
								<xsl:choose>
									<xsl:when
										test="parent::jnl:section[@type and @type = 'TextBox']/jnl:section/jnl:title[. = 'Commentary']">
										<xsl:variable name="start1"
											select="count(parent::jnl:section/preceding-sibling::jnl:section[@type and @type = 'TextBox']/jnl:section/jnl:title[. = 'Commentary']) + 1"/>
										<xsl:variable name="start2"
											select="count(//jnl:body/jnl:section[not(@type and @type = 'TextBox' and jnl:section/jnl:title[. = 'Commentary']) and not(@type = 'Funding')])"/>
										<xsl:value-of select="$start1 + $start2"/>
										<xsl:choose>
											<xsl:when test="preceding-sibling::jnl:section">
												<xsl:variable name="subsect">
												<xsl:choose>
												<xsl:when test="$CustCode = 'plos'">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of
												select="count(preceding-sibling::jnl:section) + 1"
												/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:variable>
												<xsl:call-template name="sectionida">
												<xsl:with-param name="inumb" select="$subsect"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>a</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="sectionid">
											<xsl:with-param name="isect"
												select="parent::jnl:section"/>
										</xsl:call-template>

										<xsl:choose>
											<xsl:when test="contains($next,'.')">
												<xsl:choose>
												<xsl:when test="preceding-sibling::jnl:section">
												<xsl:variable name="subsect">
												<xsl:choose>
												<xsl:when test="$CustCode = 'plos'">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of
												select="count(preceding-sibling::jnl:section) + 1"
												/>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:variable>
												<xsl:call-template name="sectionida">
												<xsl:with-param name="inumb" select="$subsect"/>
												</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>a</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
												<xsl:when test="$CustCode = 'plos'">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
												/>
												</xsl:when>
												<xsl:when test="preceding-sibling::jnl:section">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section) + 1"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>1</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="id">
								<xsl:text>s</xsl:text>
								<xsl:choose>
									<xsl:when test="preceding-sibling::jnl:section">
										<xsl:value-of
											select="count(preceding-sibling::jnl:section[not(@type = 'Funding') and not(jnl:section/jnl:title[. = 'Commentary'])]) + 1"
										/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>1</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="not(jnl:title)">
							<xsl:element name="title">
								<xsl:text/>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="Name">
								<xsl:apply-templates select="jnl:title/node()"/>
							</xsl:variable>
							<xsl:variable name="Name2"
								select="translate($Name , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
							<xsl:choose>
								<xsl:when test="$Name2 = 'materials and methods'">
									<xsl:attribute name="sec-type">
										<xsl:text>materials|methods</xsl:text>
									</xsl:attribute>
								</xsl:when>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:section[ancestor::jnl:body]" mode="secrefer">
		<xsl:choose>
			<xsl:when test="ancestor::jnl:section and parent::jnl:section">
				<xsl:variable name="start" select="count(ancestor::jnl:section)"/>
				<xsl:variable name="next" select="$start div 2"/>

				<xsl:text>s</xsl:text>
				<xsl:call-template name="sectionid">
					<xsl:with-param name="isect" select="parent::jnl:section"/>
				</xsl:call-template>

				<xsl:choose>
					<xsl:when test="contains($next,'.')">
						<xsl:choose>
							<xsl:when test="$CustCode = 'plos'">
								<xsl:variable name="subsect"
									select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"/>
								<xsl:call-template name="sectionida">
									<xsl:with-param name="inumb" select="$subsect"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="preceding-sibling::jnl:section">
								<xsl:variable name="subsect"
									select="count(preceding-sibling::jnl:section) + 1"/>
								<xsl:call-template name="sectionida">
									<xsl:with-param name="inumb" select="$subsect"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>a</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$CustCode = 'plos'">
								<xsl:value-of
									select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
								/>
							</xsl:when>
							<xsl:when test="preceding-sibling::jnl:section">
								<xsl:value-of select="count(preceding-sibling::jnl:section) + 1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>1</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$CustCode = 'plos'">
						<xsl:text>s</xsl:text>
						<xsl:value-of
							select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
						/>
					</xsl:when>
					<xsl:when test="preceding-sibling::jnl:section">
						<xsl:text>s</xsl:text>
						<xsl:value-of select="count(preceding-sibling::jnl:section) + 1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>s1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:section[ancestor::jnl:app]">
		<xsl:choose>
			<xsl:when test="@type and @type = 'TextBox'">
				<xsl:element name="boxed-text">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="sec">
					<xsl:choose>
						<xsl:when test="ancestor::jnl:section and parent::jnl:section">
							<xsl:variable name="start" select="count(ancestor::jnl:section)"/>
							<xsl:variable name="next" select="$start div 2"/>

							<xsl:attribute name="id">
								<xsl:text>sa</xsl:text>
								<xsl:call-template name="sectionid">
									<xsl:with-param name="isect" select="parent::jnl:section"/>
								</xsl:call-template>

								<xsl:choose>
									<xsl:when test="contains($next,'.')">
										<xsl:choose>
											<xsl:when test="$CustCode = 'plos'">
												<xsl:variable name="subsect"
												select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"/>
												<xsl:call-template name="sectionida">
												<xsl:with-param name="inumb" select="$subsect"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="preceding-sibling::jnl:section">
												<xsl:variable name="subsect"
												select="count(preceding-sibling::jnl:section) + 1"/>
												<xsl:call-template name="sectionida">
												<xsl:with-param name="inumb" select="$subsect"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>a</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="$CustCode = 'plos'">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
												/>
											</xsl:when>
											<xsl:when test="preceding-sibling::jnl:section">
												<xsl:value-of
												select="count(preceding-sibling::jnl:section) + 1"
												/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>1</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="preceding::jnl:section[parent::jnl:app]">
									<xsl:attribute name="id">
										<xsl:text>sa</xsl:text>
										<xsl:value-of
											select="count(preceding::jnl:section[parent::jnl:app]) + 1"
										/>
									</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="id">
										<xsl:text>sa1</xsl:text>
									</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="not(jnl:title)">
						<xsl:element name="title">
							<xsl:text/>
						</xsl:element>
					</xsl:if>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:section[ancestor::jnl:app]" mode="secrefer">
		<xsl:choose>
			<xsl:when test="ancestor::jnl:section and parent::jnl:section">
				<xsl:variable name="start" select="count(ancestor::jnl:section)"/>
				<xsl:variable name="next" select="$start div 2"/>

				<xsl:call-template name="sectionid">
					<xsl:with-param name="isect" select="parent::jnl:section"/>
				</xsl:call-template>

				<xsl:choose>
					<xsl:when test="contains($next,'.')">
						<xsl:choose>
							<xsl:when test="$CustCode = 'plos'">
								<xsl:variable name="subsect"
									select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"/>
								<xsl:call-template name="sectionida">
									<xsl:with-param name="inumb" select="$subsect"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="preceding-sibling::jnl:section">
								<xsl:variable name="subsect"
									select="count(preceding-sibling::jnl:section) + 1"/>
								<xsl:call-template name="sectionida">
									<xsl:with-param name="inumb" select="$subsect"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>a</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$CustCode = 'plos'">
								<xsl:value-of
									select="count(preceding-sibling::jnl:section[not(@type = 'Contributions')]) + 1"
								/>
							</xsl:when>
							<xsl:when test="preceding-sibling::jnl:section">
								<xsl:value-of select="count(preceding-sibling::jnl:section) + 1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>1</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="preceding-sibling::jnl:section">
						<xsl:text>sa</xsl:text>
						<xsl:value-of select="count(preceding-sibling::jnl:section) + 1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>sa1</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:section]">
		<xsl:choose>
			<xsl:when
				test=". = 'Commentary' and parent::jnl:section/parent::jnl:section[@type and @type = 'TextBox']">
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
				<xsl:call-template name="newline"/>
			</xsl:when>
			<xsl:when test="parent::jnl:section[@type and @type = 'MoreInfo']">
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"> </xsl:when>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
						<xsl:element name="p">
							<xsl:element name="bold">
								<xsl:apply-templates/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
			</xsl:when>



			<xsl:otherwise>
				<xsl:element name="title">
					<xsl:choose>
						<xsl:when
							test="parent::jnl:section[@type and contains(@type ,'.f') and ancestor::jnl:section[@type and @type = 'Methods']]">
							<xsl:text disable-output-escaping="yes">&lt;inline-graphic xlink:href="</xsl:text>
							<xsl:value-of select="parent::jnl:section/@type"/>
							<xsl:text disable-output-escaping="yes">"&gt;&lt;/inline-graphic&gt;</xsl:text>
						</xsl:when>
					</xsl:choose>
					<xsl:apply-templates/>
				</xsl:element>
				<xsl:call-template name="newline"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:received[parent::jnl:history]">
		<xsl:element name="date">
			<xsl:attribute name="date-type">received</xsl:attribute>
			<xsl:apply-templates select="jnl:date/jnl:day"/>
			<xsl:apply-templates select="jnl:date/jnl:month"/>
			<xsl:apply-templates select="jnl:date/jnl:year"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:revised[parent::jnl:history]">
		<xsl:element name="date">
			<xsl:attribute name="date-type">rev-recd</xsl:attribute>
			<xsl:apply-templates select="jnl:date/jnl:day"/>
			<xsl:apply-templates select="jnl:date/jnl:month"/>
			<xsl:apply-templates select="jnl:date/jnl:year"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:accepted[parent::jnl:history]">
		<xsl:element name="date">
			<xsl:attribute name="date-type">accepted</xsl:attribute>
			<xsl:apply-templates select="jnl:date/jnl:day"/>
			<xsl:apply-templates select="jnl:date/jnl:month"/>
			<xsl:apply-templates select="jnl:date/jnl:year"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:day[ancestor::jnl:history]">
		<xsl:element name="day">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:month[ancestor::jnl:history]">
		<xsl:variable name="vmonth">
			<xsl:value-of select="."/>
		</xsl:variable>
		<xsl:element name="month">
			<xsl:choose>
				<xsl:when test="contains($vmonth,'Jan') or contains($vmonth,'jan')">
					<xsl:text>1</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Feb') or contains($vmonth,'feb')">
					<xsl:text>2</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Mar') or contains($vmonth,'mar')">
					<xsl:text>3</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Apr') or contains($vmonth,'apr')">
					<xsl:text>4</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'May') or contains($vmonth,'may')">
					<xsl:text>5</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Jun') or contains($vmonth,'jun')">
					<xsl:text>6</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Jul') or contains($vmonth,'jul')">
					<xsl:text>7</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Aug') or contains($vmonth,'aug')">
					<xsl:text>8</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Sep') or contains($vmonth,'sep')">
					<xsl:text>9</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Oct') or contains($vmonth,'oct')">
					<xsl:text>10</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Nov') or contains($vmonth,'nov')">
					<xsl:text>11</xsl:text>
				</xsl:when>
				<xsl:when test="contains($vmonth,'Dec') or contains($vmonth,'dec')">
					<xsl:text>12</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:year[ancestor::jnl:history]">
		<xsl:element name="year">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:biog" mode="fnotes">
		<xsl:element name="fn">
			<xsl:attribute name="fn-type">edited-by</xsl:attribute>
			<xsl:element name="p">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:note" mode="conflict">
		<xsl:element name="fn">
			<xsl:attribute name="fn-type">conflict</xsl:attribute>
			<xsl:element name="p">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:section" mode="contrib">
		<xsl:element name="fn">
			<xsl:attribute name="fn-type">con</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:section" mode="more">
		<xsl:element name="fn">
			<xsl:attribute name="fn-type">other</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:section" mode="moreCES">
		<xsl:element name="fn">
			<xsl:attribute name="fn-type">financial-disclosure</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:section" mode="supplementaryMaterial">
		<xsl:element name="fn">
			<xsl:attribute name="fn-type">supplementary-material</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:note" mode="current">
		<xsl:element name="fn">
			<xsl:attribute name="id">
				<xsl:text>fn1</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="fn-type">current-aff</xsl:attribute>
			<xsl:text disable-output-escaping="yes">&lt;label&gt;&lt;sup&gt;&amp;curren;&lt;/sup&gt;&lt;/label&gt;</xsl:text>
			<xsl:element name="p">
				<xsl:text>Current address: </xsl:text>
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:grant" mode="footgrant">
		<xsl:element name="fn">
			<xsl:attribute name="fn-type">financial-disclosure</xsl:attribute>
			<xsl:element name="p">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:biog" mode="contrib">
		<xsl:choose>
			<xsl:when
				test="node()[position() = 1 and self::text() and contains(self::text(), 'Action Editor')]">
				<xsl:variable name="content">
					<xsl:apply-templates/>
				</xsl:variable>
				<xsl:variable name="start">
					<xsl:choose>
						<xsl:when test="contains($content, 'Action Editors,')">
							<xsl:value-of
								select="normalize-space(substring-after($content,'Action Editors,'))"
							/>
						</xsl:when>
						<xsl:when test="contains($content, 'Action Editors.')">
							<xsl:value-of
								select="normalize-space(substring-after($content,'Action Editors.'))"
							/>
						</xsl:when>
						<xsl:when test="contains($content, 'Action Editors')">
							<xsl:value-of
								select="normalize-space(substring-after($content,'Action Editors'))"
							/>
						</xsl:when>
						<xsl:when test="contains($content, 'Action Editor,')">
							<xsl:value-of
								select="normalize-space(substring-after($content,'Action Editor,'))"
							/>
						</xsl:when>
						<xsl:when test="contains($content, 'Action Editor.')">
							<xsl:value-of
								select="normalize-space(substring-after($content,'Action Editor.'))"
							/>
						</xsl:when>
						<xsl:when test="contains($content, 'Action Editor')">
							<xsl:value-of
								select="normalize-space(substring-after($content,'Action Editor'))"
							/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$start != ''">
						<xsl:call-template name="spliteditor">
							<xsl:with-param name="Chars" select="$start"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="spliteditor">
		<xsl:param name="Chars"/>
		<xsl:if test="$Chars != ''">
			<xsl:variable name="part1b">
				<xsl:value-of select="normalize-space(substring-before($Chars,' and '))"/>
			</xsl:variable>
			<xsl:variable name="part1bb">
				<xsl:value-of select="normalize-space(substring-before($part1b,', '))"/>
			</xsl:variable>
			<xsl:variable name="part1bbb">
				<xsl:value-of select="normalize-space(substring-before($part1b,'&amp;amp;'))"/>
			</xsl:variable>
			<xsl:variable name="part5b">
				<xsl:value-of select="normalize-space(substring-before($Chars,'&amp;amp;'))"/>
			</xsl:variable>
			<xsl:variable name="part5bb">
				<xsl:value-of select="normalize-space(substring-before($part5b,', '))"/>
			</xsl:variable>
			<xsl:variable name="part5a">
				<xsl:value-of select="normalize-space(substring-after($Chars,'&amp;amp;'))"/>
			</xsl:variable>
			<xsl:variable name="part1a">
				<xsl:value-of select="normalize-space(substring-after($Chars,' and '))"/>
			</xsl:variable>
			<xsl:variable name="part2b">
				<xsl:value-of select="normalize-space(substring-before($Chars,', '))"/>
			</xsl:variable>
			<xsl:variable name="part2a">
				<xsl:value-of select="normalize-space(substring-after($Chars,', '))"/>
			</xsl:variable>
			<xsl:variable name="part3b">
				<xsl:value-of select="normalize-space(substring-before($Chars,'. '))"/>
			</xsl:variable>
			<xsl:variable name="part3a">
				<xsl:value-of select="normalize-space(substring-after($Chars,'. '))"/>
			</xsl:variable>
			<xsl:variable name="part4b">
				<xsl:value-of select="normalize-space(substring-before($Chars,' '))"/>
			</xsl:variable>
			<xsl:variable name="part4a">
				<xsl:value-of select="normalize-space(substring-after($Chars,' '))"/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when
					test="$part1b != '' and part1bb != '' and not(contains(part1bb, '&amp;amp;'))">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part2b"/>
					</xsl:call-template>
					<xsl:if test="$part2a != ''">
						<xsl:call-template name="spliteditor">
							<xsl:with-param name="Chars" select="$part2a"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$part1b != '' and part1bbb != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part5b"/>
					</xsl:call-template>
					<xsl:if test="$part2a != ''">
						<xsl:call-template name="spliteditor">
							<xsl:with-param name="Chars" select="$part5a"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$part5b != '' and part5bb != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part2b"/>
					</xsl:call-template>
					<xsl:if test="$part2a != ''">
						<xsl:call-template name="spliteditor">
							<xsl:with-param name="Chars" select="$part2a"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$part1b != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part1b"/>
					</xsl:call-template>
					<xsl:if test="$part1a != ''">
						<xsl:call-template name="spliteditor">
							<xsl:with-param name="Chars" select="$part1a"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$part1a != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part1a"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$part5b != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part5b"/>
					</xsl:call-template>
					<xsl:if test="$part5a != ''">
						<xsl:call-template name="spliteditor">
							<xsl:with-param name="Chars" select="$part5a"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$part5a != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part5a"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$part2b != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part2b"/>
					</xsl:call-template>
					<xsl:if test="$part2a != ''">
						<xsl:call-template name="spliteditor">
							<xsl:with-param name="Chars" select="$part2a"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$part2a != ''">
					<xsl:call-template name="spliteditor">
						<xsl:with-param name="Chars" select="$part2a"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$part3b != '' and $part3a != ''">
					<xsl:element name="contrib">
						<xsl:attribute name="contrib-type">editor</xsl:attribute>
						<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="normalize-space($part3a)"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="normalize-space($part3b)"/>
						</xsl:call-template>
						<xsl:text>.</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
						<xsl:text>Action Editor</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:when test="$part3a != ''">
					<xsl:element name="contrib">
						<xsl:attribute name="contrib-type">editor</xsl:attribute>
						<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="normalize-space($part3a)"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
						<xsl:text>Action Editor</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:when test="$part4b != '' and $part4a != ''">
					<xsl:element name="contrib">
						<xsl:attribute name="contrib-type">editor</xsl:attribute>
						<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="normalize-space($part4a)"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="normalize-space($part4b)"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
						<xsl:text>Action Editor</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:when test="$part4a != ''">
					<xsl:element name="contrib">
						<xsl:attribute name="contrib-type">editor</xsl:attribute>
						<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="normalize-space($part4a)"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
						<xsl:text>Action Editor</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="contrib">
						<xsl:attribute name="contrib-type">editor</xsl:attribute>
						<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="normalize-space($Chars)"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
						<xsl:text>Action Editor</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="editorent">
		<xsl:param name="Chars"/>
		<xsl:if test="$Chars != ''">
			<xsl:variable name="part1" select="substring-before($Chars,'&amp;')"/>
			<xsl:variable name="part2" select="substring-after($Chars,'&amp;')"/>
			<xsl:choose>
				<xsl:when test="$part1 != ''">
					<xsl:value-of select="$part1"/>
					<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
					<xsl:if test="$part2 != ''">
						<xsl:call-template name="editorent">
							<xsl:with-param name="Chars" select="$part2"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$part2 != ''">
					<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
					<xsl:call-template name="editorent">
						<xsl:with-param name="Chars" select="$part2"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$Chars"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:footnote">
		<xsl:choose>
			<xsl:when test="ancestor::jnl:author or ancestor::jnl:editor">
				<xsl:variable name="partA">
					<xsl:apply-templates/>
				</xsl:variable>
				<xsl:variable name="corr"
					select="translate($partA , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				<xsl:choose>
					<xsl:when test="contains($corr , 'CORRESP')">
						<xsl:element name="corresp">
							<xsl:attribute name="id">
								<xsl:text>cor1</xsl:text>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
									<xsl:choose>
										<xsl:when test="@num and @num != ''">
											<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
											<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="@num and @num != ''">
											<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
											<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:apply-templates select="jnl:p/node()"/>
						</xsl:element>
					</xsl:when>
					<xsl:when test="contains($corr , 'EQUAL')">
						<xsl:element name="fn">
							<xsl:attribute name="id">
								<xsl:value-of select="@id"/>
							</xsl:attribute>
							<xsl:attribute name="fn-type">
								<xsl:text>equal</xsl:text>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
									<xsl:choose>
										<xsl:when test="@num and @num != ''">
											<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
											<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
									<xsl:apply-templates select="jnl:p/node()"/>
									<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="@num and @num != ''">
											<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
											<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
									<xsl:apply-templates select="jnl:p/node()"/>
									<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="fn">
							<xsl:attribute name="id">
								<xsl:value-of select="@id"/>
							</xsl:attribute>
							<xsl:choose>
								<xsl:when
									test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
									<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
									<xsl:choose>
										<xsl:when test="@num and @num != ''">
											<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:apply-templates select="jnl:p/node()"/>
									<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="@num and @num != ''">
											<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
											<xsl:call-template name="write-num">
												<xsl:with-param name="value" select="@num"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
									<xsl:apply-templates select="jnl:p/node()"/>
									<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:footnote" mode="backfoot">
		<xsl:variable name="footref">
			<xsl:choose>
				<xsl:when test="@id and @id != '' and //jnl:footnote[ancestor::jnl:author-grp]">
					<xsl:text>fn</xsl:text>
					<xsl:value-of
						select="substring-after(@id,'fn') - count(//jnl:footnote[ancestor::jnl:author-grp])"
					/>
				</xsl:when>
				<xsl:when test="@id and @id != ''">
					<xsl:value-of select="@id"/>
				</xsl:when>
				<xsl:otherwise> </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="fn">
			<xsl:if test="$footref != ''">
				<xsl:attribute name="id">
					<xsl:value-of select="$footref"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@num and @num != ''">
				<xsl:text disable-output-escaping="yes">&lt;label&gt;</xsl:text>
				<xsl:apply-templates select="@num"/>
				<xsl:text disable-output-escaping="yes">&lt;/label&gt;</xsl:text>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
			<xsl:for-each select="node()">
				<xsl:choose>
					<xsl:when test="self::jnl:p">
						<xsl:for-each select="node()">
							<xsl:choose>
								<xsl:when test="self::text()">
									<xsl:value-of select="."/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="self::node()"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:footnote" mode="backfootref">
		<xsl:choose>
			<xsl:when test="//jnl:footnote[ancestor::jnl:author-grp]">
				<xsl:text>fn</xsl:text>
				<xsl:value-of
					select="substring-after(@id,'fn') - count(//jnl:footnote[ancestor::jnl:author-grp])"
				/>
			</xsl:when>
			<xsl:when test="//jnl:front/jnl:note[@type = 'currentaddress']">
				<xsl:text>fn</xsl:text>
				<xsl:value-of select="number(substring-after(@id,'fn')) + 1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@id"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="jnl:corresponding-author" mode="corrname">
		<xsl:if test="$CorresAuthor = '0'">
			<xsl:element name="corresp">
				<xsl:attribute name="id">
					<xsl:text>cor1</xsl:text>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
						<!--<xsl:text>Correspondence to: </xsl:text>-->
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates/>
				<xsl:if test="following-sibling::jnl:aff and node()">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="following-sibling::jnl:aff" mode="corraff"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:corresponding-author" mode="corremail">
		<xsl:if test="jnl:note[@type='email']">
			<xsl:element name="corresp">
				<xsl:attribute name="id">
					<xsl:text>n</xsl:text>
					<xsl:value-of
						select="count(preceding-sibling::jnl:corresponding-author) + count(ancestor::jnl:author-grp/preceding-sibling::jnl:author-grp/jnl:corresponding-author) + 101"
					/>
				</xsl:attribute>
				<xsl:text disable-output-escaping="yes">&amp;ast; To whom correspondence should be addressed. </xsl:text>
				<xsl:apply-templates select="jnl:note[@type = 'email']"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:email">
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
				<xsl:text disable-output-escaping="yes">&lt;email xlink:type="simple"&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:email" mode="affss">
		<xsl:call-template name="newline"/>
		<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
		<xsl:call-template name="newline"/>
	</xsl:template>
	<xsl:template match="jnl:email" mode="affs">
		<xsl:call-template name="newline"/>
		<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="jnl:org-name | jnl:org-div" mode="affs">
		<xsl:apply-templates/>
		<xsl:if
			test="following-sibling::jnl:org-name/node() | following-sibling::jnl:org-div/node()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:org-name | jnl:org-div" mode="corraff">
		<xsl:if test="node()">
			<xsl:apply-templates/>
			<xsl:if test="following-sibling::node()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:address" mode="corraff">
		<xsl:apply-templates mode="corraff"/>
	</xsl:template>
	<xsl:template match="*" mode="corraff">
		<xsl:apply-templates/>
		<xsl:choose>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:email]">
				<xsl:text>. </xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()">
				<xsl:text>, </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:email" mode="corraff" priority="100">
		<xsl:text>E-mail: </xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;email xmlns:xlink="http://www.w3.org/1999/xlink"&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/email&gt;</xsl:text>
		<xsl:if test="following-sibling::node()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:country" mode="affs">
		<xsl:apply-templates/>
		<xsl:if test="following-sibling::jnl:country/node()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template
		match="jnl:street | jnl:city | jnl:state| jnl:postcode | jnl:postbox | jnl:addr-cpn"
		mode="affs">
		<xsl:apply-templates/>
		<xsl:choose>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:postcode]/node()">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="following-sibling::node()[position() = 1 and self::jnl:postbox]/node()">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when
				test="following-sibling::jnl:street/node() | following-sibling::jnl:city/node() | following-sibling::jnl:state/node()">
				<xsl:text>, </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()[ancestor::jnl:caption]" priority="105" mode="removefig">
		<xsl:variable name="content" select="."/>
		<xsl:variable name="subcont">
			<xsl:value-of select="substring($content,1,3)"/>
		</xsl:variable>
		<xsl:variable name="content1">
			<xsl:choose>
				<xsl:when test="$subcont = 'Fig' or $subcont = 'fig'">
					<xsl:variable name="start">
						<xsl:value-of select="substring-after($content,' ')"/>
					</xsl:variable>
					<xsl:value-of select="substring-after($start,' ')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="$content1"/>
	</xsl:template>
	<xsl:template match="text()[ancestor::jnl:caption]" priority="105" mode="removefigg">
		<xsl:variable name="content" select="."/>
		<xsl:variable name="start">
			<xsl:value-of select="substring-after($content,'.')"/>
		</xsl:variable>
		<xsl:value-of select="substring-after($start,' ')"/>
	</xsl:template>
	<xsl:template match="text()[ancestor::jnl:caption]" priority="105">
		<xsl:variable name="content" select="."/>
		<xsl:variable name="start">
			<xsl:value-of select="substring($content,1,1)"/>
		</xsl:variable>
		<xsl:variable name="content1">
			<xsl:choose>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction('FIGTITLE')] and $start = ' '">
					<xsl:value-of select="substring($content,2)"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction('figtitle')] and $start = ' '">
					<xsl:value-of select="substring($content,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="$content1"/>
	</xsl:template>
	<xsl:template match="text()[ancestor::jnl:surname[ancestor::jnl:author-grp]]" priority="105">
		<xsl:variable name="content1" select="."/>
		<xsl:choose>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
				<xsl:value-of select="$content1"/>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
				<xsl:value-of select="$content1"/>
			</xsl:when>
			<xsl:when
				test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
				<xsl:value-of select="$content1"/>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'apos']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()">
		<xsl:variable name="content1" select="."/>
		<xsl:choose>
			<xsl:when
				test="$RefSup = '1' and ancestor::jnl:citref and ancestor::jnl:emph[@type = 'smallcaps']">
				<xsl:value-of
					select="translate($content1 , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
				/>
			</xsl:when>
			<xsl:when test="preceding-sibling::jnl:author and following-sibling::jnl:author"/>
			<xsl:when test="preceding-sibling::jnl:author and following-sibling::jnl:etal"/>
			<xsl:otherwise>
				<xsl:value-of select="$content1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:jnl-tl">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="text()" mode="corraff">
		<xsl:variable name="content1" select="."/>
		<xsl:value-of select="$content1"/>
	</xsl:template>
	<xsl:template match="jnl:jnl-tl">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template
		match="text()[ancestor::jnl:jnl-info or ancestor::jnl:unit-info or ancestor::jnl:front]"
		priority="100">
		<xsl:variable name="content" select="."/>
		<xsl:value-of select="$content"/>
	</xsl:template>
	<xsl:template match="text()[ancestor::jnl:rh-recto or ancestor::jnl:rh-verso]" priority="101">
		<xsl:variable name="content1" select="."/>
		<xsl:choose>
			<xsl:when test="ancestor::jnl:title[parent::jnl:abstract[parent::jnl:doc]]">
				<xsl:value-of
					select="translate($content1 , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
				/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$content1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()[ancestor::jnl:title[parent::jnl:refs]]" priority="102">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template name="SentenceCase">
		<xsl:param name="Chars"/>
		<xsl:param name="Type"/>
		<xsl:choose>
			<xsl:when test="$Chars = ' '">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$Chars != '' and contains($Chars, ' ')">
				<xsl:variable name="first">
					<xsl:value-of select="substring-before($Chars,' ')"/>
				</xsl:variable>
				<xsl:variable name="rest">
					<xsl:value-of select="substring-after($Chars,' ')"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$first != '' and $Type = 1">
						<xsl:value-of
							select="translate($first , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
						/>
					</xsl:when>
					<xsl:when
						test="$Type = 0 and string-length($first) = 1 and not(ancestor::jnl:emph[@type = 'smallcaps'])">
						<xsl:value-of
							select="translate($first , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
						/>
					</xsl:when>
					<xsl:when
						test="$Type = 0 and not(ancestor::jnl:emph[@type = 'smallcaps']) and string-length($first &gt; 2)">
						<xsl:choose>
							<xsl:when
								test="starts-with($first, 'mc') or starts-with($first, 'MC') or starts-with($first, 'Mc') or starts-with($first, 'mC')">
								<xsl:text>Mc</xsl:text>
								<xsl:variable name="start">
									<xsl:value-of select="substring($first,3,1)"/>
								</xsl:variable>
								<xsl:variable name="end">
									<xsl:value-of select="substring($first,4)"/>
								</xsl:variable>
								<xsl:value-of
									select="translate($start , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
								<xsl:value-of
									select="translate($end , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
								/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="start">
									<xsl:value-of select="substring($first,1,1)"/>
								</xsl:variable>
								<xsl:variable name="end">
									<xsl:value-of select="substring($first,2)"/>
								</xsl:variable>
								<xsl:value-of
									select="translate($start , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
								<xsl:value-of
									select="translate($end , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
								/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$Type = 0 and not(ancestor::jnl:emph[@type = 'smallcaps'])">
						<xsl:variable name="start">
							<xsl:value-of select="substring($first,1,1)"/>
						</xsl:variable>
						<xsl:variable name="end">
							<xsl:value-of select="substring($first,2)"/>
						</xsl:variable>
						<xsl:value-of
							select="translate($start , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
						<xsl:value-of
							select="translate($end , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
						/>
					</xsl:when>
					<xsl:when test="$Type = 0">
						<xsl:value-of
							select="translate($first , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
						/>
					</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:if test="$rest != ''">
					<xsl:call-template name="SentenceCase">
						<xsl:with-param name="Chars" select="$rest"/>
						<xsl:with-param name="Type" select="0"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$Chars != ''">
				<xsl:choose>
					<xsl:when test="$Type = 1">
						<xsl:value-of
							select="translate($Chars , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
						/>
					</xsl:when>
					<xsl:when
						test="$Type = 0 and string-length($Chars) = 1 and not(ancestor::jnl:emph[@type = 'smallcaps'])">
						<xsl:value-of
							select="translate($Chars , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
						/>
					</xsl:when>
					<xsl:when
						test="$Type = 0 and not(ancestor::jnl:emph[@type = 'smallcaps']) and string-length($Chars &gt; 2)">
						<xsl:choose>
							<xsl:when
								test="starts-with($Chars, 'mc') or starts-with($Chars, 'MC') or starts-with($Chars, 'Mc') or starts-with($Chars, 'mC')">
								<xsl:text>Mc</xsl:text>
								<xsl:variable name="start">
									<xsl:value-of select="substring($Chars,3,1)"/>
								</xsl:variable>
								<xsl:variable name="end">
									<xsl:value-of select="substring($Chars,4)"/>
								</xsl:variable>
								<xsl:value-of
									select="translate($start , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
								<xsl:value-of
									select="translate($end , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
								/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="start">
									<xsl:value-of select="substring($Chars,1,1)"/>
								</xsl:variable>
								<xsl:variable name="end">
									<xsl:value-of select="substring($Chars,2)"/>
								</xsl:variable>
								<xsl:value-of
									select="translate($start , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
								<xsl:value-of
									select="translate($end , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
								/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$Type = 0 and not(ancestor::jnl:emph[@type = 'smallcaps'])">
						<xsl:variable name="start">
							<xsl:value-of select="substring($Chars,1,1)"/>
						</xsl:variable>
						<xsl:variable name="end">
							<xsl:value-of select="substring($Chars,2)"/>
						</xsl:variable>
						<xsl:value-of
							select="translate($start , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
						<xsl:value-of
							select="translate($end , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
						/>
					</xsl:when>
					<xsl:when test="$Type = 0">
						<xsl:value-of
							select="translate($Chars , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
						/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CheckCorres">
		<xsl:param name="CorSurname"/>
		<xsl:param name="CorForename"/>
		<xsl:for-each select="//jnl:corresponding-author">
			<xsl:choose>
				<xsl:when test="jnl:surname and jnl:forename">
					<xsl:variable name="Surname">
						<xsl:apply-templates select="jnl:surname" mode="getname"/>
					</xsl:variable>
					<xsl:variable name="Forename">
						<xsl:apply-templates select="jnl:forename" mode="getname"/>
					</xsl:variable>
					<xsl:if test="$CorSurname = $Surname and $CorForename = $Forename">
						<xsl:apply-templates select="following-sibling::jnl:aff" mode="Email"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="jnl:abrv-list">
		<xsl:element name="def-list">
			<xsl:call-template name="newline"/>
			<xsl:for-each select="node()">
				<xsl:choose>
					<xsl:when test="self::jnl:title">
						<xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
						<xsl:call-template name="newline"/>
					</xsl:when>
					<xsl:when test="self::jnl:abrv-item">
						<xsl:element name="def-item">
							<xsl:call-template name="newline"/>
							<xsl:for-each select="node()">
								<xsl:choose>
									<xsl:when test="self::jnl:abrv">
										<xsl:text disable-output-escaping="yes">&lt;term&gt;</xsl:text>
										<xsl:apply-templates/>
										<xsl:text disable-output-escaping="yes">&lt;/term&gt;</xsl:text>
										<xsl:call-template name="newline"/>
									</xsl:when>
									<xsl:when test="self::jnl:expn">
										<xsl:text disable-output-escaping="yes">&lt;def&gt;&lt;p&gt;</xsl:text>
										<xsl:apply-templates/>
										<xsl:text disable-output-escaping="yes">&lt;/p&gt;&lt;/def&gt;</xsl:text>
										<xsl:call-template name="newline"/>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:def-list">
		<xsl:variable name="prefixw">
			<xsl:choose>
				<xsl:when
					test="node()[position() = 1 and self::jnl:title] and node()[position() = 2 and self::jnl:term and @num]">
					<xsl:value-of select="node()[position() = 2 and self::jnl:term]/@num"/>
				</xsl:when>
				<xsl:when
					test="node()[position() = 1 and self::jnl:title] and node()[position() = 2 and self::jnl:term]"> </xsl:when>
				<xsl:when test="node()[position() = 1 and self::jnl:term and @num]">
					<xsl:value-of select="node()[position() = 1 and self::jnl:term]/@num"/>
				</xsl:when>
				<xsl:when test="node()[position() = 1 and  self::jnl:term]"> </xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="prefixn">
			<xsl:if test="@num and @num != ''">
				<xsl:apply-templates select="@num"/>
			</xsl:if>
		</xsl:variable>
		<xsl:element name="def-list">
			<xsl:choose>
				<xsl:when test="@num and @num != ''">
					<xsl:attribute name="prefix-word">
						<xsl:apply-templates select="@num"/>
					</xsl:attribute>
				</xsl:when>
				<xsl:when test="$prefixw != ''">
					<xsl:attribute name="prefix-word">
						<xsl:value-of select="$prefixw"/>
					</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:call-template name="newline"/>
			<xsl:for-each select="node()">
				<xsl:choose>
					<xsl:when test="self::jnl:title">
						<xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
						<xsl:call-template name="newline"/>
					</xsl:when>
					<xsl:when test="self::jnl:term">
						<xsl:variable name="termn">
							<xsl:if test="@num and @num != ''">
								<xsl:apply-templates select="@num"/>
							</xsl:if>
						</xsl:variable>
						<xsl:choose>
							<xsl:when
								test="preceding-sibling::node()[position() = 1 and self::jnl:def-list]">
								<xsl:text disable-output-escaping="yes">&lt;/def-list&gt;</xsl:text>
								<xsl:call-template name="newline"/>
								<xsl:text disable-output-escaping="yes">&lt;def-list</xsl:text>
								<xsl:if test="$termn != ''">
									<xsl:text> prefix-word="</xsl:text>
									<xsl:value-of select="$termn"/>
									<xsl:text>"</xsl:text>
								</xsl:if>
								<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
								<xsl:call-template name="newline"/>
							</xsl:when>
							<xsl:when
								test="preceding-sibling::node()[position() = 1 and self::jnl:def] and preceding-sibling::node()[position() = 2 and self::jnl:term]">
								<xsl:variable name="ntermn">
									<xsl:if
										test="preceding-sibling::node()[position() = 2 and self::jnl:term]/@num and preceding-sibling::node()[position() = 2 and self::jnl:term]/@num != ''">
										<xsl:value-of
											select="preceding-sibling::node()[position() = 2 and self::jnl:term]/@num"
										/>
									</xsl:if>
								</xsl:variable>
								<xsl:if test="$termn != $ntermn">
									<xsl:text disable-output-escaping="yes">&lt;/def-list&gt;</xsl:text>
									<xsl:call-template name="newline"/>
									<xsl:text disable-output-escaping="yes">&lt;def-list</xsl:text>
									<xsl:if test="$termn != ''">
										<xsl:text> prefix-word="</xsl:text>
										<xsl:value-of select="$termn"/>
										<xsl:text>"</xsl:text>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
									<xsl:call-template name="newline"/>
								</xsl:if>
							</xsl:when>
							<xsl:when
								test="preceding-sibling::node()[position() = 1 and self::jnl:term]">
								<xsl:variable name="ntermn">
									<xsl:if
										test="preceding-sibling::node()[position() = 1 and self::jnl:term]/@num and preceding-sibling::node()[position() = 1 and self::jnl:term]/@num != ''">
										<xsl:value-of
											select="preceding-sibling::node()[position() = 1 and self::jnl:term]/@num"
										/>
									</xsl:if>
								</xsl:variable>
								<xsl:if test="$termn != $ntermn">
									<xsl:text disable-output-escaping="yes">&lt;/def-list&gt;</xsl:text>
									<xsl:call-template name="newline"/>
									<xsl:text disable-output-escaping="yes">&lt;def-list</xsl:text>
									<xsl:if test="$termn != ''">
										<xsl:text> prefix-word="</xsl:text>
										<xsl:value-of select="$termn"/>
										<xsl:text>"</xsl:text>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
									<xsl:call-template name="newline"/>
								</xsl:if>
							</xsl:when>
						</xsl:choose>
						<xsl:text disable-output-escaping="yes">&lt;def-item&gt;</xsl:text>
						<xsl:call-template name="newline"/>
						<xsl:text disable-output-escaping="yes">&lt;term&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/term&gt;</xsl:text>
						<xsl:call-template name="newline"/>
						<xsl:if
							test="not(following-sibling::node()) or following-sibling::node()[position() = 1 and self::jnl:term]">
							<xsl:text disable-output-escaping="yes">&lt;/def-item&gt;</xsl:text>
							<xsl:call-template name="newline"/>
						</xsl:if>
					</xsl:when>
					<xsl:when test="self::jnl:def">
						<xsl:if
							test="not(preceding-sibling::node()) or preceding-sibling::node()[position() = 1 and self::jnl:def]">
							<xsl:text disable-output-escaping="yes">&lt;def-item&gt;</xsl:text>
							<xsl:call-template name="newline"/>
							<xsl:text disable-output-escaping="yes">&lt;term&gt;</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;/term&gt;</xsl:text>
							<xsl:call-template name="newline"/>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&lt;def&gt;&lt;p&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/p&gt;&lt;/def&gt;</xsl:text>
						<xsl:call-template name="newline"/>
						<xsl:text disable-output-escaping="yes">&lt;/def-item&gt;</xsl:text>
						<xsl:call-template name="newline"/>
					</xsl:when>
					<xsl:when test="self::jnl:def-list">
						<xsl:apply-templates select="self::node()"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:item-list[@type = 'key']" priority="100">
		<xsl:element name="list">
			<xsl:if test="not(ancestor::jnl:item-list)">
				<xsl:attribute name="list-content">
					<xsl:text>key</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="@num">
				<xsl:attribute name="prefix-word">
					<xsl:apply-templates select="@num"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:item-list[@type = 'key']]" priority="2">
		<xsl:text disable-output-escaping="yes">&lt;title&gt;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&lt;/title&gt;</xsl:text>
		<xsl:call-template name="newline"/>
	</xsl:template>
	<xsl:template match="jnl:p[parent::jnl:item]" priority="3">
		<xsl:choose>
			<xsl:when test="jnl:def-list or jnl:item-list">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="p">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:author-grp" mode="AuthCorres">
		<xsl:for-each select="node()">
			<xsl:choose>
				<xsl:when test="self::jnl:author">
					<xsl:apply-templates select="self::node()"/>
				</xsl:when>
				<xsl:when test="self::jnl:corresponding-author">
					<xsl:apply-templates select="self::node()" mode="AuthCorres"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="jnl:corresponding-author[parent::jnl:author-grp]" mode="AuthCorres">
		<xsl:element name="contrib">
			<xsl:attribute name="contrib-type">author</xsl:attribute>
			<!--<xsl:attribute name="corresp">yes</xsl:attribute>-->
			<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:americanism">
				<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
				<xsl:if test="jnl:surname">
					<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
					<xsl:apply-templates select="jnl:surname/."/>
					<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="jnl:initial | jnl:forename">
					<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
					<xsl:apply-templates select="jnl:forename | jnl:initial"/>
					<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="jnl:americanism">
					<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
					<xsl:apply-templates select="jnl:americanism"/>
					<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:role">
				<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
				<xsl:apply-templates select="jnl:role"/>
				<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:ac-degree">
				<xsl:text disable-output-escaping="yes">&lt;degrees&gt;</xsl:text>
				<xsl:apply-templates select="jnl:ac-degree"/>
				<xsl:text disable-output-escaping="yes">&lt;/degrees&gt;</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(@affs,' ')">
					<xsl:call-template name="write-affs">
						<xsl:with-param name="rids-attribute-value" select="@affs"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="@affs and @affs != ''">
					<xsl:variable name="rrids" select="@affs"/>
					<xsl:apply-templates select="//jnl:aff[@id = $rrids]" mode="Refers"/>
					<xsl:apply-templates select="//jnl:dept[@id = $rrids]" mode="Refers"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="following-sibling::jnl:aff" mode="Refers"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="$AffType = '1'">
				<xsl:choose>
					<xsl:when test="contains(@affs,' ')">
						<xsl:call-template name="write-affs-email">
							<xsl:with-param name="rids-attribute-value" select="@affs"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="@affs and @affs != ''">
						<xsl:variable name="rrids" select="@affs"/>
						<xsl:apply-templates select="following-sibling::jnl:aff[@id = $rrids]"
							mode="Refersemail"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="following-sibling::jnl:aff" mode="Refersemail"
						/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:corresponding-author[parent::jnl:author-grp]">
		<xsl:element name="contrib">
			<xsl:attribute name="contrib-type">author</xsl:attribute>
			<!--<xsl:attribute name="corresp">yes</xsl:attribute>-->
			<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:americanism">
				<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
				<xsl:if test="jnl:surname">
					<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
					<xsl:for-each select="jnl:surname">
						<xsl:if test="preceding-sibling::jnl:surname">
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates/>
					</xsl:for-each>
					<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="jnl:initial | jnl:forename">
					<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
					<xsl:apply-templates select="jnl:forename | jnl:initial"/>
					<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
				</xsl:if>
				<xsl:if test="jnl:americanism">
					<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
					<xsl:apply-templates select="jnl:americanism"/>
					<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:role">
				<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
				<xsl:apply-templates select="jnl:role"/>
				<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="jnl:ac-degree">
				<xsl:text disable-output-escaping="yes">&lt;degrees&gt;</xsl:text>
				<xsl:apply-templates select="jnl:ac-degree"/>
				<xsl:text disable-output-escaping="yes">&lt;/degrees&gt;</xsl:text>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&lt;xref ref-type="corresp" rid="cor1"&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes">&amp;ast;&lt;/xref&gt;</xsl:text>
			<xsl:choose>
				<xsl:when test="ancestor::jnl:abstract">
					<xsl:choose>
						<xsl:when test="jnl:emph[@type and @type = 'sup']">
							<xsl:variable name="rtext">
								<xsl:apply-templates
									select="jnl:emph[@type and @type = 'sup']/node()"/>
							</xsl:variable>
							<xsl:call-template name="write-affsnum">
								<xsl:with-param name="rids-attribute-value" select="$rtext"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="contains(@affs,' ')">
							<xsl:call-template name="write-affs">
								<xsl:with-param name="rids-attribute-value" select="@affs"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="@affs and @affs != ''">
							<xsl:variable name="rrids" select="@affs"/>
							<xsl:apply-templates select="//jnl:aff[@id = $rrids]" mode="Refers"/>
							<xsl:apply-templates select="//jnl:dept[@id = $rrids]" mode="Refers"/>
						</xsl:when>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
							<xsl:choose>
								<xsl:when
									test="following-sibling::jnl:aff or following-sibling::jnl:dept-list/jnl:dept">
									<xsl:choose>
										<xsl:when
											test="parent::jnl:author-grp/jnl:author[@affs and @affs != ''] or parent::jnl:author-grp/jnl:corresponding-author[@affs and @affs != '']"> </xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="following-sibling::jnl:aff"
												mode="Refers"/>
											<xsl:apply-templates
												select="following-sibling::jnl:dept-list/jnl:dept"
												mode="Refers"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise> </xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>

	<xsl:template match="jnl:emph[parent::jnl:cit]" priority="1"/>


	<xsl:template match="jnl:emph[parent::jnl:pages]" priority="1"/>

	<xsl:template match="jnl:emph[ancestor::jnl:vol]" priority="1">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="nodot">
		<xsl:variable name="content1" select="."/>
		<xsl:variable name="content">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:when test="preceding-sibling::node()[position() = 1 and self::text()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$content = '#296'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:url">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:email">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:url">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:email">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:url">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:email">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:url">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:email">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:url">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:email">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:url">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:email">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:url">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:email">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:url">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:email">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:url">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:email">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:url">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:email">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:url">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:email">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:url">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:email">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:url">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:email">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:url">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:email">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:url">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:email">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:url">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:email">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:url">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:email">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:url">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:email">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:url">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:email">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:url">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'khgr' and $CustCode = 'plos'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar'">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ndash' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ensp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'thinsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text disable-output-escaping="yes">/</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
				<xsl:value-of select="$content"/>
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()" mode="nodot">
		<xsl:variable name="content" select="translate(. , '.', '')"/>
		<xsl:value-of select="$content"/>
	</xsl:template>
	<xsl:template match="jnl:news-section[ancestor::jnl:news]">
		<xsl:element name="sec">
			<xsl:if test="not(jnl:title)">
				<xsl:element name="title">
					<xsl:text/>
				</xsl:element>
			</xsl:if>
			<xsl:apply-templates select="node()[not(self::jnl:author-grp)]"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="jnl:title[parent::jnl:news-section]" priority="10">
		<xsl:element name="title">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="*[parent::jnl:news-section]"/>
	<xsl:template match="jnl:section[ancestor::jnl:news]" priority="10">
		<xsl:choose>
			<xsl:when test="@type and @type = 'TextBox'">
				<xsl:element name="boxed-text">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="sec">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:abstract" mode="sub-art">
		<xsl:choose>
			<xsl:when test="preceding-sibling::jnl:abstract"/>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&lt;front&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:apply-templates select="ancestor::jnl:doc" mode="jnlinfo"/>
				<xsl:text disable-output-escaping="yes">&lt;article-meta&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:element name="article-id">
					<xsl:attribute name="pub-id-type">publisher-id</xsl:attribute>
					<xsl:apply-templates
						select="ancestor::jnl:doc/jnl:abstract[1]/jnl:unit-info/jnl:c-tracker-id/."
					/>
				</xsl:element>
				<xsl:element name="article-categories">
					<xsl:element name="subj-group">
						<xsl:attribute name="subj-group-type">
							<xsl:text>heading</xsl:text>
						</xsl:attribute>
						<xsl:element name="subject">
							<xsl:text>Abstracts</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="title-group">
					<xsl:element name="article-title">
						<xsl:if test="//jnl:unit-info[1]/jnl:categ/node()">
							<xsl:apply-templates select="//jnl:unit-info[1]/jnl:categ/node()"/>
						</xsl:if>
					</xsl:element>
					<xsl:choose>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'"/>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'"/>
						<xsl:when test="//jnl:unit-info[1]/jnl:rh-recto[. != '']">
							<xsl:element name="alt-title">
								<xsl:attribute name="alt-title-type">running-head</xsl:attribute>
								<xsl:apply-templates select="//jnl:unit-info[1]/jnl:rh-recto/."/>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
				</xsl:element>
				<xsl:if test="//jnl:article[@logo and contains(@logo , 'unlocked')]">
					<xsl:element name="pub-date">
						<xsl:attribute name="pub-type">collection</xsl:attribute>
						<xsl:element name="year">
							<xsl:choose>
								<xsl:when
									test="//jnl:misc-date[jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]]/jnl:year">
									<xsl:apply-templates
										select="//jnl:misc-date[jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]]/jnl:year/."
									/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="//jnl:jnl-info/jnl:date/jnl:year/."
									/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:element>
				</xsl:if>
				<xsl:element name="pub-date">
					<xsl:attribute name="pub-type">ppub</xsl:attribute>
					<xsl:element name="month">
						<xsl:value-of select="$EEMonth"/>
					</xsl:element>
					<xsl:element name="year">
						<xsl:apply-templates select="//jnl:jnl-info/jnl:date/jnl:year/."/>
					</xsl:element>
				</xsl:element>
				<xsl:choose>
					<xsl:when
						test="//jnl:misc-date/jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]">
						<xsl:element name="pub-date">
							<xsl:attribute name="pub-type">epub</xsl:attribute>
							<xsl:apply-templates
								select="//jnl:misc-date[jnl:date-text/text()[contains(. , 'online') or contains(. , 'ONLINE') or contains(. , 'Online')]]/jnl:date"
							/>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates select="jnl:doc" mode="info"/>
				<xsl:text disable-output-escaping="yes">&lt;/article-meta&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;/front&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;body&gt;</xsl:text>
				<xsl:call-template name="newline"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:element name="sec">
			<xsl:if test="jnl:title[node()]">
				<xsl:element name="title">
					<xsl:apply-templates select="jnl:title[node()]"/>
				</xsl:element>
			</xsl:if>
			<xsl:choose>
				<xsl:when
					test="jnl:author-grp/node()[self::jnl:author or self::jnl:aff or self::jnl:dept-list]">
					<xsl:element name="p">
						<xsl:choose>
							<xsl:when test="jnl:author-grp/jnl:author">
								<xsl:for-each select="jnl:author-grp/jnl:author">
									<xsl:if test="//jnl:bmj-module-no/. = '3'">
										<xsl:choose>
											<xsl:when test="contains(@affs,' ')">
												<xsl:call-template name="write-affss">
												<xsl:with-param name="rids-attribute-value"
												select="@affs"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="@affs and @affs != ''">
												<xsl:variable name="rrids" select="@affs"/>
												<xsl:apply-templates
												select="following-sibling::jnl:aff[@id = $rrids]"
												mode="Referss"/>
											</xsl:when>
										</xsl:choose>
									</xsl:if>
									<xsl:for-each select="node()">
										<xsl:choose>
											<xsl:when test="self::jnl:initial">
												<xsl:apply-templates mode="nodot"/>
												<xsl:text>.</xsl:text>
											</xsl:when>
											<xsl:when test="self::jnl:footnote"> </xsl:when>
											<xsl:when test="self::jnl:noteref">
												<xsl:apply-templates select="self::node()"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when
												test="following-sibling::node()[position() = 1 and self::jnl:noteref]"/>
											<xsl:when
												test="following-sibling::node()[position() = 1 and self::jnl:footnote]"/>
											<xsl:when test="following-sibling::node()">
												<xsl:text> </xsl:text>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									<xsl:if test="not(//jnl:bmj-module-no/. = '3')">
										<xsl:choose>
											<xsl:when test="contains(@affs,' ')">
												<xsl:call-template name="write-affss">
												<xsl:with-param name="rids-attribute-value"
												select="@affs"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="@affs and @affs != ''">
												<xsl:variable name="rrids" select="@affs"/>
												<xsl:apply-templates
												select="following-sibling::jnl:aff[@id = $rrids]"
												mode="Referss"/>
											</xsl:when>
										</xsl:choose>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="following-sibling::jnl:author">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:when
											test="parent::jnl:author-grp/following-sibling::jnl:author-grp/jnl:author">
											<xsl:text>, </xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
								<xsl:text>.</xsl:text>
								<xsl:if
									test="jnl:author-grp/node()[self::jnl:aff or self::jnl:dept-list]">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when
								test="jnl:author-grp/node()[self::jnl:aff or self::jnl:dept-list]">
								<xsl:if test="//jnl:bmj-module-no/. = '3'">
									<xsl:text disable-output-escaping="yes">&lt;italic&gt;</xsl:text>
								</xsl:if>
								<xsl:for-each
									select="jnl:author-grp/node()[self::jnl:aff or self::jnl:dept-list]">
									<xsl:choose>
										<xsl:when test="self::jnl:aff">
											<xsl:if test="@num and @num != ''">
												<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
												<xsl:value-of select="@num"/>
												<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
											</xsl:if>
											<xsl:if test="jnl:org-name/node()">
												<xsl:apply-templates select="jnl:org-name/node()"/>
												<xsl:if test="jnl:address/node()/node()">
												<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:if>
											<xsl:for-each select="jnl:address/node()">
												<xsl:if test="node()">
												<xsl:apply-templates/>
												<xsl:if test="following-sibling::node()/node()">
												<xsl:text>, </xsl:text>
												</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="self::jnl:dept-list">
											<xsl:if test="jnl:hdr-txt/node()">
												<xsl:apply-templates select="jnl:hdr-txt"
												mode="affs"/>
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:for-each select="jnl:dept">
												<xsl:apply-templates/>
												<xsl:if test="following-sibling::jnl:dept">
												<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<xsl:if
												test="jnl:org-name/node() or jnl:address/node()/node()">
												<xsl:text>, </xsl:text>
												<xsl:if test="jnl:org-name/node()">
												<xsl:apply-templates select="jnl:org-name/node()"/>
												<xsl:if test="jnl:address/node()/node()">
												<xsl:text>, </xsl:text>
												</xsl:if>
												</xsl:if>
												<xsl:for-each select="jnl:address/node()">
												<xsl:if test="node()">
												<xsl:apply-templates/>
												<xsl:if test="following-sibling::node()/node()">
												<xsl:text>, </xsl:text>
												</xsl:if>
												</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="following-sibling::jnl:aff">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:when test="following-sibling::jnl:dept-list">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:when
											test="parent::jnl:author-grp/following-sibling::jnl:author-grp/jnl:aff">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:when
											test="parent::jnl:author-grp/following-sibling::jnl:author-grp/jnl:dept-list">
											<xsl:text>, </xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="//jnl:bmj-module-no/. = '3'">
							<xsl:text disable-output-escaping="yes">&lt;/italic&gt;</xsl:text>
						</xsl:if>
					</xsl:element>
				</xsl:when>
			</xsl:choose>
			<xsl:for-each select="jnl:section[not(@type = 'MoreInfo')]">
				<xsl:choose>
					<xsl:when
						test="node()[position() = 1 and self::jnl:title[node()]] and node()[position() = 2 and self::jnl:p[node()]]">
						<xsl:element name="p">
							<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
							<xsl:apply-templates select="node()[position() = 1]/node()"/>
							<xsl:text disable-output-escaping="yes">&lt;/bold&gt; </xsl:text>
							<xsl:apply-templates select="node()[position() = 2]/node()"/>
						</xsl:element>
						<xsl:apply-templates select="node()[position() &gt; 2]"/>
					</xsl:when>
					<xsl:when
						test="node()[position() = 1 and self::jnl:title] and node()[position() = 2 and self::jnl:p[node()]]">
						<xsl:apply-templates select="node()[position() &gt; 1]"/>
					</xsl:when>
					<xsl:when
						test="node()[position() = 1 and self::jnl:title[node()]] and node()[position() = 1 and self::jnl:p]">
						<xsl:element name="p">
							<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
							<xsl:apply-templates select="node()[position() = 1]/node()"/>
							<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
						</xsl:element>
						<xsl:apply-templates select="node()[position() &gt; 2]"/>
					</xsl:when>
					<xsl:when test="node()[position() = 1 and self::jnl:title[node()]]">
						<xsl:element name="p">
							<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
							<xsl:apply-templates select="node()[position() = 1]/node()"/>
							<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
						</xsl:element>
						<xsl:apply-templates select="node()[position() &gt; 1]"/>
					</xsl:when>
					<xsl:when test="node()[position() = 1 and self::jnl:title]">
						<xsl:apply-templates select="node()[position() &gt; 1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:element>
		<xsl:choose>
			<xsl:when test="following-sibling::jnl:abstract"/>
			<xsl:otherwise>
				<xsl:call-template name="newline"/>
				<xsl:text disable-output-escaping="yes">&lt;/body&gt;</xsl:text>
				<xsl:call-template name="newline"/>
				<xsl:choose>
					<xsl:when test="//jnl:refs | //jnl:footnote">
						<xsl:element name="back">
							<xsl:apply-templates select="//jnl:refs"/>
							<xsl:if test="//jnl:footnote">
								<xsl:element name="fn-group">
									<xsl:apply-templates select="//jnl:footnote" mode="backfoot"/>
								</xsl:element>
							</xsl:if>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:doc" mode="info">
		<xsl:element name="volume">
			<xsl:apply-templates select="jnl:jnl-info/jnl:vol/node()"/>
		</xsl:element>
		<xsl:element name="issue">
			<xsl:apply-templates select="jnl:jnl-info/jnl:issue-no/node()"/>
		</xsl:element>
		<xsl:choose>
			<xsl:when test="$CustCode = 'plos'">
				<xsl:element name="elocation-id">
					<xsl:apply-templates select="//jnl:unit-info[1]/jnl:unit-id/node()"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="fpage">
					<xsl:apply-templates select="//jnl:unit-info/jnl:fpage/node()"/>
				</xsl:element>
				<xsl:element name="lpage">
					<xsl:apply-templates select="//jnl:unit-info/jnl:lpage/node()"/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:doc" mode="jnlinfo">
		<xsl:element name="journal-meta">
			<xsl:choose>
				<xsl:when test="$CustCode = 'eego'">
					<xsl:element name="journal-id">
						<xsl:attribute name="journal-id-type">publisher</xsl:attribute>
						<xsl:text>Eego</xsl:text>
					</xsl:element>
					<xsl:element name="journal-id">
						<xsl:attribute name="journal-id-type">flc</xsl:attribute>
						<xsl:value-of select="$CustCode"/>
					</xsl:element>
					<xsl:element name="journal-id">
						<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
						<xsl:text>Environmental and Engineering Geophysics</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:when test="$CustCode = 'plos'">
					<xsl:element name="journal-id">
						<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
						<xsl:apply-templates select="//jnl:jnl-info/jnl:medline-jnl-tl/."/>
					</xsl:element>
					<xsl:element name="journal-id">
						<xsl:attribute name="journal-id-type">publisher-id</xsl:attribute>
						<xsl:value-of select="$CustCode"/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="$JrnalCode != ''">
					<xsl:element name="journal-id">
						<xsl:attribute name="journal-id-type">publisher</xsl:attribute>
						<xsl:value-of select="$CustCode"/>
					</xsl:element>
					<xsl:choose>
						<xsl:when test="$CustCode = 'estu'"/>
						<xsl:when
							test="$CustCode = 'jaba' or $CustCode = 'jeab' or jnl:jnl-info/jnl:medline-jnl-tl/. != ''">
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
								<xsl:choose>
									<xsl:when test="$CustCode = 'jaba'">
										<xsl:text>J Appl Behav Analysis</xsl:text>
									</xsl:when>
									<xsl:when test="$CustCode = 'jeab'">
										<xsl:text>Journal of the Experimental Analysis of Behavior</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates
											select="jnl:jnl-info/jnl:medline-jnl-tl/."/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="$CustCode = 'estu'"/>
						<xsl:when
							test="$CustCode = 'jaba' or $CustCode = 'jeab' or jnl:jnl-info/jnl:medline-jnl-tl/. != ''">
							<xsl:element name="journal-id">
								<xsl:attribute name="journal-id-type">nlm-ta</xsl:attribute>
								<xsl:choose>
									<xsl:when test="$CustCode = 'jaba'">
										<xsl:text>J Appl Behav Analysis</xsl:text>
									</xsl:when>
									<xsl:when test="$CustCode = 'jeab'">
										<xsl:text>Journal of the Experimental Analysis of Behavior</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates
											select="jnl:jnl-info/jnl:medline-jnl-tl/."/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
					<xsl:element name="journal-id">
						<xsl:choose>
							<xsl:when test="$CustCode = 'plos'">
								<xsl:attribute name="journal-id-type">publisher-id</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="journal-id-type">publisher</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="$CustCode"/>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:element name="journal-title">
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
						<xsl:text>Acupuncture in Medicine</xsl:text>
					</xsl:when>
					<xsl:when test="//jnl:jnl-tl[. = 'BMJ Case Reports' or . = 'BMJ Case Report']">
						<xsl:text>BMJ Case Reports</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="jnl:jnl-info/jnl:jnl-tl"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:choose>
				<xsl:when test="$CustCode = 'plos'">
					<xsl:if test="jnl:jnl-info/jnl:issn[@type = 'online']">
						<xsl:element name="issn">
							<xsl:attribute name="pub-type">epub</xsl:attribute>
							<xsl:apply-templates select="jnl:jnl-info/jnl:issn[@type='online']/."/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$CustCode = 'addi'">
					<xsl:if test="jnl:jnl-info/jnl:issn[@type = 'online']">
						<xsl:element name="issn">
							<xsl:attribute name="pub-type">epub</xsl:attribute>
							<xsl:apply-templates select="jnl:jnl-info/jnl:issn[@type='online']/."/>
						</xsl:element>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$CustCode = 'estu'">
					<xsl:element name="issn">
						<xsl:attribute name="pub-type">ppub</xsl:attribute>
						<xsl:text>1559-2723</xsl:text>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="jnl:jnl-info/jnl:issn[@type = 'online']">
						<xsl:element name="issn">
							<xsl:attribute name="pub-type">epub</xsl:attribute>
							<xsl:apply-templates select="jnl:jnl-info/jnl:issn[@type='online']/."/>
						</xsl:element>
					</xsl:if>
					<xsl:element name="issn">
						<xsl:attribute name="pub-type">ppub</xsl:attribute>
						<xsl:apply-templates select="jnl:jnl-info/jnl:issn[@type='print']/."/>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:element name="publisher">
				<xsl:choose>
					<xsl:when test="$CustCode = 'eego'">
						<xsl:element name="publisher-name">
							<xsl:text>Environmental and Engineering Geophysics</xsl:text>
						</xsl:element>
					</xsl:when>
					<xsl:when test="$CustCode = 'jaba'">
						<xsl:element name="publisher-name">
							<xsl:text>The Society for the Experimental Analysis of Behavior</xsl:text>
						</xsl:element>
						<xsl:element name="publisher-loc">
							<xsl:text>Bloomington, Indiana</xsl:text>
						</xsl:element>
					</xsl:when>
					<xsl:when test="$CustCode = 'jeab'">
						<xsl:element name="publisher-name">
							<xsl:text>Society for the Experimental Analysis of Behavior, Inc.</xsl:text>
						</xsl:element>
						<xsl:element name="publisher-loc">
							<xsl:text>Bloomington, Indiana</xsl:text>
						</xsl:element>
					</xsl:when>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BAM'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bam'">
						<xsl:element name="publisher-name">
							<xsl:text>BMJ Publishing Group Limited</xsl:text>
						</xsl:element>
						<xsl:element name="publisher-loc">
							<xsl:text>BMA House, Tavistock Square, London, WC1H 9JR</xsl:text>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="publisher-name">
							<xsl:apply-templates select="jnl:jnl-info/jnl:pub-name/."/>
						</xsl:element>
						<xsl:element name="publisher-loc">
							<xsl:apply-templates select="jnl:jnl-info/jnl:pub-loc/."/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="splittopic">
		<xsl:param name="string"/>
		<xsl:if test="$string != ''">
			<xsl:choose>
				<xsl:when test="contains($string , ';')">
					<xsl:variable name="first" select="substring-before($string,';')"/>
					<xsl:variable name="rest" select="substring-after($string,';')"/>
					<xsl:if test="$first != ''">
						<xsl:value-of select="$first"/>
					</xsl:if>
					<xsl:text disable-output-escaping="yes">&lt;/subject&gt;</xsl:text>
					<xsl:call-template name="newline"/>
					<xsl:text disable-output-escaping="yes">&lt;subject&gt;</xsl:text>
					<xsl:choose>
						<xsl:when test="$rest = ' ' or $rest = ''"/>
						<xsl:when test="starts-with($rest , ' ')">
							<xsl:call-template name="splittopic">
								<xsl:with-param name="string" select="substring-after($rest,' ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="splittopic">
								<xsl:with-param name="string" select="$rest"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$string"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="splittopicend">
		<xsl:param name="string"/>
		<xsl:if test="$string != ''">
			<xsl:choose>
				<xsl:when test="contains($string , ';')">
					<xsl:variable name="first" select="substring-before($string,';')"/>
					<xsl:variable name="rest" select="substring-after($string,';')"/>
					<xsl:if test="$first != ''">
						<xsl:value-of select="$first"/>
					</xsl:if>
					<xsl:text disable-output-escaping="yes">&lt;/subject&gt;</xsl:text>
					<xsl:call-template name="newline"/>
					<xsl:choose>
						<xsl:when test="$rest = ' ' or $rest = ''"/>
						<xsl:when test="starts-with($rest , ' ')">
							<xsl:text disable-output-escaping="yes">&lt;subject&gt;</xsl:text>
							<xsl:call-template name="splittopicend">
								<xsl:with-param name="string" select="substring-after($rest,' ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&lt;subject&gt;</xsl:text>
							<xsl:call-template name="splittopicend">
								<xsl:with-param name="string" select="$rest"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$string"/>
					<xsl:text disable-output-escaping="yes">&lt;/subject&gt;</xsl:text>
					<xsl:call-template name="newline"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="processing-instruction('ENTCHAR')" mode="Position" priority="2">
		<xsl:variable name="content1" select="."/>
		<xsl:variable name="content">
			<xsl:choose>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'IMJ' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'imj'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
					<xsl:value-of select="$content1"/>
				</xsl:when>
				<xsl:when
					test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:when test="preceding-sibling::node()[position() = 1 and self::text()]">
					<xsl:value-of
						select="translate($content1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$content1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$content = '#296'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'emsp' and parent::jnl:p[parent::tbl:entry] and preceding-sibling::node()[not(self::processing-instruction('ENTCHAR')[. = 'emsp'])]">
				<xsl:text disable-output-escaping="yes">&amp;emsp;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp' and parent::jnl:p[parent::tbl:entry]">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:url">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:email">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:url">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:email">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:url">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>(</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:email">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:url">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:email">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:url">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:email">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:url">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>\</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:email">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:url">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:email">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:url">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:email">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:url">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:email">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:url">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:email">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:url">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:email">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:url">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:email">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:url">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:email">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:url">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:email">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:url">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqb' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:email">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:url">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:email">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:url">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:email">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:url">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:email">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:url">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:email">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:url">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:email">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:url">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:email">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:url">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:email">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:url">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:email">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:url">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar' and ancestor::jnl:note[@type = 'url']">
				<xsl:text>|</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'"> </xsl:when>
			<xsl:when test="$content = 'khgr'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ensp' and ancestor::jnl:citref">
				<xsl:text disable-output-escaping="yes"> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ndash' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ensp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'thinsp'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
				<xsl:value-of select="$content"/>
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="following-sibling::node()[position() = 1]" mode="Position"/>
	</xsl:template>
	<xsl:template match="text()" mode="Position" priority="2">
		<xsl:variable name="content1" select="."/>
		<xsl:value-of select="$content1"/>
		<xsl:apply-templates select="following-sibling::node()[position() = 1]" mode="Position"/>
	</xsl:template>
	<xsl:template match="jnl:emph" mode="Position" priority="2">
		<xsl:choose>
			<xsl:when test="parent::jnl:addr-cpn and @type = 'bold' or @type = 'sup'"/>
			<xsl:otherwise>
				<xsl:apply-templates mode="Position"/>
				<xsl:apply-templates select="following-sibling::node()[position() = 1]"
					mode="Position"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="check-address">
		<xsl:param name="stext"/>
		<xsl:variable name="rtext"
			select="translate($stext , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		<xsl:choose>
			<xsl:when test="contains($rtext , 'faculty')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'school')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'department')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'college')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'centre')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'center')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'human')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'development')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'health')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'university')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'hospital')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'universidad')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'institut')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'laborat&amp;oacute;rio')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'servi&amp;ccedil;o')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'superior')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'tecnologia')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'faculdade')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'medicina')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'research')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'ucla')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'group')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'registry')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'unit')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'primary care')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'idiap jordi gol')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'medical care')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'nui galway')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'hse west')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'direction')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'politique')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'm&amp;eacute;dicale')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'ap-hp')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'ceis sanit&amp;agrave;')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'facolt&amp;agrave;')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'economia')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'cnr')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'sanit&amp;agrave;')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'pubblica')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'eurocat')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'st george&amp;rsquo;s')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'division')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'associates')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'obstetrics')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'paediatrics')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'society')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'medicine')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'asl roma')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'office')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'service')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'biostatistics')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'laboratory')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'epidemiology')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'demography')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'biometry')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'front')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'national')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'laboratories')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'diabetes')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'obstetrics')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'foundation')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'trust')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'hsph')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'oncology')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'reproductive')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'anaesthesia')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'academy')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'collegium')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'studies')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'agency')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'service')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'transport')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'section')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'clinical')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , '&amp;agrave;rea')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'ib&amp;lowbar;salut')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'foundation')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'region')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'informatics')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'studies')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'ucl')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'hsmc')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'universit&amp;eacute;')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="contains($rtext , 'cetaf-rppc')">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-address">
		<xsl:param name="ridstext"/>
		<xsl:param name="ridstag"/>
		<xsl:if test="$ridstext != ''">
			<xsl:variable name="start">
				<xsl:choose>
					<xsl:when test="contains($ridstext , ',')">
						<xsl:value-of disable-output-escaping="yes"
							select="substring-before($ridstext ,',')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of disable-output-escaping="yes" select="$ridstext"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="next">
				<xsl:choose>
					<xsl:when test="contains($ridstext , ',')">
						<xsl:value-of disable-output-escaping="yes"
							select="substring-after($ridstext ,',')"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="instr">
				<xsl:call-template name="check-address">
					<xsl:with-param name="stext" select="$start"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$instr != ''">
					<xsl:choose>
						<xsl:when test="$ridstag = '1'">
							<xsl:text>,</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&lt;institution&gt;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of disable-output-escaping="yes" select="$start"/>
					<xsl:choose>
						<xsl:when test="$next != ''">
							<xsl:call-template name="write-address">
								<xsl:with-param name="ridstext" select="$next"/>
								<xsl:with-param name="ridstag" select="1"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&lt;/institution&gt;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="$ridstag = '1'">
							<xsl:text disable-output-escaping="yes">&lt;/institution&gt;</xsl:text>
						</xsl:when>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">&lt;addr-line&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="normalize-space($ridstext)"/>
					<xsl:text disable-output-escaping="yes">&lt;/addr-line&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-affsnum">
		<xsl:param name="rids-attribute-value"/>
		<xsl:variable name="normal-attr-value" select="normalize-space($rids-attribute-value)"/>
		<xsl:if test="$normal-attr-value != ''">
			<xsl:choose>
				<xsl:when test="contains($normal-attr-value ,  ',')">
					<xsl:variable name="first"
						select="normalize-space(substring-before($normal-attr-value,','))"/>
					<xsl:variable name="rest"
						select="normalize-space(substring-after($normal-attr-value,','))"/>
					<xsl:for-each
						select="following-sibling::jnl:aff/jnl:address/jnl:addr-cpn/jnl:emph[@type and @type = 'sup' and . = $first]">
						<xsl:variable name="tcount"
							select="count(ancestor::jnl:abstract/preceding-sibling::jnl:abstract) + 1"/>
						<xsl:text disable-output-escaping="yes">&lt;xref ref-type="aff" rid="aff</xsl:text>
						<xsl:choose>
							<xsl:when
								test="parent::jnl:addr-cpn/node()[position() = 1 and self::jnl:emph[@type and @type = 'sup']]">
								<xsl:value-of
									select="count(preceding-sibling::jnl:emph[@type and @type = 'sup']) + 1"
								/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="count(preceding-sibling::jnl:emph[@type and @type = 'sup']) + 2"
								/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>-</xsl:text>
						<xsl:choose>
							<xsl:when test="string-length($tcount) = 1">
								<xsl:text>00</xsl:text>
							</xsl:when>
							<xsl:when test="string-length($tcount) = 2">
								<xsl:text>0</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:value-of select="$tcount"/>
						<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						<xsl:value-of select="$first"/>
						<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					</xsl:for-each>
					<xsl:if test="$rest !=''">
						<xsl:call-template name="write-affsnum">
							<xsl:with-param name="rids-attribute-value" select="$rest"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each
						select="following-sibling::jnl:aff/jnl:address/jnl:addr-cpn/jnl:emph[@type and @type = 'sup' and . = $rids-attribute-value]">
						<xsl:variable name="tcount"
							select="count(ancestor::jnl:abstract/preceding-sibling::jnl:abstract) + 1"/>
						<xsl:text disable-output-escaping="yes">&lt;xref ref-type="aff" rid="aff</xsl:text>
						<xsl:choose>
							<xsl:when
								test="parent::jnl:addr-cpn/node()[position() = 1 and self::jnl:emph[@type and @type = 'sup']]">
								<xsl:value-of
									select="count(preceding-sibling::jnl:emph[@type and @type = 'sup']) + 1"
								/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="count(preceding-sibling::jnl:emph[@type and @type = 'sup']) + 2"
								/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>-</xsl:text>
						<xsl:choose>
							<xsl:when test="string-length($tcount) = 1">
								<xsl:text>00</xsl:text>
							</xsl:when>
							<xsl:when test="string-length($tcount) = 2">
								<xsl:text>0</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:value-of select="$tcount"/>
						<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						<xsl:value-of select="$rids-attribute-value"/>
						<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-content">
		<xsl:param name="value"/>
		<xsl:if test="$value != ''">
			<xsl:choose>
				<xsl:when test="contains($value , '&amp;')">
					<xsl:variable name="first" select="substring-before($value , '&amp;')"/>
					<xsl:variable name="refer"
						select="substring-before(substring-after($value , '&amp;') , ';')"/>
					<xsl:variable name="rest"
						select="substring-after(substring-after($value , '&amp;') , ';')"/>
					<xsl:if test="$first != ''">
						<xsl:value-of select="$first"/>
					</xsl:if>
					<xsl:if test="$refer != ''">
						<xsl:call-template name="write-ent">
							<xsl:with-param name="content" select="$refer"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$rest != ''">
						<xsl:call-template name="write-content">
							<xsl:with-param name="value" select="$rest"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$value"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-ent">
		<xsl:param name="content"/>
		<xsl:choose>
			<xsl:when test="$content = 'hairsp'"/>
			<xsl:when test="$content = 'amp'">
				<xsl:text disable-output-escaping="yes">&amp;amp;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat'">
				<xsl:text disable-output-escaping="yes">@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsquo'">
				<xsl:text disable-output-escaping="yes">'</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsquo'">
				<xsl:text disable-output-escaping="yes">'</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar'">
				<xsl:text disable-output-escaping="yes">_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text disable-output-escaping="yes">/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text disable-output-escaping="yes">:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'shy'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percnt'">
				<xsl:text disable-output-escaping="yes">%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'bsol'">
				<xsl:text disable-output-escaping="yes">\</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'num'">
				<xsl:text disable-output-escaping="yes">#</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text disable-output-escaping="yes">?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'dollar'">
				<xsl:text disable-output-escaping="yes">$</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lsqu'">
				<xsl:text disable-output-escaping="yes">[</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rsqu'">
				<xsl:text disable-output-escaping="yes">]</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'plus'">
				<xsl:text disable-output-escaping="yes">+</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'minus'">
				<xsl:text disable-output-escaping="yes">-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ast'">
				<xsl:text disable-output-escaping="yes">*</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal'">
				<xsl:text disable-output-escaping="yes">=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals'">
				<xsl:text>=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'percent'">
				<xsl:text disable-output-escaping="yes">%</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'comma'">
				<xsl:text disable-output-escaping="yes">,</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'period'">
				<xsl:text disable-output-escaping="yes">.</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'excl'">
				<xsl:text disable-output-escaping="yes">!</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lcub'">
				<xsl:text disable-output-escaping="yes">{</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rcub'">
				<xsl:text disable-output-escaping="yes">}</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'verbar'">
				<xsl:text disable-output-escaping="yes">|</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when
				test="$content = 'semi' and ancestor::jnl:othinfo[parent::jnl:cit[@type and @type = 'other'] and not(preceding-sibling::node()) and not(following-sibling::node())]">
				<xsl:text disable-output-escaping="yes">&amp;semi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'semi'">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'emsp'"> </xsl:when>
			<xsl:when test="$content = 'khgr'">
				<xsl:text disable-output-escaping="yes">&amp;chi;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lpar'">
				<xsl:text disable-output-escaping="yes">&amp;lpar;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'rpar'">
				<xsl:text disable-output-escaping="yes">&amp;rpar;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'lowbar'">
				<xsl:text>_</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text>?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'Dagger'">
				<xsl:text disable-output-escaping="yes">&amp;Dagger;</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:editor[parent::jnl:author-grp]">
		<xsl:variable name="ASurname">
			<xsl:apply-templates select="jnl:surname" mode="getname"/>
		</xsl:variable>
		<xsl:variable name="AForename">
			<xsl:apply-templates select="jnl:forename" mode="getname"/>
			<xsl:apply-templates select="jnl:initial" mode="getname"/>
		</xsl:variable>
		<xsl:variable name="NewAuth"> </xsl:variable>
		<xsl:choose>
			<xsl:when test="$NewAuth = ''">
				<xsl:element name="contrib">
					<xsl:attribute name="contrib-type">editor</xsl:attribute>
					<xsl:choose>
						<xsl:when test="jnl:surname and jnl:forename and //jnl:corresponding-author">
							<xsl:variable name="CorSurname">
								<xsl:apply-templates select="jnl:surname/."/>
							</xsl:variable>
							<xsl:variable name="CorForename">
								<xsl:apply-templates select="jnl:forename/."/>
							</xsl:variable>
							<xsl:for-each select="//jnl:corresponding-author">
								<xsl:choose>
									<xsl:when test="jnl:surname and jnl:forename">
										<xsl:variable name="Surname">
											<xsl:apply-templates select="jnl:surname" mode="getname"
											/>
										</xsl:variable>
										<xsl:variable name="Forename">
											<xsl:apply-templates select="jnl:forename"
												mode="getname"/>
										</xsl:variable>
										<xsl:if
											test="$CorSurname = $Surname and $CorForename = $Forename">
											<!--<xsl:attribute name="corresp">yes</xsl:attribute>-->
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</xsl:when>
					</xsl:choose>
					<xsl:if test="jnl:surname | jnl:initial | jnl:forename | jnl:americanism">
						<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
						<xsl:if test="jnl:surname">
							<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
							<xsl:apply-templates select="jnl:surname/."/>
							<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						</xsl:if>
						<xsl:if test="jnl:initial | jnl:forename">
							<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
							<xsl:apply-templates select="jnl:forename | jnl:initial"/>
							<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
						</xsl:if>
						<xsl:if test="jnl:americanism">
							<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
							<xsl:apply-templates select="jnl:americanism"/>
							<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&lt;/name&gt;</xsl:text>
					</xsl:if>
					<xsl:if test="jnl:role">
						<xsl:text disable-output-escaping="yes">&lt;role&gt;</xsl:text>
						<xsl:apply-templates select="jnl:role"/>
						<xsl:text disable-output-escaping="yes">&lt;/role&gt;</xsl:text>
					</xsl:if>
					<xsl:if test="jnl:ac-degree">
						<xsl:text disable-output-escaping="yes">&lt;degrees&gt;</xsl:text>
						<xsl:apply-templates select="jnl:ac-degree"/>
						<xsl:text disable-output-escaping="yes">&lt;/degrees&gt;</xsl:text>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="ancestor::jnl:abstract">
							<xsl:choose>
								<xsl:when test="jnl:emph[@type and @type = 'sup']">
									<xsl:variable name="rtext">
										<xsl:apply-templates
											select="jnl:emph[@type and @type = 'sup']/node()"/>
									</xsl:variable>
									<xsl:call-template name="write-affsnum">
										<xsl:with-param name="rids-attribute-value" select="$rtext"
										/>
									</xsl:call-template>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="contains(@affs,' ')">
									<xsl:call-template name="write-affs">
										<xsl:with-param name="rids-attribute-value" select="@affs"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="@affs and @affs != ''">
									<xsl:variable name="rrids" select="@affs"/>
									<xsl:apply-templates select="//jnl:aff[@id = $rrids]"
										mode="Refers"/>
									<xsl:apply-templates select="//jnl:dept[@id = $rrids]"
										mode="Refers"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="following-sibling::jnl:aff"
										mode="Refers"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$CorresAuthor = '1'">
						<xsl:choose>
							<xsl:when
								test="jnl:surname and jnl:forename and //jnl:corresponding-author">
								<xsl:variable name="Surname">
									<xsl:apply-templates select="jnl:surname/."/>
								</xsl:variable>
								<xsl:variable name="Forename">
									<xsl:apply-templates select="jnl:forename/."/>
								</xsl:variable>
								<xsl:call-template name="CheckCorres">
									<xsl:with-param name="CorSurname" select="$Surname"/>
									<xsl:with-param name="CorForename" select="$Forename"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="$CorresAuthor = '0'">
						<xsl:choose>
							<xsl:when
								test="$AuthCorr = '1' and jnl:role/. = 'Corresponding author' and //jnl:corresponding-author"> </xsl:when>
							<xsl:when
								test="$AuthCorr = '1' and jnl:role/. = 'Corresponding Author' and //jnl:corresponding-author"> </xsl:when>
							<xsl:when
								test="jnl:surname and jnl:forename and //jnl:corresponding-author">
								<xsl:variable name="CorSurname">
									<xsl:apply-templates select="jnl:surname/."/>
								</xsl:variable>
								<xsl:variable name="CorForename">
									<xsl:apply-templates select="jnl:forename/."/>
								</xsl:variable>
								<xsl:for-each select="//jnl:corresponding-author">
									<xsl:choose>
										<xsl:when test="jnl:surname and jnl:forename">
											<xsl:variable name="Surname">
												<xsl:apply-templates select="jnl:surname"
												mode="getname"/>
											</xsl:variable>
											<xsl:variable name="Forename">
												<xsl:apply-templates select="jnl:forename"
												mode="getname"/>
											</xsl:variable>
											<xsl:if
												test="$CorSurname = $Surname and $CorForename = $Forename">
												<xsl:variable name="CorAuthors">
												<xsl:choose>
												<xsl:when
												test="preceding-sibling::jnl:corresponding-author or ancestor::jnl:author-grp/preceding-sibling::jnl:author-grp/jnl:corresponding-author">
												<xsl:value-of
												select="count(preceding-sibling::jnl:corresponding-author) + count(ancestor::jnl:author-grp/preceding-sibling::jnl:author-grp/jnl:corresponding-author) + 101"
												/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:text>101</xsl:text>
												</xsl:otherwise>
												</xsl:choose>
												</xsl:variable>
											</xsl:if>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="@role = 'current' or @role = 'contributioncurrent'">
							<xsl:element name="xref">
								<xsl:attribute name="ref-type">
									<xsl:text>fn</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="rid">
									<xsl:text>fn1</xsl:text>
								</xsl:attribute>
								<xsl:choose>
									<xsl:when test="$CustCode = 'plos'">
										<xsl:text disable-output-escaping="yes">&lt;sup&gt;&amp;curren;&lt;/sup&gt;</xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
				</xsl:element>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-typesubjmain">
		<xsl:param name="value"/>
		<xsl:if test="$value != ''">
			<xsl:choose>
				<xsl:when test="$value = '1517'">
					<xsl:text>Findings that shed new light on the possible pathogenesis of a disease or an adverse effect</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1518'">
					<xsl:text>Learning from errors</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1519'">
					<xsl:text>Myth exploded</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1520'">
					<xsl:text>New disease</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1521'">
					<xsl:text>Novel diagnostic procedure</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1522'">
					<xsl:text>Novel treatment (new drug/intervention; established drug/procedure in new situation)</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1523'">
					<xsl:text>Rare disease</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1524'">
					<xsl:text>Reminder of important clinical lesson</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1525'">
					<xsl:text>Unexpected outcome (positive or negative) including adverse drug reactions</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1526'">
					<xsl:text>Unusual association of diseases/symptoms</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1527'">
					<xsl:text>Unusual presentation of more common disease/injury</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1528'">
					<xsl:text>Images in...</xsl:text>
				</xsl:when>
				<xsl:when test="$value = '1530'">
					<xsl:text>Other full case</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-typesubjnum">
		<xsl:param name="value"/>
		<xsl:variable name="Tvalue">
			<xsl:value-of
				select="translate($value , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
			/>
		</xsl:variable>
		<xsl:if test="$value != ''">
			<xsl:choose>
				<xsl:when
					test="$Tvalue = 'findings that shed new light on the possible pathogenesis of a disease or an adverse effect'">
					<xsl:text>1517</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'learning from errors'">
					<xsl:text>1518</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'myth exploded'">
					<xsl:text>1519</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'new disease'">
					<xsl:text>1520</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'novel diagnostic procedure'">
					<xsl:text>1521</xsl:text>
				</xsl:when>
				<xsl:when
					test="$Tvalue = 'novel treatment (new drug/intervention; established drug/procedure in new situation)'">
					<xsl:text>1522</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'rare disease'">
					<xsl:text>1523</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'reminder of important clinical lesson'">
					<xsl:text>1524</xsl:text>
				</xsl:when>
				<xsl:when
					test="$Tvalue = 'unexpected outcome (positive or negative) including adverse drug reactions'">
					<xsl:text>1525</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'unusual association of diseases/symptoms'">
					<xsl:text>1526</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'unusual presentation of more common disease/injury'">
					<xsl:text>1527</xsl:text>
				</xsl:when>
				<xsl:when test="starts-with($Tvalue , 'images in')">
					<xsl:text>1528</xsl:text>
				</xsl:when>
				<xsl:when test="$Tvalue = 'other full case'">
					<xsl:text>1530</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-typesubj">
		<xsl:param name="value"/>
		<xsl:if test="$value != ''">
			<xsl:element name="subj-group">
				<xsl:attribute name="subj-group-type">
					<xsl:text>case-report-type</xsl:text>
				</xsl:attribute>
				<xsl:element name="subject">
					<xsl:value-of disable-output-escaping="yes" select="$value"/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-seriestitle">
		<xsl:param name="value"/>
		<xsl:if test="$value != ''">
			<xsl:element name="series-title">
				<xsl:value-of disable-output-escaping="yes" select="$value"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-before-period">
		<xsl:param name="rids-text"/>
		<xsl:variable name="start" select="substring-before($rids-text ,'.')"/>
		<xsl:variable name="next" select="substring-after($rids-text,'.')"/>
		<xsl:choose>
			<xsl:when test="$next !='' and contains($next , '.')">
				<xsl:value-of select="$start"/>
				<xsl:text>.</xsl:text>
				<xsl:call-template name="write-before-period">
					<xsl:with-param name="rids-text" select="$next"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$next !='' and starts-with($next , ' ')">
				<xsl:value-of disable-output-escaping="yes" select="$start"/>
				<xsl:text>. </xsl:text>
			</xsl:when>
			<xsl:when test="$next !=''">
				<xsl:value-of disable-output-escaping="yes" select="$start"/>
				<xsl:text>.</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-after-period">
		<xsl:param name="rids-text"/>
		<xsl:choose>
			<xsl:when test="contains($rids-text , '.')">
				<xsl:variable name="start" select="substring-before($rids-text ,'.')"/>
				<xsl:variable name="next" select="substring-after($rids-text,'.')"/>
				<xsl:choose>
					<xsl:when test="$next !=''">
						<xsl:call-template name="write-after-period">
							<xsl:with-param name="rids-text" select="$next"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="starts-with($rids-text , ' ')">
				<xsl:value-of disable-output-escaping="yes" select="substring-after($rids-text,' ')"
				/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-onlynumbers">
		<xsl:param name="value"/>
		<xsl:variable name="nvalue" select="normalize-space($value)"/>
		<xsl:if test="$nvalue != ''">
			<xsl:choose>
				<xsl:when test="contains($nvalue, ' ')">
					<xsl:variable name="first" select="substring-before($nvalue,' ')"/>
					<xsl:variable name="rest" select="substring-after($nvalue,' ')"/>
					<xsl:choose>
						<xsl:when test="$first != ''">
							<xsl:variable name="firstt"
								select="translate($first , '1234567890,', '')"/>
							<xsl:variable name="firsts" select="translate($first , ',', '')"/>
							<xsl:choose>
								<xsl:when test="$firstt = '' and $firsts != ''">
									<xsl:value-of select="$firsts"/>
									<xsl:text> </xsl:text>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
					<xsl:call-template name="write-onlynumbers">
						<xsl:with-param name="value" select="$rest"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="firstt" select="translate($nvalue , '1234567890,', '')"/>
					<xsl:variable name="firsts" select="translate($nvalue , ',', '')"/>
					<xsl:choose>
						<xsl:when test="$firstt = '' and $firsts != ''">
							<xsl:value-of select="$firsts"/>
							<xsl:text> </xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template match="jnl:dept[parent::jnl:dept-list and ancestor::jnl:author-grp]" mode="Refers">
		<xsl:element name="xref">
			<xsl:attribute name="ref-type">aff</xsl:attribute>
			<xsl:attribute name="rid">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
			<xsl:if test="@num and @num != ''">
				<xsl:call-template name="write-num">
					<xsl:with-param name="value" select="@num"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<!-- NEW Functions -->
	<xsl:template name="write-num-text">
		<xsl:param name="value"/>
		<xsl:if test="$value != ''">
			<xsl:choose>
				<xsl:when test="contains($value , '&lt;?ENTCHAR ')">
					<xsl:variable name="first" select="substring-before($value , '&lt;?ENTCHAR ')"/>
					<xsl:variable name="refer"
						select="substring-before(substring-after($value , '&lt;?ENTCHAR ') , '?&gt;')"/>
					<xsl:variable name="rest" select="substring-after($value , '?&gt;')"/>
					<xsl:if test="$first != ''">
						<xsl:value-of select="$first"/>
					</xsl:if>
					<xsl:choose>
						<xsl:when
							test="$refer != '' and $refer = 'hairsp' and $rest != '' and  starts-with($rest , '&lt;?ENTCHAR equals?&gt;')"/>
						<xsl:when test="$refer != ''">
							<xsl:call-template name="write-ent-text">
								<xsl:with-param name="content" select="$refer"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when
							test="$refer != '' and $refer = 'equals' and $rest != '' and  starts-with($rest , '&lt;?ENTCHAR hairsp?&gt;')">
							<xsl:variable name="rest2"
								select="substring-after($rest , '&lt;?ENTCHAR hairsp?&gt;')"/>
							<xsl:if test="$rest2 != ''">
								<xsl:call-template name="write-num-text">
									<xsl:with-param name="value" select="$rest2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$rest != ''">
							<xsl:call-template name="write-num-text">
								<xsl:with-param name="value" select="$rest"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="contains($value , '|##|')">
					<xsl:variable name="first" select="substring-before($value , '|##|')"/>
					<xsl:variable name="refer"
						select="substring-before(substring-after($value , '|##|') , '|###|')"/>
					<xsl:variable name="rest" select="substring-after($value , '|###|')"/>
					<xsl:if test="$first != ''">
						<xsl:value-of select="$first"/>
					</xsl:if>
					<xsl:choose>
						<xsl:when
							test="$refer != '' and $refer = 'hairsp' and $rest != '' and  starts-with($rest , '|##|equals|###|')"/>
						<xsl:when test="$refer != ''">
							<xsl:call-template name="write-ent-text">
								<xsl:with-param name="content" select="$refer"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when
							test="$refer != '' and $refer = 'equals' and $rest != '' and  starts-with($rest , '|##|hairsp|###|')">
							<xsl:variable name="rest2"
								select="substring-after($rest , '|##|hairsp|###|')"/>
							<xsl:if test="$rest2 != ''">
								<xsl:call-template name="write-num-text">
									<xsl:with-param name="value" select="$rest2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
						<xsl:when test="$rest != ''">
							<xsl:call-template name="write-num-text">
								<xsl:with-param name="value" select="$rest"/>
							</xsl:call-template>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$value"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-num">
		<xsl:param name="value"/>
		<xsl:if test="$value != ''">
			<xsl:choose>
				<xsl:when test="contains($value , '&lt;?ENTCHAR ')">
					<xsl:variable name="first" select="substring-before($value , '&lt;?ENTCHAR ')"/>
					<xsl:variable name="refer"
						select="substring-before(substring-after($value , '&lt;?ENTCHAR ') , '?&gt;')"/>
					<xsl:variable name="rest" select="substring-after($value , '?&gt;')"/>
					<xsl:if test="$first != ''">
						<xsl:value-of select="$first"/>
					</xsl:if>
					<xsl:if test="$refer != ''">
						<xsl:call-template name="write-ent">
							<xsl:with-param name="content" select="$refer"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$rest != ''">
						<xsl:call-template name="write-num">
							<xsl:with-param name="value" select="$rest"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="contains($value , '|##|')">
					<xsl:variable name="first" select="substring-before($value , '|##|')"/>
					<xsl:variable name="refer"
						select="substring-before(substring-after($value , '|##|') , '|###|')"/>
					<xsl:variable name="rest" select="substring-after($value , '|###|')"/>
					<xsl:if test="$first != ''">
						<xsl:value-of select="$first"/>
					</xsl:if>
					<xsl:if test="$refer != ''">
						<xsl:call-template name="write-ent">
							<xsl:with-param name="content" select="$refer"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$rest != ''">
						<xsl:call-template name="write-num">
							<xsl:with-param name="value" select="$rest"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$value"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-ent-text">
		<xsl:param name="content"/>
		<xsl:choose>
			<xsl:when test="$content = 'commat' and ancestor::jnl:email">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'commat' and ancestor::jnl:note[@type = 'email']">
				<xsl:text>@</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'tilde'">
				<xsl:text disable-output-escaping="yes">~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'quest'">
				<xsl:text disable-output-escaping="yes">?</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'amp'">
				<xsl:text disable-output-escaping="yes">&amp;amp;</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equal'">
				<xsl:text disable-output-escaping="yes">=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'equals'">
				<xsl:text disable-output-escaping="yes">=</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sim'">
				<xsl:text disable-output-escaping="yes">~</xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#146'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = '#6'">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'ndash' and ancestor::jnl:citref">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'hyphen'">
				<xsl:text>-</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'sol'">
				<xsl:text>/</xsl:text>
			</xsl:when>
			<xsl:when test="$content = 'colon'">
				<xsl:text>:</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
				<xsl:value-of select="$content"/>
				<xsl:text disable-output-escaping="yes">;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-authors">
		<xsl:param name="value"/>
		<xsl:variable name="first" select="normalize-space(substring-before($value,','))"/>
		<xsl:variable name="rest" select="normalize-space(substring-after($value,','))"/>
		<xsl:variable name="first1">
			<xsl:choose>
				<xsl:when test="$first != ''">
					<xsl:value-of
						select="translate($first , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
					/>
				</xsl:when>
				<xsl:when test="$rest = ''">
					<xsl:value-of
						select="translate($value , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"
					/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$first1 = 'ETAL' or $first1 = 'ET AL'">
				<xsl:text disable-output-escaping="yes">&lt;etal/&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="$first != ''">
				<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
				<xsl:call-template name="write-author">
					<xsl:with-param name="value" select="$first"/>
					<xsl:with-param name="ttag" select="0"/>
				</xsl:call-template>
				<xsl:text disable-output-escaping="yes">&lt;/name&gt;
</xsl:text>
			</xsl:when>
			<xsl:when test="$rest = '' and $value != ''">
				<xsl:text disable-output-escaping="yes">&lt;name&gt;</xsl:text>
				<xsl:call-template name="write-author">
					<xsl:with-param name="value" select="$value"/>
					<xsl:with-param name="ttag" select="0"/>
				</xsl:call-template>
				<xsl:text disable-output-escaping="yes">&lt;/name&gt;
</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="$rest != ''">
			<xsl:call-template name="write-authors">
				<xsl:with-param name="value" select="$rest"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-author">
		<xsl:param name="value"/>
		<xsl:param name="ttag"/>
		<xsl:variable name="first" select="normalize-space(substring-before($value,' '))"/>
		<xsl:variable name="rest" select="normalize-space(substring-after($value,' '))"/>
		<xsl:choose>
			<xsl:when test="$first != '' or $rest != ''">
				<xsl:variable name="first1"
					select="translate($first , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')"/>
				<xsl:variable name="rest1" select="normalize-space(substring-before($rest,' '))"/>
				<xsl:variable name="rest2">
					<xsl:choose>
						<xsl:when test="$rest1 != ''">
							<xsl:value-of
								select="translate($rest1 , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of
								select="translate($rest , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$rest2 = ''">
						<xsl:choose>
							<xsl:when test="$ttag = '0'">
								<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:value-of disable-output-escaping="yes" select="$first"/>
						<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
						<xsl:choose>
							<xsl:when test="$rest1 != ''">
								<xsl:variable name="rest3"
									select="normalize-space(substring-after($rest,' '))"/>
								<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
								<xsl:value-of disable-output-escaping="yes" select="$rest1"/>
								<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
								<xsl:choose>
									<xsl:when test="$rest3 != ''">
										<xsl:text disable-output-escaping="yes">&lt;suffix&gt;</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="$rest3"/>
										<xsl:text disable-output-escaping="yes">&lt;/suffix&gt;</xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
								<xsl:value-of disable-output-escaping="yes" select="$rest"/>
								<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$ttag = '0'">
								<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="$first != ''">
							<xsl:value-of disable-output-escaping="yes" select="$first"/>
						</xsl:if>
						<xsl:if test="$rest != ''">
							<xsl:choose>
								<xsl:when test="$ttag = '0'">
									<xsl:text> </xsl:text>
								</xsl:when>
							</xsl:choose>
							<xsl:call-template name="write-author">
								<xsl:with-param name="value" select="$rest"/>
								<xsl:with-param name="ttag" select="1"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$value != ''">
				<xsl:choose>
					<xsl:when test="$ttag = '0'">
						<xsl:text disable-output-escaping="yes">&lt;surname&gt;</xsl:text>
					</xsl:when>
				</xsl:choose>
				<xsl:value-of disable-output-escaping="yes" select="$value"/>
				<xsl:text disable-output-escaping="yes">&lt;/surname&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;given-names&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;/given-names&gt;</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-text">
		<xsl:param name="value"/>
		<xsl:variable name="first4A" select="substring-before($value, '&amp;semi;')"/>
		<xsl:choose>
			<xsl:when test="contains($value, '&amp;semi;')">
				<xsl:variable name="first5" select="substring-after($value, '&amp;semi;')"/>
				<xsl:value-of disable-output-escaping="yes" select="$first4A"/>
				<xsl:text>;</xsl:text>
				<xsl:call-template name="write-text">
					<xsl:with-param name="value" select="$first5"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of disable-output-escaping="yes" select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-pub-name">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="contains($value , ',')">
				<xsl:variable name="first4" select="substring-before($value, ',')"/>
				<xsl:variable name="first5" select="substring-after($value, ',')"/>
				<xsl:call-template name="write-text">
					<xsl:with-param name="value" select="$first4"/>
				</xsl:call-template>
				<xsl:choose>
					<xsl:when test="contains($first5 , ',')">
						<xsl:text>,</xsl:text>
						<xsl:call-template name="write-pub-name">
							<xsl:with-param name="value" select="$first5"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;/publisher-name&gt;, </xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;year&gt;</xsl:text>
						<xsl:variable name="content2" select="normalize-space($first5)"/>
						<xsl:variable name="content3"
							select="substring($content2, string-length($content2) , 1)"/>
						<xsl:choose>
							<xsl:when test="$content3 = '.'">
								<xsl:call-template name="write-text">
									<xsl:with-param name="value"
										select="substring($content2, 1, string-length($content2)-1)"
									/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="write-text">
									<xsl:with-param name="value" select="normalize-space($first5)"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text disable-output-escaping="yes">&lt;/year&gt;.</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="content2" select="normalize-space($value)"/>
				<xsl:variable name="content3"
					select="substring($content2, string-length($content2) , 1)"/>
				<xsl:choose>
					<xsl:when test="$content3 = '.'">
						<xsl:call-template name="write-text">
							<xsl:with-param name="value"
								select="substring($content2, 1, string-length($content2)-1)"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="write-text">
							<xsl:with-param name="value" select="normalize-space($value)"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text disable-output-escaping="yes">&lt;/publisher-name&gt;.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-pub-name-test">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="contains($value , ',')">
				<xsl:variable name="first4" select="substring-before($value, ',')"/>
				<xsl:variable name="first5" select="substring-after($value, ',')"/>
				<xsl:choose>
					<xsl:when test="contains($first5 , ',')">
						<xsl:call-template name="write-pub-name-test">
							<xsl:with-param name="value" select="$first5"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="content2" select="normalize-space($first5)"/>
						<xsl:variable name="content3"
							select="translate($content2 , '1234567890.', '')"/>
						<xsl:choose>
							<xsl:when test="$content2 = '' or $content3 != ''">
								<xsl:text> </xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="text()" priority="105" mode="sentence">
		<xsl:variable name="content1" select="."/>
		<xsl:choose>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = '#146']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'hyphen']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ensp']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp14']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'mdash']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'ndash']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()[. = 'emsp']]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when
				test="preceding-sibling::node()[position() = 1 and self::processing-instruction()]">
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="SentenceCase">
					<xsl:with-param name="Chars" select="$content1"/>
					<xsl:with-param name="Type" select="0"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:emph" mode="sentence">
		<xsl:choose>
			<xsl:when test="@type='sup' and parent::jnl:surname">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="ancestor::jnl:noteref">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@type='bold'">
				<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='underline'">
				<xsl:text disable-output-escaping="yes">&lt;underline&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/underline&gt;</xsl:text>
			</xsl:when>
			<xsl:when
				test="@type='italic' and parent::jnl:p[@type = 'genus-normal-para' or @type = 'genus-small-para']">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus-species"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='italic' and parent::jnl:p[@type = 'genus-centre']">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='genus'">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='genus-species'">
				<xsl:text disable-output-escaping="yes">&lt;named-content content-type="genus-species"&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/named-content&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='italic'">
				<xsl:choose>
					<xsl:when
						test="ancestor::jnl:othinfo[preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit and not(parent::jnl:cit/jnl:pub-tl)]">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;italic&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='bold-italic'">
				<xsl:choose>
					<xsl:when
						test="ancestor::jnl:othinfo[preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit and not(parent::jnl:cit/jnl:pub-tl)]">
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;&lt;italic&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;&lt;/bold&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='bold_italic'">
				<xsl:choose>
					<xsl:when
						test="ancestor::jnl:othinfo[preceding-sibling::node()[position() = 1 and self::jnl:editor] and parent::jnl:cit and not(parent::jnl:cit/jnl:pub-tl)]">
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/bold&gt;</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;bold&gt;&lt;italic&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/italic&gt;&lt;/bold&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='smallcaps' and parent::jnl:title">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@type='smallcaps'">
				<xsl:choose>
					<xsl:when test="parent::jnl:city or parent::jnl:postbox or parent::jnl:postcode">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:when test="parent::jnl:street or parent::jnl:state or parent::jnl:country">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:when test="parent::jnl:org-name or parent::jnl:org-div">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:when test="ancestor::jnl:citref and $RefSup = '1'">
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;sc&gt;</xsl:text>
						<xsl:apply-templates/>
						<xsl:text disable-output-escaping="yes">&lt;/sc&gt;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@type='sup'">
				<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type='inf'">
				<xsl:text disable-output-escaping="yes">&lt;sub&gt;</xsl:text>
				<xsl:apply-templates/>
				<xsl:text disable-output-escaping="yes">&lt;/sub&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="jnl:footnote" mode="sentence"/>
	<xsl:template match="jnl:tblref" mode="sentence"/>
	<xsl:template match="jnl:citref" mode="sentence"/>
	<xsl:template match="jnl:figref" mode="sentence"/>
	<xsl:template match="jnl:noteref" mode="sentence"/>
	<xsl:template match="jnl:equ">
		<xsl:variable name="fid">
			<xsl:value-of select="count(preceding::jnl:equ) + 1"/>
		</xsl:variable>
		<xsl:variable name="jabrv"/>
		<xsl:choose>
			<xsl:when test="@type and @type = 'display'">
				<xsl:text disable-output-escaping="yes">&lt;disp-formula id="</xsl:text>
				<xsl:text>e</xsl:text>
				<xsl:choose>
					<xsl:when test="$fid > 9">
						<xsl:text/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$fid"/>
				<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;graphic xlink:href="</xsl:text>
				<xsl:choose>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'BIN'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'bin'">
						<xsl:variable name="doi">
							<xsl:apply-templates select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
						</xsl:variable>
						<xsl:text>bio.</xsl:text>
						<xsl:choose>
							<xsl:when test="starts-with($doi , 'bio.')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'bio.')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'BIO.')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'BIO.')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'bio')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'bio')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'BIO')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'BIO')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'bin.')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'bin.')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'BIN.')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'BIN.')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'bin')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'bin')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'BIN')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'BIN')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of disable-output-escaping="yes" select="$doi"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when
						test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'CES'  or //jnl:jnl-info/jnl:abrv-jnl-tl = 'ces'">
						<xsl:variable name="doi">
							<xsl:apply-templates select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
						</xsl:variable>
						<xsl:text>jcs.</xsl:text>
						<xsl:choose>
							<xsl:when test="starts-with($doi , 'ces.')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'ces.')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'CES.')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'CES.')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'ces')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'ces')"/>
							</xsl:when>
							<xsl:when test="starts-with($doi , 'CES')">
								<xsl:value-of disable-output-escaping="yes"
									select="substring-after($doi, 'CES')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of disable-output-escaping="yes" select="$doi"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="//jnl:unit-info[1]/jnl:c-tracker-id/."/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>-e</xsl:text>
				<xsl:choose>
					<xsl:when test="$fid > 9">
						<xsl:text/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$fid"/>
				<xsl:text disable-output-escaping="yes">.tif"&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;/graphic&gt;</xsl:text>
				<xsl:choose>
					<xsl:when test="@num and @num != ''">
						<xsl:text disable-output-escaping="yes">&lt;label&gt;(</xsl:text>
						<xsl:value-of select="@num"/>
						<xsl:text disable-output-escaping="yes">)&lt;/label&gt;</xsl:text>
					</xsl:when>
				</xsl:choose>
				<xsl:text disable-output-escaping="yes">&lt;/disp-formula&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@type and @type = 'inline'">
				<xsl:text disable-output-escaping="yes">&lt;inline-formula&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;inline-graphic xlink:href="</xsl:text>
				<xsl:value-of select="$filecode"/>
				<xsl:text>-e</xsl:text>
				<xsl:choose>
					<xsl:when test="$fid > 9">
						<xsl:text/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$fid"/>
				<xsl:text disable-output-escaping="yes">.tif"&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;/inline-graphic&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;/inline-formula&gt;</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="write-refs-botha">
		<xsl:param name="rids-attribute-value"/>
		<xsl:param name="rids-content"/>
		<xsl:param name="rids-text"/>
		<xsl:variable name="starta" select="substring-before($rids-text ,', ')"/>
		<xsl:variable name="startb" select="substring-before($rids-text ,',')"/>
		<xsl:variable name="startc" select="substring-before($rids-text ,' ')"/>
		<xsl:variable name="startd" select="substring-before($rids-text ,'-')"/>
		<xsl:variable name="nexta" select="substring-after($rids-text,', ')"/>
		<xsl:variable name="nextb" select="substring-after($rids-text,',')"/>
		<xsl:variable name="nextc" select="substring-after($rids-text,' ')"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
		<xsl:variable name="refer" select="substring-after($first,'ref')"/>
		<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:choose>
				<xsl:when
					test="$rest !='' and $starta = '' and $startb = '' and $startc = '' and $startd = ''">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="$rids-text"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when
					test="$rest !='' and $starta !='' and not(contains($starta , ',')) and not(contains($starta , ' ')) and not(contains($starta , '-'))">
					<xsl:value-of disable-output-escaping="yes" select="$starta"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:choose>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
							<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>,</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nexta)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when
					test="$rest !='' and $startb !='' and not(contains($startb , ' ')) and not(contains($startb , '-'))">
					<xsl:value-of disable-output-escaping="yes" select="$startb"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:choose>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
							<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>,</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nextb)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$rest !='' and $startc !='' and not(contains($startc , '-'))">
					<xsl:value-of disable-output-escaping="yes" select="$startc"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nextc)"/>
					</xsl:call-template>
				</xsl:when>
				<!-- ADD HERE -->
				<xsl:when test="$rest !='' and $startd !=''">
					<xsl:variable name="nextd" select="substring-after($rids-text,'-')"/>
					<xsl:variable name="startdA" select="substring-before($nextd,', ')"/>
					<xsl:variable name="startdB" select="substring-before($nextd,',')"/>
					<xsl:variable name="startdC" select="substring-before($nextd,' ')"/>
					<xsl:variable name="startdD" select="substring-before($nextd,'-')"/>
					<xsl:value-of disable-output-escaping="yes" select="$startd"/>
					<xsl:text>-</xsl:text>
					<xsl:choose>
						<xsl:when
							test="$nextd != '' and $startdA != '' and not(contains($startdA , ',')) and not(contains($startdA , ' ')) and not(contains($startdA , '-'))">
							<xsl:variable name="tstr" select="substring-before($nextd ,', ')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when
							test="$nextd != '' and $startdB != '' and not(contains($startdB , ' ')) and not(contains($startdB , '-'))">
							<xsl:variable name="tstr" select="substring-before($nextd ,',')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when
							test="$nextd != '' and $startdC != '' and not(contains($startdC , '-'))">
							<xsl:variable name="tstr" select="substring-before($nextd ,' ')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$nextd != '' and $startdD != ''">
							<xsl:variable name="tstr" select="substring-before($nextd ,'-')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="write-refs-ndashe">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<!-- end continue -->
				</xsl:when>
				<!-- FINISH ADD HERE -->
				<xsl:otherwise>
					<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-refs-comma">
		<xsl:param name="rids-attribute-value"/>
		<xsl:param name="rids-content"/>
		<xsl:param name="rids-text"/>
		<xsl:variable name="starta" select="substring-before($rids-text ,', ')"/>
		<xsl:variable name="startb" select="substring-before($rids-text ,',')"/>
		<xsl:variable name="startc" select="substring-before($rids-text ,' ')"/>
		<xsl:variable name="nexta" select="substring-after($rids-text,', ')"/>
		<xsl:variable name="nextb" select="substring-after($rids-text,',')"/>
		<xsl:variable name="nextc" select="substring-after($rids-text,' ')"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
		<xsl:variable name="refer" select="substring-after($first,'ref')"/>
		<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:choose>
				<xsl:when test="$rest !='' and $nexta = '' and $nextb = '' and $nextc = ''">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:call-template name="write-refs-comma">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="$rids-text"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when
					test="$rest !='' and $starta !='' and not(contains($starta , ',')) and not(contains($starta , ' '))">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$starta"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:choose>
						<xsl:when
							test="//jnl:jnl-info/jnl:abrv-jnl-tl = 'DMF' or //jnl:jnl-info/jnl:abrv-jnl-tl = 'dmf'">
							<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
							<xsl:text>,</xsl:text>
							<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>,</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="write-refs-comma">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nexta)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$rest !='' and $startb !='' and not(contains($startb , ' '))">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$startb"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					<xsl:call-template name="write-refs-comma">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nextb)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$rest !='' and $startc !=''">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$startc"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					<xsl:call-template name="write-refs-comma">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nextc)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:if test="$CustCode = 'plos'">
						<xsl:text disable-output-escaping="yes"> &amp;lsqb;</xsl:text>
					</xsl:if>
					<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
					<xsl:if test="$CustCode = 'plos'">
						<xsl:text disable-output-escaping="yes">&amp;rsqb;</xsl:text>
					</xsl:if>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-refs-ndash">
		<xsl:param name="rids-attribute-value"/>
		<xsl:param name="rids-content"/>
		<xsl:param name="rids-text"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
			<xsl:variable name="rrids" select="$first"/>
			<xsl:choose>
				<xsl:when test="//jnl:cit[@id = $rrids]">
					<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
				</xsl:when>
				<xsl:when test="//jnl:art-desc[@id = $rrids]">
					<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>1</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
			<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
			<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-refs-ndashe">
		<xsl:param name="rids-attribute-value"/>
		<xsl:param name="rids-content"/>
		<xsl:param name="rids-text"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
		<xsl:variable name="refer" select="substring-after($first,'ref')"/>
		<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:choose>
				<xsl:when test="$rest !=''">
					<xsl:call-template name="write-refs-ndashe">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rest"/>
						<xsl:with-param name="rids-text" select="$rids-text"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="write-refs-ndashm">
		<xsl:param name="rids-attribute-value"/>
		<xsl:param name="rids-content"/>
		<xsl:param name="rids-text"/>
		<xsl:param name="rids-to"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:variable name="rids-from" select="normalize-space($rids-to)"/>
		<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
		<xsl:variable name="refer" select="substring-after($first,'ref')"/>
		<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:choose>
				<xsl:when test="$rest !='' and //jnl:cit[@id = $first and @num = $rids-from]">

					<xsl:choose>
						<xsl:when test="contains($rids-text ,'-') and contains($rids-text , ', ')">
							<xsl:call-template name="write-refs-botha">
								<xsl:with-param name="rids-attribute-value"
									select="$rids-attribute-value"/>
								<xsl:with-param name="rids-content" select="$rids-content"/>
								<xsl:with-param name="rids-text" select="$rids-text"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="contains($rids-text ,'-') and contains($rids-text , ',')">
							<xsl:call-template name="write-refs-botha">
								<xsl:with-param name="rids-attribute-value"
									select="$rids-attribute-value"/>
								<xsl:with-param name="rids-content" select="$rids-content"/>
								<xsl:with-param name="rids-text" select="$rids-text"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="contains($rids-text ,'-') and contains($rids-text , ' ')">
							<xsl:call-template name="write-refs-botha">
								<xsl:with-param name="rids-attribute-value"
									select="$rids-attribute-value"/>
								<xsl:with-param name="rids-content" select="$rids-content"/>
								<xsl:with-param name="rids-text" select="$rids-text"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="contains($rids-text ,'-')">
							<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
							<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
						</xsl:when>
						<xsl:when test="contains($rids-text ,' ')">
							<xsl:call-template name="write-refs-comma">
								<xsl:with-param name="rids-attribute-value"
									select="$rids-attribute-value"/>
								<xsl:with-param name="rids-content" select="$rids-content"/>
								<xsl:with-param name="rids-text" select="$rids-text"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
							<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$rest !=''">
					<xsl:call-template name="write-refs-ndashm">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="$rids-text"/>
						<xsl:with-param name="rids-to" select="$rids-to"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- NEED TO WORK ON -->
	<xsl:template name="write-refs-both">
		<xsl:param name="rids-attribute-value"/>
		<xsl:param name="rids-content"/>
		<xsl:param name="rids-text"/>
		<xsl:variable name="starta" select="substring-before($rids-text ,', ')"/>
		<xsl:variable name="startb" select="substring-before($rids-text ,',')"/>
		<xsl:variable name="startc" select="substring-before($rids-text ,' ')"/>
		<xsl:variable name="startd" select="substring-before($rids-text ,'-')"/>
		<xsl:variable name="nexta" select="substring-after($rids-text,', ')"/>
		<xsl:variable name="nextb" select="substring-after($rids-text,',')"/>
		<xsl:variable name="nextc" select="substring-after($rids-text,' ')"/>
		<xsl:variable name="normal-attr-value"
			select="concat(normalize-space($rids-attribute-value), ' ')"/>
		<xsl:variable name="first" select="substring-before($normal-attr-value,' ')"/>
		<xsl:variable name="refer" select="substring-after($first,'ref')"/>
		<xsl:variable name="rest" select="substring-after($normal-attr-value,' ')"/>
		<xsl:if test="$normal-attr-value != ' '">
			<xsl:choose>
				<xsl:when
					test="$rest !='' and $starta = '' and $startb = '' and $startc = '' and $startd = ''">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="$rids-text"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when
					test="$rest !='' and $starta !='' and not(contains($starta , ',')) and not(contains($starta , ' ')) and not(contains($starta , '-'))">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$starta"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nexta)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when
					test="$rest !='' and $startb !='' and not(contains($startb , ' ')) and not(contains($startb , '-'))">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$startb"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nextb)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$rest !='' and $startc !='' and not(contains($startc , '-'))">
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$startc"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;sup&gt;</xsl:text>
					<xsl:text>,</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;/sup&gt;</xsl:text>
					<xsl:call-template name="write-refs-both">
						<xsl:with-param name="rids-attribute-value" select="$rest"/>
						<xsl:with-param name="rids-content" select="$rids-content"/>
						<xsl:with-param name="rids-text" select="normalize-space($nextc)"/>
					</xsl:call-template>
				</xsl:when>
				<!-- ADD HERE -->
				<xsl:when test="$rest !='' and $startd !=''">
					<xsl:variable name="nextd" select="substring-after($rids-text,'-')"/>
					<xsl:variable name="startdA" select="substring-before($nextd,', ')"/>
					<xsl:variable name="startdB" select="substring-before($nextd,',')"/>
					<xsl:variable name="startdC" select="substring-before($nextd,' ')"/>
					<xsl:variable name="startdD" select="substring-before($nextd,'-')"/>
					<!-- continue RDC 10/09/2009 -->
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$startd"/>
					<xsl:text>-</xsl:text>
					<xsl:choose>
						<xsl:when
							test="$nextd != '' and $startdA != '' and not(contains($startdA , ',')) and not(contains($startdA , ' ')) and not(contains($startdA , '-'))">
							<xsl:variable name="tstr" select="substring-before($nextd ,', ')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when
							test="$nextd != '' and $startdB != '' and not(contains($startdB , ' ')) and not(contains($startdB , '-'))">
							<xsl:variable name="tstr" select="substring-before($nextd ,',')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when
							test="$nextd != '' and $startdC != '' and not(contains($startdC , '-'))">
							<xsl:variable name="tstr" select="substring-before($nextd ,' ')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="$nextd != '' and $startdD != ''">
							<xsl:variable name="tstr" select="substring-before($nextd ,'-')"/>
							<xsl:call-template name="write-refs-ndashm">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
								<xsl:with-param name="rids-to" select="normalize-space($tstr)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="write-refs-ndashe">
								<xsl:with-param name="rids-attribute-value" select="$rest"/>
								<xsl:with-param name="rids-content" select="$rest"/>
								<xsl:with-param name="rids-text" select="normalize-space($nextd)"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<!-- end continue -->
				</xsl:when>
				<!-- FINISH ADD HERE -->
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&lt;xref ref-type="bibr" rid="</xsl:text>
					<xsl:variable name="rrids" select="$first"/>
					<xsl:choose>
						<xsl:when test="//jnl:cit[@id = $rrids]">
							<xsl:apply-templates select="//jnl:cit[@id = $rrids]" mode="refer"/>
						</xsl:when>
						<xsl:when test="//jnl:art-desc[@id = $rrids]">
							<xsl:apply-templates select="//jnl:art-desc[@id = $rrids]" mode="refer"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$rids-text"/>
					<xsl:text disable-output-escaping="yes">&lt;/xref&gt;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	

</xsl:stylesheet>
