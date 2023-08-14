package com.examen.forge;

import org.apache.catalina.connector.Connector;
import org.apache.coyote.ajp.AbstractAjpProtocol;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class ForgeApplication {

  public static void main(String[] args) {
    SpringApplication.run(ForgeApplication.class, args);
  }

  // Configuracion para AWS
  @Bean
  TomcatServletWebServerFactory servletContainer() {
    TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
    Connector ajpConnector = new Connector("AJP/1.3");
    ajpConnector.setPort(9090);
    ajpConnector.setSecure(false);
    ajpConnector.setAllowTrace(false);
    ajpConnector.setScheme("http");

    ((AbstractAjpProtocol) ajpConnector.getProtocolHandler()).setSecretRequired(false);

    tomcat.addAdditionalTomcatConnectors(ajpConnector);
    return tomcat;
  }

  @Bean
  WebMvcConfigurer corsConfigurer() {
    return new WebMvcConfigurer() {
      @Override
      public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
            .allowedOrigins("*") // Permitir todos los orígenes
            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") // Métodos permitidos
            .allowedHeaders("*") // Todos los encabezados permitidos
            .allowCredentials(true); // Permitir el envío de cookies
      }
    };
  }
}
