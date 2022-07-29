SUPERSET_PORT="${1:-8280}"

# install required packages
sudo yum -y install gcc gcc-c++ libffi-devel python-devel python-pip python-wheel \
  openssl-devel cyrus-sasl-devel openldap-devel python3-devel.x86_64

# optionally, update master node packages
sudo yum -y update

# set up a python virtual environment
python3 -m pip install –user –upgrade setuptools virtualenv
python3 -m venv venv
. venv/bin/activate

python3 -m pip install –upgrade apache-superset \
  PyAthenaJDBC pyhive mysqlclient psycopg2-binary

command -v superset

superset db upgrade

FLASK_APP=superset
export "FLASK_APP=${FLASK_APP}"
echo "export FLASK_APP=superset" >>~/.bashrc

touch superset_config.py
echo "ENABLE_TIME_ROTATE = True" >>superset_config.py
echo "export SUPERSET_CONFIG_PATH=superset_config.py" >>~/.bashrc

ADMIN_USERNAME="SupersetAdmin"
ADMIN_PASSWORD="Admin1234"

# create superset admin
superset fab create-admin \
  –username "${ADMIN_USERNAME}" \
  –firstname Superset \
  –lastname Admin \
  –email superset_admin@example.com \
  –password "${ADMIN_PASSWORD}"

superset init

# create two sample superset users
superset fab create-user \
  –role Alpha \
  –username SupersetUserAlpha \
  –firstname Superset \
  –lastname UserAlpha \
  –email superset_user_alpha@example.com \
  –password UserAlpha1234

superset fab create-user \
  –role Gamma \
  –username SupersetUserGamma \
  –firstname Superset \
  –lastname UserGamma \
  –email superset_user_gamma@example.com \
  –password UserGamma1234
