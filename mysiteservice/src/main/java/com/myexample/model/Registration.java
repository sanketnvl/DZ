package com.myexample.model;

import java.util.Date;

import org.springframework.stereotype.Component;


@Component
public class Registration {

	

	private int id;
	private String firstName;
	private String lastname;
	private String photo;
	private String email;
	private String phone;
	private String country;
	private String state;
	private String pincode;
	private String password;
	private String confirmpassword;
	private String companyName;
	private String jobTitle;
	private String clientId;
	private String clientSecret;
	
	private String email_verification_token;
	private int user_type;
	private int status;
	private String role;
	private String isCompany;
	
	
	private Date date;
	private Date updatedOn;
	private String message;
	
	private String project;
	private String theme;
	private String linktodrysign;
	private String deviceVersion;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}
	public String getEmail_verification_token() {
		return email_verification_token;
	}
	public void setEmail_verification_token(String email_verification_token) {
		this.email_verification_token = email_verification_token;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getIsCompany() {
		return isCompany;
	}
	public void setIsCompany(String isCompany) {
		this.isCompany = isCompany;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getUpdatedOn() {
		return updatedOn;
	}
	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getDeviceVersion() {
		return deviceVersion;
	}
	public void setDeviceVersion(String deviceVersion) {
		this.deviceVersion = deviceVersion;
	}
	public String getLinktodrysign() {
		return linktodrysign;
	}
	public void setLinktodrysign(String linktodrysign) {
		this.linktodrysign = linktodrysign;
	}
	@Override
	public String toString() {
		return "Registration [id=" + id + ", firstName=" + firstName
				+ ", lastname=" + lastname + ", photo=" + photo + ", email="
				+ email + ", phone=" + phone + ", country=" + country
				+ ", state=" + state + ", pincode=" + pincode + ", password="
				+ password + ", confirmpassword=" + confirmpassword
				+ ", companyName=" + companyName + ", jobTitle=" + jobTitle
				+ ", clientId=" + clientId + ", clientSecret=" + clientSecret
				+ ", email_verification_token=" + email_verification_token
				+ ", user_type=" + user_type + ", status=" + status + ", role="
				+ role + ", isCompany=" + isCompany + ", date=" + date
				+ ", updatedOn=" + updatedOn + ", message=" + message
				+ ", project=" + project + ", theme=" + theme
				+ ", linktodrysign=" + linktodrysign + ", deviceVersion="
				+ deviceVersion + "]";
	}

	
	
	
	
	
	

}
