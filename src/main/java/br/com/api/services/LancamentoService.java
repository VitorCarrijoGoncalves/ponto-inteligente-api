package br.com.api.services;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import br.com.api.models.Lancamento;

public interface LancamentoService {
	
	Page<Lancamento> buscarPorFuncionarioId(Long funcionarioId, PageRequest pageRequest);
	
	Optional<Lancamento> buscarPorId(Long id);
	
	Lancamento persistir(Lancamento lancamento);
	
	void remover(Long id);

}
