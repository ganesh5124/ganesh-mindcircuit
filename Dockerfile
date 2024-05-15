FROM maven AS buildstage
RUN mkdir -p  /opt/apps/ganesh-mindcircuit
WORKDIR /opt/apps/ganesh-mindcircuit
COPY . /opt/apps/ganesh-mindcircuit
RUN mvn clean install #this will generate .war in target directory

#new stage
FROM tomcat
WORKDIR webapps
# Copying only .war artifact from target dir -old state to this stage
COPY --from=buildstage /opt/apps/ganesh-mindcircuit/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
