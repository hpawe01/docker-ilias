; <?php exit; ?>
[server]
http_path = "http://localhost:8001"
absolute_path = "/var/www/html/ilias"
presetting = ""
timezone = "Europe/Berlin"

[clients]
path = "data"
inifile = "client.ini.php"
datadir = "/var/www/html/files"
default = "ilias"
list = "0"

[setup]
pass = "$2y$10$9BJWwqzDAj2X0HVyM1CJkuFxmlTjG66q2pXUU6vD3cD66E9yOnMlm"

[tools]
convert = "/var/www/html/files/"
zip = "/usr/bin/zip"
unzip = "/usr/bin/unzip"
java = ""
ffmpeg = ""
ghostscript = ""
latex = ""
vscantype = "none"
scancommand = ""
cleancommand = ""
enable_system_styles_management = ""
lessc = ""
phantomjs = ""

[log]
path = "/var/www/html/files"
file = "ilias.log"
enabled = "1"
level = "WARNING"
error_path = ""

[debian]
data_dir = "/var/opt/ilias"
log = "/var/log/ilias/ilias.log"
convert = "/usr/bin/convert"
zip = "/usr/bin/zip"
unzip = "/usr/bin/unzip"
java = ""
ffmpeg = "/usr/bin/ffmpeg"

[redhat]
data_dir = ""
log = ""
convert = ""
zip = ""
unzip = ""
java = ""

[suse]
data_dir = ""
log = ""
convert = ""
zip = ""
unzip = ""
java = ""

[https]
auto_https_detect_enabled = "0"
auto_https_detect_header_name = ""
auto_https_detect_header_value = ""