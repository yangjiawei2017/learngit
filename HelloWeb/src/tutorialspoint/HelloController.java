package tutorialspoint;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller

public class HelloController {
//	@Resource
//	ComnServiceAbstract comnService ;
	@RequestMapping(value = "/hello",method = RequestMethod.GET)
	public String printHello(ModelMap model) {
//		comnService.comnQuery();
		model.addAttribute("message","hello spring mvc framework");
		return "hello";
	}
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String printIndex(ModelMap model) {
		return "index";
	}

	@RequestMapping(value = "/redirect", method = RequestMethod.GET)
	public String redirect() {
		return "redirect:finalPage";
	}

	@RequestMapping(value = "/finalPage", method = RequestMethod.GET)
	public String finalPage() {
		return "final";
	}
	
}
