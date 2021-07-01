package com.fw.s1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Bean
	public PasswordEncoder passowrdEncoder() {
		return new BCryptPasswordEncoder();
	}

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
			.antMatchers("/upload/**")
			;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// URL에 따른 로그인, 권한 설정
		http
			.cors().and()
			.csrf().disable()
			.authorizeRequests()
//				.antMatchers("/**").permitAll()
				.antMatchers("/").permitAll()
				// --- community START ---
				.antMatchers("/notice/list", "/qna/list","/review/list").permitAll()
				.antMatchers("/notice/select", "/qna/select","/review/select").permitAll()
				.antMatchers("/lookbook/list", "/lookbook/select","/lookbook/modal","/stockist").permitAll()
				.antMatchers("/notice/**").hasAnyRole("MEMBER","ADMIN")
				// --- community END ---
				// --- product START ---
				.antMatchers("/product/**").permitAll()
//				.antMatchers("/product/list").permitAll()
//				.antMatchers("/product/select").permitAll()
//				.antMatchers("/product/**").hasRole("ADMIN")
				// --- product END ---
				// --- address START ---
				.antMatchers("/address/**").hasAnyRole("MEMBER","ADMIN")
				// --- address END ---
				// --- cart END ---
				.antMatchers("/cart/counting").permitAll()
				.antMatchers("/cart/**").hasAnyRole("MEMBER","ADMIN")
				// --- cart END ---
				// --- orderlist START
				.antMatchers("/order/**").hasAnyRole("MEMBER", "ADMIN")
				// --- orderlist END ---
				// --- admin START
				.antMatchers("/admin/**").hasRole("ADMIN")
				// --- admin END
				// --- member START ---
				.antMatchers("/member/memberJoin", "/member/memberLogin", "/member/finder/**").permitAll()
				.antMatchers("/member/memberPage/**").hasAnyRole("MEMBER", "ADMIN")
				// --- member END ---
				.anyRequest().authenticated()
			.and()
			.formLogin()
				.loginPage("/member/memberLogin")
				.defaultSuccessUrl("/member/memberLoginSuccess")
				.failureUrl("/member/memberLoginFail")
				.permitAll()
			.and()
			.logout()
				.logoutUrl("/member/memberLogout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(false)
				
				;
	}
	
}
