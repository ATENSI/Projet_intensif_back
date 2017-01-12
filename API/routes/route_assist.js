/* Title: route_assist */
// Dependencies requirements
var express = require('express');
var mysql = require('mysql');

// Routes configurations
var router = express.Router();


 /*
  Function: Create assist

  Creation d'une demande d'assistance.
  * POST
  * URL : {{url}}/assist/create
  * Consumes JSON : { utilisateur_id_2, trajet_longitude_arrivee, trajet_latitude_arrivee,
                     trajet_public, utilisateur_id }

  Parameters:

  * token                 : Token
  * utilisateur_id_2      : Identifiant de l'utilsateur portant assistance
  * assistance_longitude  : Longitude du point d'assistance
  * assistance_latitude   : Latitude du point d'assistance
  * utilisateur_id        : Identifiant de l'utilisateur

  Returns:

  *  403 Forbidden         : Token de connexion invalide
  *  500 Server Error      : Erreur lors de l'enregistrement dans la base
  *  200 OK                : Create s'est bien passé

*/
router.post('/create', function(req, res) {
    console.log(req.body);
    loginUtils.checkConnection(req.body.token).then(function(logged){
      if(logged){
          var data = {
            utilisateur_id_2:           req.body.utilisateur_id_2,
            assistance_longitude:       req.body.assistance_longitude,
            assistance_latitude:        req.body.assistance_latitude,
            utilisateur_utilisateur_id: req.body.utilisateur_id
          };

          // On récupère une connexion du pool et on exécute un INSERT
          pool.query('INSERT INTO assistance SET ?', data, function(error, result) {
            if (error) {
              return res.sendStatus(500);
            }

            return res.sendStatus(200);
          });
    }
    else {
          return res.sendStatus(403);
    }
  });
});

// Export for public usage
module.exports = router;
