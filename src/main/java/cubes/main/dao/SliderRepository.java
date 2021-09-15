package cubes.main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cubes.main.entity.Slider;

public interface SliderRepository extends JpaRepository<Slider, Integer>{
	
	List<Slider>findAllByEnabledTrueOrderByPriorityAsc();

}
