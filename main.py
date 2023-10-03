import urllib.request

from config import get_config

## Connect to Camera or to stream
def connect_to_source(cfg):
    if cfg.source_type == "stream":
        pass
    elif cfg.source_type == "camera":
        pass
    else:
        raise "Invalid source type, should be either stream or camera"

## Connect to SQL Database
def check_connect_to_database(cfg):
    try:
        urllib.request.urlopen(cfg.url)
    except Exception as e:
        print(e)

def main():
    cfg = get_config()
    connect_to_source(cfg)
    check_connect_to_database(cfg)


if __name__ == "__main__":
    main()