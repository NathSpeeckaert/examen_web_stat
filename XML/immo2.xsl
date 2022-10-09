<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
	
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>Maisons et appartements en location</title>
		<style>
				body {
					font-family: century gothic;
					width: 800px;
					margin: auto;
                    background-color: #fffaf0;
				}
               
				table {
					margin: auto;
					padding: 10px;
					margin-top: 100px;
					border-width: 1px;
					border-style: solid;
					border-collapse: collapse;
                    border-color: #5f9ea0;
					text-align: center;
				}
                td, th{
                    width:20%;
                }
				td, tr, th {
					border-width: 2px;
					border-style: solid;
                    padding: 5px;
					border-color: #5f9ea0;	
				}
                th {
                    vertical-align:middle;
                }
				caption {
						font-size: 200%;
						font-weight: bold;
						color: #263f40;
						margin-bottom : 20px;
                        padding:10px;
                        
						}
                .red {
                    color: red;
                }

			</style>
	</head>
	
	<body>
	
	<table>
	  <caption>Appartements en location</caption>
		<tr>
			<th>Localisation</th>
			<th>Chambre(s)</th>
			<th>Garage</th>
			<th>Prix</th>
			<th>Commentaire</th>
			
	</tr>
	<xsl:for-each select="immo/bien/appartement/detail">
		<xsl:sort select="prix" data-type="number" order="descending" />
        <xsl:if test="localisation/@commune='Ixelles' or localisation/@commune='Schaerbeek' or localisation/@commune='Anderlecht'">
            <xsl:if test="type/@cession='location'">
                <xsl:choose>
                    <xsl:when test="extra/@garage='oui'">
                         <tr style="background-color :#cfe2e2;">
                            <td><xsl:value-of select="localisation/@commune"/></td>
                            <td><xsl:value-of select="@chambre"/></td>
                            <td><xsl:value-of select="extra/@garage"/></td>
                            <td><xsl:value-of select="prix"/> €</td>
                            <xsl:choose>
                                <xsl:when test="prix &lt; 1000">
                                <td><span class="red">Super affaire!</span></td>
                                </xsl:when>
                                <xsl:otherwise>
                                <td><span>Coup de coeur assuré!</span></td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>    
                    </xsl:when>
                    <xsl:otherwise>
                         <tr>    
                            <td><xsl:value-of select="localisation/@commune"/></td>
                                <td><xsl:value-of select="@chambre"/></td>
                                <td><xsl:value-of select="extra/@garage"/></td>
                                <td><xsl:value-of select="prix"/> €</td>
                                <xsl:choose>
                                    <xsl:when test="prix &lt; 1000">
                                    <td><span class="red">Super affaire!</span></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                    <td><span>Coup de coeur assuré!</span></td>
                                    </xsl:otherwise>
                                </xsl:choose>
				        </tr>
                    </xsl:otherwise>
                </xsl:choose>
				
                            
			
		                  
		    </xsl:if>
		</xsl:if>
	</xsl:for-each>
	</table>
	
	<table>
	  <caption>Maisons en location</caption>
		<tr>
			<th>Prix</th>
			<th>Chambre(s)</th>
			<th>Salle(s) de bain</th>
			<th>Etages</th>
	</tr>
	<xsl:for-each select="immo/bien/maison">
	  <xsl:sort select="@facade" data-type="number" order="ascending" />
		<xsl:if test="detail/localisation/@commune='Ixelles' or detail/localisation/@commune='Schaerbeek' or detail/localisation/@commune='Anderlecht'">
            <xsl:if test="detail/type/@cession='location'">
			    <xsl:if test="detail/@sdb &gt;=2">
                    <tr>
                        <td><xsl:value-of select="detail/prix"/> €</td>
                        <td><xsl:value-of select="detail/@chambre"/></td>
                        <td><xsl:value-of select="detail/@sdb"/></td>
                        <td><xsl:value-of select="@etage"/></td>		
                    </tr>
                </xsl:if>    
			</xsl:if>
		</xsl:if>
 	</xsl:for-each>
	</table>
	</body>
</html>	
</xsl:template>
</xsl:stylesheet>	