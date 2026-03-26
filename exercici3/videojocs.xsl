<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Cataleg videojocs</title>
        <style>
          body { font-family: 'Segoe UI', sans-serif; background: #1a1a2e; color: #fff; padding: 20px; }
          h1 { text-align: center; color: #e94560; }
          .contenidor { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; }
          .targeta { background: #16213e; border-radius: 15px; padding: 20px; width: 250px; border: 1px solid #0f3460; box-shadow: 0 4px 15px rgba(0,0,0,0.3); }
          .titol { font-size: 1.2em; font-weight: bold; margin-bottom: 10px; color: #4ecca3; }
          .punts { font-size: 1.5em; font-weight: bold; margin: 10px 0; }
          .info { font-size: 0.9em; color: #95a5a6; line-height: 1.6; }
          
          .excellent { color: #f1c40f; text-shadow: 0 0 5px #f1c40f; }
          .be { color: #2ecc71; }
          .regular { color: #e67e22; }
          .dolent { color: #e74c3c; }
        </style>
      </head>
      <body>
        <h1>Mi cataleg de videojocs</h1>
        <div class="contenidor">
          
          <xsl:for-each select="videojocs/joc">
            <xsl:sort select="puntuacio" data-type="number" order="descending" /> <div class="targeta">
              <div class="titol"><xsl:value-of select="titol"/></div>
              
              <div class="punts">
                <xsl:attribute name="class"> <xsl:choose> <xsl:when test="puntuacio &gt;= 9">punts excellent</xsl:when>
                    <xsl:when test="puntuacio &gt;= 7">punts be</xsl:when>
                    <xsl:when test="puntuacio &gt;= 5">punts regular</xsl:when>
                    <xsl:otherwise>punts dolent</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                ⭐ <xsl:value-of select="puntuacio"/>
              </div>

              <div class="info">
                <strong>Plataforma: </strong>
                <xsl:choose> <xsl:when test="plataforma = 'Nintendo Switch'">🟥 </xsl:when>
                  <xsl:when test="plataforma = 'PlayStation 5'">🟦 </xsl:when>
                  <xsl:when test="plataforma = 'Xbox Series X'">🟩 </xsl:when>
                  <xsl:when test="plataforma = 'PC'">💻 </xsl:when>
                  <xsl:when test="plataforma = 'Mobil'">📱 </xsl:when>
                  <xsl:otherwise>🎮 </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="plataforma"/>
              </div>

              <div class="info">
                <p>Gènere: <xsl:value-of select="genere"/></p>
                <p>Any: <xsl:value-of select="any"/></p>
                <p>Preu: <xsl:value-of select="preu"/> €</p> </div>
            </div>
            
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>