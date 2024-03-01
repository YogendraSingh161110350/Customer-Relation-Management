package com.yogi.main.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogi.main.entity.VideoInfo;

@Controller
@RequestMapping("/courses")
public class CourseVideoController 
{
	//this is for the display video in page 
	
	private String url = "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json";
	RestTemplate template = new RestTemplate();
	String json = template.getForObject(url, String.class);
	
	@GetMapping("/video")
	public String showVideo(Model model) throws Exception
	{
		ObjectMapper mapper = new ObjectMapper();
		List<VideoInfo> videoInfo = mapper.readValue(json, new TypeReference<List<VideoInfo>>(){});
		//videoInfo.forEach((a)-> System.out.println(a));
		model.addAttribute("videos", videoInfo);
		return "course-video";
	}
}
