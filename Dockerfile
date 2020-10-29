FROM jboss/keycloak:10.0.2
COPY build/modules/keycloak-sms-provider/main/keycloak-phone-provider.jar .
COPY build/modules/keycloak-sms-provider-dummy/main/keycloak-sms-provider-dummy.jar .
COPY build/modules/keycloak-sms-provider-cloopen/main/keycloak-sms-provider-cloopen.jar .
COPY build/java-sms-sdk-1.0.3.jar .

COPY cli/ cli/

RUN $JBOSS_HOME/bin/jboss-cli.sh --file=cli/module-add.cli
#RUN $JBOSS_HOME/bin/jboss-cli.sh --file=cli/keycloak-phone-authenticator-yuntongxun-sms-config.cli

COPY build/standalone/deployments/keycloak-phone-provider.resources.jar $JBOSS_HOME/standalone/deployments/

