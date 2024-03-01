package com.yogi.main.entity;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.uri.CRMUrl;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "courses")

public class Course 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "syllabus")

	private String Syllabus;

	@Column(name = "price")

	private float price;

	@Column(name = "discount")

	private float discount;

	@Column(name = "image")

	private String image;

	@Column(name = "validity")

	private String validity;

	@Column(name = "launching_Date")
	private Date launchingDate;

	@Column(name = "mode")

	private String mode;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "trainer_id")
	private Trainer trainer;
	@Column(name = "level")

	private String level;
	@Column(name = "reviews")
	private List<String> reviews;

	private String prerequisites;

	private String category;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSyllabus() {
		return Syllabus;
	}

	public void setSyllabus(String syllabus) {
		Syllabus = syllabus;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(MultipartFile file) {
		String fileName = file.getOriginalFilename();
		this.image = CRMUrl.workingDirectory + fileName;
	}

	public String getValidity() {
		return validity;
	}

	public void setValidity(String validity) {
		this.validity = validity;
	}

	public Date getLaunchingDate() {
		return launchingDate;
	}

	public void setLaunchingDate(Date launchingDate) {
		this.launchingDate = launchingDate;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public Trainer getTrainer() {
		return trainer;
	}

	public void setTrainer(Trainer trainer) {
		this.trainer = trainer;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public List<String> getReviews() {
		return reviews;
	}

	public void setReviews(List<String> reviews) {
		this.reviews = reviews;
	}

	public String getPrerequisites() {
		return prerequisites;
	}

	public void setPrerequisites(String prerequisites) {
		this.prerequisites = prerequisites;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", Syllabus=" + Syllabus + ", price=" + price + ", discount="
				+ discount + ", image=" + image + ", validity=" + validity + ", launchingDate=" + launchingDate
				+ ", mode=" + mode + ", trainer=" + trainer + ", level=" + level + ", reviews=" + reviews
				+ ", prerequisites=" + prerequisites + ", category=" + category + "]";
	}

}
