<?php
shell_exec("/home/pi/BirdNET-Pi/scripts/restart_services.sh");
header('Location: http://birdnetpi.local:8080');
?>
