import os

from connexion import FlaskApp
from connexion.resolver import RelativeResolver


def get_root():
    return None, 200


if __name__ == '__main__':
    app = FlaskApp('dummy', specification_dir='openapi/')
    app.add_api('api.yml', resolver=RelativeResolver('dummy'))
    port = int(os.getenv('APP_PORT', default='9000'))
    app.run(port=port)
