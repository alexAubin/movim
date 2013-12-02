<?php /* -*- mode: html -*- */
?><!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title><?php $this->title();?></title>
    
    <link rel="shortcut icon" href="<?php $this->link_file('img/favicon.ico');?>" />
	<link rel="stylesheet" href="<?php echo BASE_URI; ?>app/assets/js/leaflet.css" />
	<script src="<?php echo BASE_URI; ?>app/assets/js/leaflet.js"></script>
	<script src="<?php echo BASE_URI; ?>app/assets/js/sjcl.js"></script>
    
    <meta name="viewport" content="width=device-width, user-scalable=no";>
    <?php
        $this->addCss('css/animations.css');
        $this->addCss('css/forms.css');
        $this->addCss('css/submitform.css');

        $this->addCss('css/posts.css');
        $this->addCss('css/style.css');

        $this->scripts();

        $this->addCss('css/mobile.css'); 
    
        $user = new User();

        $color = $user->getConfig('color');    
        $pattern = $user->getConfig('pattern');
        
        if(!isset($pattern))
            $pattern = 'empty';
        
        if(isset($color)) {
            echo '
            <style type="text/css">
                body, nav {
                    background-color: #'.$color.';
                    animation: none;
                    -webkit-animation: none;
                }
            </style>';
        }

        $size = $user->getConfig('size');    
        if(isset($size)) {
            echo '
            <style type="text/css">
                body { font-size: '.$size.'px; }
            </style>';
        }
    ?>
    <?php $this->widget('System');?>

  </head>
    <body class="<?php echo $pattern; ?>">
        <noscript>
            <style type="text/css">
                nav {display:none;} #content {display: none;}
            </style>
            <div class="warning" style="width: 500px; margin: 0 auto;">
            <?php echo t("You don't have javascript enabled.  Good luck with that."); ?>
            </div>
        </noscript>
        <nav>
            <div class="wrapper">
                <?php $this->menu();?>
            </div>
        </nav>
        
        <!--<div id="baseline"></div>-->

        <div id="content">
            <?php $this->widget('Notification');?>
            <?php $this->content();?>
          
            <footer>
                © <a href="http://www.movim.eu">Movim</a> • 2008 - 2013 • Under <a href="http://www.gnu.org/licenses/agpl-3.0.html">GNU Affero General Public License</a>
            </footer>
        </div>
        <script type="text/javascript">
            movim_onload();
        </script>
        <?php 
            $this->displayFooterDebug();
        ?>
    </body>
</html>