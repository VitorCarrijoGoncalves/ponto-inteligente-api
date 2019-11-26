package br.com.api.services.impl;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.api.models.Funcionario;
import br.com.api.repositores.FuncionarioRepository;
import br.com.api.services.FuncionarioService;

@Service
public class FuncionarioServiceImpl implements FuncionarioService {
	
	private static final Logger log = LoggerFactory.getLogger(FuncionarioServiceImpl.class);
	
	@Autowired
	private FuncionarioRepository funcionarioRepository;

	@Override
	public Funcionario persistir(Funcionario funcionario) {
		log.info("Persistindo funcionário: {}", funcionario);
		return this.funcionarioRepository.save(funcionario);
	}

	@Override
	public Optional<Funcionario> buscarPorCpf(String cpf) {
		log.info("Buscando funcionário pelo CPF {}", cpf);
		return Optional.ofNullable(this.funcionarioRepository.findByCpf(cpf));
	}

	@Override
	public Optional<Funcionario> buscarPorEmail(String email) {
		log.info("Buscando funcionário pelo e-mail {}", email);
		return Optional.ofNullable(this.funcionarioRepository.findByEmail(email));
	}

	@Override
	public Optional<Funcionario> buscarPorId(Long id) {
		log.info("Buscando funcionário pelo id {}", id);
		return Optional.ofNullable(this.funcionarioRepository.findOne(id));
	}

}
