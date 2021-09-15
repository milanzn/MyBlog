package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cubes.main.dao.SliderRepository;
import cubes.main.entity.Slider;
@Service
public class SliderServiceImpl implements SliderService{
	
	@Autowired
	private SliderRepository sliderRepository;
	
	@Override
	public List<Slider> findAll() {
		
		return sliderRepository.findAll();
	}

	@Override
	public Slider findById(int id) {
		
		return sliderRepository.getById(id);
	}

	@Override
	public void save(Slider slider) {
		
		sliderRepository.save(slider);
	}

	@Override
	public void deleteById(int id) {
		
		sliderRepository.deleteById(id);
	}

	@Override
	public List<Slider> findAllByEnbledOrderByPriority() {
		
		return sliderRepository.findAllByEnabledTrueOrderByPriorityAsc();
	}

}
