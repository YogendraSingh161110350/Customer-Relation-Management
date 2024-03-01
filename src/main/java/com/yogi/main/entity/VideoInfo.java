package com.yogi.main.entity;


public class VideoInfo 
{
	    private String id;
	    private String title;
	    private String thumbnailUrl;
	    private String duration;
	    private String uploadTime;
	    private String views;
	    private String author;
	    private String videoUrl;
	    
	    private String description;
	    private String subscriber;
	    private boolean isLive;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getThumbnailUrl() {
			return thumbnailUrl;
		}
		public void setThumbnailUrl(String thumbnailUrl) {
			this.thumbnailUrl = thumbnailUrl;
		}
		public String getDuration() {
			return duration;
		}
		public void setDuration(String duration) {
			this.duration = duration;
		}
		public String getUploadTime() {
			return uploadTime;
		}
		public void setUploadTime(String uploadTime) {
			this.uploadTime = uploadTime;
		}
		public String getViews() {
			return views;
		}
		public void setViews(String views) {
			this.views = views;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getVideoUrl() {
			return videoUrl;
		}
		public void setVideoUrl(String videoUrl) {
			this.videoUrl = videoUrl;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getSubscriber() {
			return subscriber;
		}
		public void setSubscriber(String subscriber) {
			this.subscriber = subscriber;
		}
		public boolean getIsLive() {
			return isLive;
		}
		public void setIsLive(boolean isLive) {
			this.isLive = isLive;
		}
		@Override
		public String toString() {
			return "VideoInfo [id=" + id + ", title=" + title + ", thumbnailUrl=" + thumbnailUrl + ", duration="
					+ duration + ", uploadTime=" + uploadTime + ", views=" + views + ", author=" + author
					+ ", videoUrl=" + videoUrl + ", description=" + description + ", subscriber=" + subscriber
					+ ", isLive=" + isLive + "]";
		}
		
	    
}
