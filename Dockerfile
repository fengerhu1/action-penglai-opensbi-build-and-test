FROM ddnirvana/penglai-enclave:v0.4
MAINTAINER Xueqiang Jiang "jiangxq@sjtu.edu.cn"
COPY entrypoint.sh /entrypoint.sh
COPY run_qemu.sh /run_qemu.sh
COPY run_test.exp /run_test.exp
RUN apt-get update
RUN apt-get install -y expect
ENTRYPOINT ["/entrypoint.sh"]
