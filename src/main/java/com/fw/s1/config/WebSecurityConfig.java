package com.fw.s1.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {
		// Security 무시 경로 설정
		web.ignoring()
			.antMatchers("/resources/**")
			.antMatchers("/images/**")
			.antMatchers("/css/**")
			.antMatchers("/js/**")
			.antMatchers("vendor/**")
			.antMatchers("/favicon/**")
			;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// URL에 따른 로그인, 권한 설정
		http
			.cors().and()
			.csrf().disable()
			.authorizeRequests()
				.antMatchers("/").permitAll()
				// --- community START ---
				.antMatchers("/notice/list", "/notice/select","/notice/insert").permitAll()
				// --- community END ---
				// --- product START ---
				.antMatchers("/product/list").permitAll()
				.antMatchers("/product/select").permitAll()
				.antMatchers("/product/**").hasRole("ADMIN")
				// --- product END ---
				// --- cart END ---
				.antMatchers("/cart/counting").permitAll()
				.antMatchers("/cart/**").hasAnyRole("MEMBER","ADMIN")
				// --- cart END ---
				// --- orderlist START
				//.antMatchers("/order/**").hasAnyRole("MEMBER", "ADMIN")
				// --- orderlist END ---
				// --- purchase START
				//.antMatchers("/purchase/**").hasAnyRole("MEMBER", "ADMIN")
				// --- purchase END
				.antMatchers("/**").permitAll()
				.anyRequest().authenticated()
				;
	}
	
}
