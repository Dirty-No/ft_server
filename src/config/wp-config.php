<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'root' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', '' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '82Y!A,UR6%3M_3u=m@k%mXY$kmzLM=i;*<tMwGtj7*ciUpUd|,_YH:]IMi2=Nps ' );
define( 'SECURE_AUTH_KEY',  ']uK(BkF8Hpx9=/Wp2Ts-^q&w#^?+$rlFuou]M xdg^F < Os/N 5fx;q<T8qEQQX' );
define( 'LOGGED_IN_KEY',    'S@l6tLV%do,0X?rsU64lMt0q00)s|hX(K=~<k3]]9gV7k,/*;hX]|vCC]p?c-+_7' );
define( 'NONCE_KEY',        ':}ovpP1$?(k@}@h&1-YW?H_vd=veAhbNOUlvRLX!Z#{1Hv46V12@u`9ARu8OJGl#' );
define( 'AUTH_SALT',        'RDipyG5G,0~(eGQfi;PQ${/~FMl35X<[G_z-K|fB>Qy%(pf]!^rGbiHhSI)0/-`@' );
define( 'SECURE_AUTH_SALT', 'da2[D>Kli66_HPGI5^ OyE[zgR3L]@4 Lpz{Jc@F EbHIzk|Q;Sg;h*U8l<X~%GY' );
define( 'LOGGED_IN_SALT',   '&}8WT@6qu|Pn/Ez.ylR.:tB}0aLO%n>aCf5SR+5Vx_6 *s%S06)4qF&<9{F8Dr1=' );
define( 'NONCE_SALT',       'vvo}r&:Gk_<b=UAaRdPnpw}7>+DEM5t.gX8w6[s(61$[5.QQi4%PabS-RX4l3)b@' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
