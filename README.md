# 💬 [kohya_ss](https://github.com/bmaltais/kohya_ss) on AMD ROCm Docker Compose 📷
- [bmaltais](https://github.com/bmaltais)/[Kohya v24.1.2](https://github.com/bmaltais/kohya_ss)
A Gradio GUI for Kohya's Stable Diffusion trainers.

for a better experience, fork it and change the configurations according to your board, server port and settings.

- Make sure that your system was fresh (ubuntu 22.04)
- Prepare AMD ROCm Driver install
- reboot your system
```
sudo usermod -a -G render,video $LOGNAME
wget https://raw.githubusercontent.com/hqnicolas/bmaltaisKohya_ssROCm/main/drivers-amd.sh
sudo chmod 777 drivers-amd.sh
sudo ./drivers-amd.sh
sudo reboot now
```
- install Docker
```
wget https://raw.githubusercontent.com/hqnicolas/bmaltaisKohya_ssROCm/main/docker.sh
sudo chmod 777 docker.sh
sudo ./docker.sh
```
- install Docker Compose
```
sudo apt-get update
sudo apt-get install docker-compose-plugin -y
sudo apt-get install docker-compose -y
```
- Install **bmaltais/kohya_ss** ROCm by the following command:
```
git clone https://github.com/hqnicolas/bmaltaisKohya_ssROCm.git
cd bmaltaisKohya_ssROCm
```
- to AMD RX5000 RX6000 [edit this line](https://github.com/hqnicolas/bmaltaisKohya_ssROCm/blob/f77f6b4a9db910a387c0ca14b3c8c89cd58c1517/Dockerfile.rocm#L51) before install (`RUN CUDA_VERSION=gfx1030 /usr/bin/python3 setup.py install`)
- to AMD RX5000 RX6000 also[ edit this line](https://github.com/hqnicolas/bmaltaisKohya_ssROCm/blob/f77f6b4a9db910a387c0ca14b3c8c89cd58c1517/kohya_ss.env#L1) before install (`export HSA_OVERRIDE_GFX_VERSION=10.3.0`)
- to RX7000 leave it as it is and Build it!
```
sudo docker-compose build kohya_ss-rocm
```
Sent it Up!
```
sudo docker compose up -d kohya_ss-rocm
```
- Open an new terminal and:
- Stop Stable Diffusion ROCm.
- All ready, now you can run it whenever you want.
```
sudo docker start -a kohya_ss-rocm-runner
```
- Open an new terminal and:
- Stop Stable Diffusion ROCm.
```
sudo docker stop kohya_ss-rocm-runner
```
![adam_opt](https://github.com/hqnicolas/bmaltaisKohya_ssROCm/assets/41456803/27ed8fcf-a7d6-4b27-b680-eb8b1a47f2f9)

- Usecase 1
- Insert location to config files into LORA Interface http://0.0.0.0:7860
```
/config/config_rocm_sdxl_512.json
```
- Usecase 2
- Insert location to config files into LORA Interface http://0.0.0.0:7860
- to use the result file on [Stable Diffusion 1111 v1.9.3](https://github.com/hqnicolas/StableDiffusionROCm).
```
/config/config_rocm_sdxl_512_face.json
```
- Usecase 3
- Insert location to config files into LORA Interface http://0.0.0.0:7860
- to Follow [this tutorial](https://github.com/FurkanGozukara/Stable-Diffusion/blob/main/Tutorials/Generate-Studio-Quality-Realistic-Photos-By-Kohya-LoRA-Stable-Diffusion-Training-Full-Tutorial.md) and [this video](https://www.youtube.com/watch?v=TpuDOsuKIBo):
```
# use the "config_rocm_sd15_512_face.json"
# and drop "realisticVisionV60B1_v20Novae.safetensors" 
# into "/bmaltaisKohya_ssROCm/dataset/" folder
wget https://huggingface.co/ckpt/realistic-vision-v20/resolve/main/realisticVisionV20_v20.safetensors?download=true
cp realisticVisionV60B1_v20Novae.safetensors /bmaltaisKohya_ssROCm/dataset/
```
- To see a prompt from your GPU usage.
```
watch /opt/rocm-6.0.2/bin/rocm-smi
```
![rocm_smi](https://github.com/hqnicolas/bmaltaisKohya_ssROCm/assets/41456803/4c0a9ec5-90c4-4436-9a28-409716e52a19)

