package br.com.api.controllers;

import java.security.NoSuchAlgorithmException;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.api.dtos.CadastroPJDTO;
import br.com.api.enums.PerfilEnum;
import br.com.api.models.Empresa;
import br.com.api.models.Funcionario;
import br.com.api.response.Response;
import br.com.api.services.EmpresaService;
import br.com.api.services.FuncionarioService;
import br.com.api.utils.PasswordUtils;

@RestController
@RequestMapping("/api/cadastrar-pj")
@CrossOrigin(origins = "*")
public class CadastroPJController {
	
	private static final Logger log = LoggerFactory.getLogger(CadastroPJController.class);
	
	@Autowired
	private FuncionarioService funcionarioService;
	
	@Autowired
	private EmpresaService empresaService;
	
	public CadastroPJController() {}
	
	@PostMapping
	public ResponseEntity<Response<CadastroPJDTO>> cadastrar(@Valid @RequestBody CadastroPJDTO cadastroPJDto,
			BindingResult result) throws NoSuchAlgorithmException {
		log.info("Cadastrando PJ: {}", cadastroPJDto.toString());
		Response<CadastroPJDTO> response = new Response<>();
		
		validarDadosExistentes(cadastroPJDto, result);
		Empresa empresa = this.converterDtoParaEmpresa(cadastroPJDto);
		Funcionario funcionario = this.converterDtoParaFuncionario(cadastroPJDto, result);
		
		if (result.hasErrors()) {
			log.error("Erro validando dados de cadastro PJ: {}", result.getAllErrors());
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		
		this.empresaService.persistir(empresa);
		funcionario.setEmpresa(empresa);
		this.funcionarioService.persistir(funcionario);
		return ResponseEntity.badRequest().body(response);
		
	}
	
	private void validarDadosExistentes(CadastroPJDTO cadastroPJDTO, BindingResult result) {
		this.empresaService.buscarPorCnpj(cadastroPJDTO.getCnpj())
		.ifPresent(emp -> result.addError(new ObjectError("funcionario", "CPF já existente.")));
		
		this.funcionarioService.buscarPorCpf(cadastroPJDTO.getCpf())
		.ifPresent(func -> result.addError(new ObjectError("funcionario", "CPF já existente.")));
		
		this.funcionarioService.buscarPorEmail(cadastroPJDTO.getEmail())
		.ifPresent(func -> result.addError(new ObjectError("funcionario", "Email já existente.")));
		
	}
	
	private Empresa converterDtoParaEmpresa(CadastroPJDTO cadastroPJDto) {
		
		Empresa empresa = new Empresa();
		empresa.setCnpj(cadastroPJDto.getCnpj());
		empresa.setRazaoSocial(cadastroPJDto.getRazaoSocial());
		return empresa;
		
	}
	
	private Funcionario converterDtoParaFuncionario (CadastroPJDTO cadastroPJDto, BindingResult result) throws NoSuchAlgorithmException {
		
		Funcionario funcionario = new Funcionario();
		funcionario.setNome(cadastroPJDto.getNome());
		funcionario.setEmail(cadastroPJDto.getEmail());
		funcionario.setCpf(cadastroPJDto.getCpf());
		funcionario.setPerfilEnum(PerfilEnum.ROLE_ADMIN);
		funcionario.setSenha(PasswordUtils.gerarBCrypt(cadastroPJDto.getSenha()));
		
		return funcionario;
		
	}
	

}
