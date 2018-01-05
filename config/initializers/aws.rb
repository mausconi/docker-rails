# Allow self signed certificate (needed for Minio server)
Aws.config[:ssl_verify_peer] = ENV.fetch('AWS_SSL_VERIFY_PEER', true) != 'false'
