package com.finalteam3.exodia.security;

import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.session.SessionDestroyedEvent;

import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
@Slf4j
public class SecurityConfig {
	@Bean
    public ApplicationListener<SessionDestroyedEvent> sessionDestroyedListener() {
        return event -> {
            String sessionId = event.getId();
        };
    }

}
