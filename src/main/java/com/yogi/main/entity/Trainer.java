package com.yogi.main.entity;

import org.springframework.web.multipart.MultipartFile;

import com.uri.CRMUrl;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name="trainers")

public class Trainer 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int trainerId;
	
	private String name;
	
	private String image;

	private String qualification;

	private String experience;
	
	public int getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(int trainerId) {
		this.trainerId = trainerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(MultipartFile file) 
	{
		String fileName = file.getOriginalFilename();
		this.image= CRMUrl.workingDirectory+fileName;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
}
