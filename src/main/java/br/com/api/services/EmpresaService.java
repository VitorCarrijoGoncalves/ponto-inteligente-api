package br.com.api.services;

import java.util.Optional;

import br.com.api.models.Empresa;

public interface EmpresaService {
	
	Optional<Empresa> buscarPorCnpj(String cnpj);
	
	Empresa persistir(Empresa empresa);

}
