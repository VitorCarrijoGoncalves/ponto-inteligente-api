package br.com.api.repositores;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.api.models.Empresa;

public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
	
	@Transactional(readOnly = true)
	Empresa findByCnpj(String cnpj);

}
