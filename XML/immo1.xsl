<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>Vente de maisons</title>
		<style>
			body {
					font-family: century gothic;
					width: 900px;
					margin: auto;
                    background-color: #fffaf0;
				}
			 h1 {
				 font-size:150%;
				 text-align:center;
			 }
			.first { 
				
				font-size :120%;
				font-weight: bold;
				list-style-type: none;
				color: #263f40;
				
									
			 }

			 ul {
				 padding-bottom: 3px;
			 }

			 .second {
				 margin-top:5px;
				 font-size: 80%;
				 color: black;
				 font-weight:normal;
			 }

			 						
            .red  {color : red;
                    font-weight : bold ;

            }       
			div {
				border-bottom: 1px solid #5f9ea0;
			}
           
		
		</style>
	</head>
	
	<body>
	
	<h1>Maison 3 chambres avec jardin entre 200000 € et 300000 €</h1>
	<xsl:for-each select="immo/bien/maison/detail" > 
	  <xsl:sort select="localisation/@commune" data-type="text"/>
	  <xsl:sort select="@surface" data-type="number"/>
		<xsl:if test="type/@cession='vente'">
			<xsl:if test="prix &gt;= 200000 and prix &lt;= 300000">
                <xsl:if test="extra/@jardin='oui'">
					<xsl:if test="@chambre &gt;=3">
						<div>
							<ul>
								<li class="first"><xsl:value-of select="localisation/@commune" /><br/>
									<ul class="second">
										<li>Prix : <xsl:value-of select="prix" /> €</li>
										<li>Surface habitable : <xsl:value-of select="@surface" /> m²</li>
										<li>Chambre(s) : <xsl:value-of select="@chambre" /></li>
										<li>Salle(s) de bain : <xsl:value-of select="@sdb" /></li>
										<xsl:choose>
											<xsl:when test="@cc='non'">
											<li>Type de chauffage central : <span class="red">ATTENTION: pas de chauffage central !</span></li>
											</xsl:when>
											<xsl:otherwise>
												<li>Type de chauffage central : <xsl:value-of select="@cc"/></li>
											</xsl:otherwise>
										</xsl:choose>
										<li>Type de vitrage : <xsl:value-of select="@vitrage"/></li>        
									</ul>
								</li>
							</ul>
						</div>
					</xsl:if>	
                </xsl:if>    	
			</xsl:if> 
	    </xsl:if>	
	</xsl:for-each>
	
	</body>
 </html>	
</xsl:template>
</xsl:stylesheet>	