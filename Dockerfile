FROM adoptopenjdk/openjdk8-openj9:alpine-slim
EXPOSE 8080
EXPOSE 7777
ENV JVM_METASPACE_SIZE 128M
ENV JVM_MEM_MAX_SIZE 1024M
ENV JVM_MEM_YOUNG_SIZE 384M
ENV JVM_MEM_THREAD_SIZE 128K
ENTRYPOINT ["java","-server","-noverify","-XX:TieredStopAtLevel=1","-XX:+HeapDumpOnOutOfMemoryError","-Djava.awt.headless=true","-Xmn${JVM_MEM_YOUNG_SIZE}","-Xms${JVM_MEM_MAX_SIZE}","-Xmx${JVM_MEM_MAX_SIZE}","-Xss${JVM_MEM_THREAD_SIZE}","-XX:MetaspaceSize=${JVM_METASPACE_SIZE}","-XX:MaxMetaspaceSize=${JVM_METASPACE_SIZE}","-Xshareclasses","-Xquickstart","-jar","/arthas-tunnel-server-3.2.0.jar"]
RUN wget https://github.com/alibaba/arthas/releases/download/arthas-all-3.2.0/arthas-tunnel-server-3.2.0.jar
