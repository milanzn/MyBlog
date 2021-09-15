package cubes.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sliders")
public class Slider {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column
		private int id;
		@Column
		private String title;
		@Column
		private String image;
		@Column
		private String url;
		@Column(name = "button_title")
		private String ButtonTitle;
		@Column
		private int priority;
		@Column
		private boolean enabled;
		
		
		public Slider() {
			
		}

		public Slider(String title, String image, String url, String buttonTitle, int priority, boolean enabled) {
			super();
			this.title = title;
			this.image = image;
			this.url = url;
			ButtonTitle = buttonTitle;
			this.priority = priority;
			this.enabled = enabled;
		}



		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public String getTitle() {
			return title;
		}


		public void setTitle(String title) {
			this.title = title;
		}


		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}

		public String getUrl() {
			return url;
		}


		public void setUrl(String url) {
			this.url = url;
		}


		public String getButtonTitle() {
			return ButtonTitle;
		}


		public void setButtonTitle(String buttonTitle) {
			ButtonTitle = buttonTitle;
		}


		public int getPriority() {
			return priority;
		}


		public void setPriority(int priority) {
			this.priority = priority;
		}


		public boolean getEnabled() {
			return enabled;
		}


		public void setEnabled(boolean enabled) {
			this.enabled = enabled;
		}
		
		@Override
		public String toString() {
		
		return id+"-"+title;
		}
		
}
