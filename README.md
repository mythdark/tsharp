# Introduction

**T#**<sup>T Sharp</sup>은 It's torr! 과 torrssen2, Transmission이 통합 설치되어 기본 연동이 설정되어 있는 도커 이미지입니다.

# Related Apps

- [It's torr!](https://github.com/grollcake-torr/torr)
- [torrssen2](https://github.com/tarpha/torrssen2)
- [Transmission](https://transmissionbt.com/)

# Usage

```
docker run -d \
  --name=tsharp \
  -e PUID=0 \
  -e PGID=100 \
  -p 7770:80 \
  -p 7780:8080 \
  -p 7791:9091 \
  -p 7713:51413 \
  -p 7713:51413/udp \
  -v /path/to/config/data:/root/data \
  -v /path/to/download:/download
  --restart unless-stopped \
  banyazavi/tsharp
```

# Parameters

| Parameter | Function |
|-----------|----------|
| -e PUID | 리눅스 유저 ID (연결된 볼륨의 소유자) |
| -e PGID | 리눅스 그룹 ID (연결된 볼륨의 소유그룹) |
| -p 80 | It's torr! RSS 접속 포트 (Optional) |
| -p 8080 | torrssen2 웹 접속 포트 |
| -p 9091 | Transmission RPC 접속 포트 (Optional) |
| -p 51413 | Transmission 리스닝 포트 |
| -p 51413/udp | Transmission 리스닝 포트 (UDP) |
| -v /root/data | torrssen2 DB 및 Transmission 설정 볼륨 |
| -v /download | torrssen2 기본 다운로드 디렉토리 |

기본 다운로드 폴더 외 사용자가 원하는 디렉토리를 추가로 바인딩하여 사용할 수 있습니다.  
단, 이 경우 추가로 바인딩한 디렉토리를 **torrssen2 > 다운로드 경로 관리** 메뉴에 등록하여야 합니다.

# 사용자 아이디 및 비밀번호 설정

- torrssen2: **환경 설정 > 로그인**에서 설정할 수 있습니다.
- Transmission: **/root/data/settings.json** 파일의 아래 옵션을 수정합니다.  
  **username**과 **password** 설정 후 **torrssen2 > 환경 설정 > 트랜스미션**에 동일하게 수정해야 합니다.

```
    "rpc-password": "your_password",
    "rpc-username": "your_username",
```

# Notice

- 본 이미지는 amd64 이외 아키텍처에서의 동작을 보증하지 않습니다.
- 공개 사이트의 상황에 따라 RSS 제공이 지연, 거부 또는 제공 자체가 불가능할 수 있습니다.
