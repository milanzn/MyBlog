package cubes.main.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AuthController {

	
	@GetMapping(value = "/login-page")
	public String getLoginPage() {
		return"login-page";
	}
}
