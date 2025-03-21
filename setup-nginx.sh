#!/bin/sh
# setup-nginx.sh 
BUILD_VERSION=${BUILD_VERSION:-"default-version"}

echo "Configurando Nginx com versão: ${BUILD_VERSION}"

sed -i "s/\${BUILD_VERSION}/${BUILD_VERSION}/g" /etc/nginx/conf.d/default.conf

cat > /usr/share/nginx/html/version.json << EOF
{
  "version": "${BUILD_VERSION}",
  "buildDate": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
}
EOF

echo "Configuração do Nginx concluída com versão: ${BUILD_VERSION}"

exit 0
