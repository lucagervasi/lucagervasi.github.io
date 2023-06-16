FROM wfprshrdkrreg01cr.azurecr.io/cdt/xalokbuilder:prd as builder
ENV env=prod
ENV ADMIN_HOST=cdt-xalok-admin-gazzetta.rcslan.it
ENV PUBLIC_HOST=cdt.gazzetta.it
ENV static=''
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV CI=cdt
RUN service mysql restart && service redis-server start && sleep 2 && service mysql restart && \
  mysql -u root -e "create schema xaloktest" && \
  mysql -u root -e "create user xaloktest@'%' identified by 'xaloktest'" && \
  mysql -u root -e "grant all privileges on xaloktest.* TO xaloktest@'%'" && \
  cat <<'EOF'> app/config/parameters/local.yml
  parameters:
      database_driver: pdo_mysql
      database_host: '127.0.0.1'
      database_port: 3306
      database_name: 'xaloktest'
      database_user: 'xaloktest'
      database_password: 'xaloktest'
      redis_host: '127.0.0.1'
      redis_port: 6379
      fos_elastica.host: 'AAAelasticsearchhostAAA'
      fos_elastica.port: 443
      fos_elastica.transport: https
      fos_elastica.username: 'AAAelasticsearchuserAAA'
      fos_elastica.password: 'AAAelasticsearchpassAAA'
      cms_main_domain: 'AAAcms_main_domainAAA'
      cms_main_images_domain: 'https://AAAcms_main_images_domainAAA'
      wf_cms.admin.publicUrl: 'https://AAAwf_cms_admin_publicUrlAAA'
      wf_tracking.nodejs.host: 0.0.0.0
      wf_tracking.nodejs.url: 'AAAcms_main_domainAAA'
      wf_tracking.redis.host: '127.0.0.1'
      wf_tracking.redis.dsn: '127.0.0.1'
      wf_tracking.redis.port: 6379
      wf_tracking.nodejs.port: 8091
      tracking.redis.dsn: 'redis://127.0.0.1:6379'
      bcc_resque.resque.redis.host: '127.0.0.1'
      bcc_resque.resque.redis.port: 6379
      ftp.localhost: localhost
      ftp.port: 21
      ftp.username: username
      ftp.password: pass
      s3_bucket: 'AAAs3bucketAAA'
      s3_bucket_thumbs: 'AAAs3bucketthumbsAAA'
      ftp.directory: /tmp/
      google_cloud_storage_scope: ""
      google_cloud_storage_private_key_location: ""
      google_cloud_bucket_name: 'AAAbucket_nameAAA'
      wfcms_admin.js_autocollect_translations: True
      customize_add_prefix_bundles:
      assets_base_url: 'https://AAAassets_base_urlAAA'
      kernel.logs_dir: /var/log/xalok
      aws_region: eu-west-1
      aws_credentials_key: 'AAAaws_accesskeyAAA'
      aws_credentials_secret: 'AAAaws_secretkeyAAA'
      app.opta_base_url: 'AAAoptabaseAAA'
      wf_cms_base_admin.video.youtube_v3.publicKey: __YOUTUBE_PUBLIC_KEY__
      wf_cms_base_admin.video.youtube.publicKey: __YOUTUBE_PUBLIC_KEY__

      scribble.api.domain:

      version: 0.0.0
      varnish_servers: ['redis://varnish_ips']
      xalok_sqs_to_wrc: 'AAAsqs_towrcAAA'
      xalok_sqs_to_vms: 'AAAsqs_tovmsAAA'

      rcs_admin.ldap.enabled: True
      rcs_admin.ldap_param.port: 389
      rcs_admin.ldap_param.dn: "DC=__DOMAIN__,DC=rcs,DC=group"
      rcs_admin.ldap_param.query: "(&(memberOf=CN=xalokusers,OU=Groups,OU=Xalok,DC=__DOMAIN__,DC=rcs,DC=group)(sAMAccountName=__USERNAME__))"
      rcs_admin.ldap_param.domains:
          edt: edt.rcs.group
          corp: corp.rcs.group
      lock_binding_port: 9002

      storylink_ftp.host: 'AAAstorylink_hostAAA'
      storylink_ftp.username: 'AAAstorylink_userAAA'
      storylink_ftp.password: 'AAAstorylink_passAAA'

      smarcatura_ftp.host: 'AAAsmarcatura_hostAAA'
      smarcatura_ftp.username: 'AAAsmarcatura_userAAA'
      smarcatura_ftp.password: 'AAAsmarcatura_passAAA'

      wf_cms.category.latest_max_results: 99999

      wf_cms.resque.root_dir: /var/www/sites/enabled/gazzetta/app/admin

      gpx_ftp.host: 'AAAgpx_hostAAA'
      gpx_ftp.username: 'AAAgpx_userAAA'
      gpx_ftp.password: 'AAAgps_passAAA'
  EOF && \
  cp app/admin/config/config_prod.yml{.dist,} && \
  cp app/public/config/config_prod.yml{.dist,} && \
  cp app/config/misc/varnish.yml{.dist,} && \
  cat <<EOF>.make-config
  ADMIN_HOST=cdt-xalok-admin-gazzetta.rcslan.it
  PUBLIC_HOST=cdt.gazzetta.it
  ADMIN_SF_ENV=prod
  PUBLIC_SF_ENV=prod
  NODE_ENV=production

  deploy4:
  EOF && \
  printf "\ttouch app/admin/version\n\ttouch app/public/version\n\tcomposer dumpautoload\n\tNODE_ENV=production\n\tmake clean\n" >> .make-config && \
  \
  composer install --no-scripts --prefer-dist --optimize-autoloader && \
  make migrate-db && \
  app/admin/console --env=prod assets:install web/  --symlink --relative && \
  npm ci && \
  make link_assets && \
  make install_npms_lock && \
  make install_npms_tracking && \
  ./node_modules/gulp/bin/gulp.js wf-assets && \
  ./node_modules/gulp/bin/gulp.js webpack && \
  ./node_modules/gulp/bin/gulp.js webpack-server && \
  ./node_modules/gulp/bin/gulp.js public:webpack && \
  rm -rf .git docker vcl .bowerrc .editorconfig .gitignore .gitlab-ci.yml sonar-project.properties app/public/logs app/admin/logs app/public/cache app/admin/cache

FROM wfprshrdkrreg01cr.azurecr.io/cdt/php-fpm-74-xalok:ua2
COPY --from=builder /app /var/www/sites/enabled/gazzetta
CWD /var/www/sites/enabled/gazzetta
