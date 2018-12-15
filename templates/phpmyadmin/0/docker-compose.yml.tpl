version: '2'

services:
  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    container_name: phpmyadmin
    restart: always
    ports:
      - '${WEB_PORT}:80'
    environment:
      - PMA_HOSTS=mysql
      {{- if ne .Values.PMA_PORTS ""}}
      - PMA_PORT=${PMA_PORTS}
      {{- end}}
      {{- if eq .Values.PMA_ARBITRARY "true"}}
      - PMA_ARBITRARY=1
      {{- end}}
      {{- if ne .Values.PMA_VERBOSES ""}}
      - PMA_VERBOSES=${PMA_VERBOSES}
      {{- end}}
    volumes:
      - /sessions
    external_links:
      - ${mysql_link}:mysql