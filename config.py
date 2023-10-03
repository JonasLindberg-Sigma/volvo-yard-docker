from omegaconf import OmegaConf

_CFG = {
    "source_type": "stream",  # stream/camera
    "url": ""
}

def get_config():
    return OmegaConf.create(_CFG)