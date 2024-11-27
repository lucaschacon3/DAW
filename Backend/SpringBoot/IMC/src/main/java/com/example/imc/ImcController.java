package com.example.imc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ImcController {

	@GetMapping("/imc")
	public String imc(
		@RequestParam(name="peso", required=false, defaultValue="0") Double peso,
		@RequestParam(name="estatura", required = false, defaultValue ="0") Double estatura, Model model
		) {
		model.addAttribute("peso", peso);
		model.addAttribute("estatura", estatura);
		
		double calculo=(peso)/((estatura/100)*(estatura/100));
		String imc="";
		if (calculo<18.5) {
			imc="Bajo peso";
		}else if (calculo<24.9) {
			imc="Normal";
		}else if (calculo<29.9) {
			imc="Sobrepeso";
		}else if (calculo>=30) {
			imc="Obesidad";
		}else{
			imc="No válido";
		}

		model.addAttribute("imc", imc);
		model.addAttribute("calculo", calculo);
		return "imc";
	}

}