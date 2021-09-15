package cubes.main.service;

import java.util.List;


import cubes.main.entity.Slider;

public interface SliderService {
	
	public List<Slider> findAll(); 
	
	public Slider findById(int id);
	
	public void save(Slider slider);
	
	public void deleteById(int id);
	
	public List<Slider> findAllByEnbledOrderByPriority(); 
	

}
