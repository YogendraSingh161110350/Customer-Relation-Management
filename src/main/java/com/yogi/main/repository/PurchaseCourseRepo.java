package com.yogi.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yogi.main.entity.PurchaseCourse;

@Repository
public interface PurchaseCourseRepo extends JpaRepository<PurchaseCourse, Integer>
{

}
