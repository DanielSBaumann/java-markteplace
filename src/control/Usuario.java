package control;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import model.MUsuario;

@Entity
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class Usuario {

	public Usuario() {

	}

	public Usuario(long id) {
		this.id = id;
	}

	public Usuario(long id, String nome) {
		this.id = id;
		this.nome = nome;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	// PRIMEIRO ACESSO
	@Column(name = "nome", nullable = false, length = 200)
	protected String nome;
	@Column(name = "email", nullable = false, length = 200, unique = true)
	private String email;
	@Column(name = "senha", nullable = false, length = 200)
	protected String senha;
	@Column(name = "acesso", nullable = true, columnDefinition = "varchar(8) default \'usuario\' ")
	protected String acesso;
	// PRIMEIRO ACESSO

	// COMPLEMENTO DE CADASTRO
	@Column(name = "cpf", nullable = true, length = 11)
	protected String cpf;
	@Column(name = "data_niver")
	protected Date data_niver;
	@Column(name = "fone", nullable = true, length = 11)
	protected String fone;
	@Column(name = "cep", nullable = true, length = 8)
	protected String cep;
	@Column(name = "uf", nullable = true, length = 2)
	protected String uf;
	@Column(name = "cidade", nullable = true, length = 200)
	protected String cidade;
	@Column(name = "bairro", nullable = true, length = 200)
	protected String bairro;
	@Column(name = "endereco", nullable = true, length = 200)
	protected String endereco;
	@Column(name = "numero_endereco", nullable = true, length = 200)
	protected String numeroEndereco;
	@Column(name = "complemento", nullable = true, length = 200)
	protected String complemento;
	// COMPLEMENTO DE CADASTRO

	public boolean cadastrar(String nome, String email, String senha) {
		if (nome.matches("[a-zA-Z ]+") && email.matches("[a-zA-Z@.]+") && senha.matches("[a-zA-Z0-9]+")) {
			System.out.println("match ok!");
			this.nome = nome;
			this.email = email;
			this.senha = senha;
			return new MUsuario().cadastrar(this);
		} else {
			return false;
		}
	}

	public boolean login(String email, String senha) {
		if (email.matches("[a-zA-Z@.]+") && senha.matches("[a-zA-Z0-9]+")) {
			this.email = email;
			this.senha = senha;
			long id = new MUsuario().login(this);
			this.id = id;
			return (id > 0) ? true : false;
		} else {
			return false;
		}
	}

	public Usuario user(long id) {
		return new MUsuario().user(id);
	}

	public boolean mail(String email) {
		return new MUsuario().mail(email);
	}

	public boolean update(Date data_niver, long id, String cpf, String telefone, String cep, String uf, String cidade,
			String endereco) {
		Usuario user = new Usuario().user(id);
		user.setData_niver(data_niver);
		user.setCpf(cpf);
		user.setFone(telefone);
		user.setCep(cep);
		user.setUf(uf);
		user.setCidade(cidade);
		user.setEndereco(endereco);
		return new MUsuario().update(user);
	}

	public Usuario nameVendor(String name) {
		return new MUsuario().nameVendor(name);
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getAcesso() {
		return acesso;
	}

	public void setAcesso(String acesso) {
		this.acesso = acesso;
	}

//	public Saldo getSaldo() {
//		return saldo;
//	}
//
//	public void setSaldo(Saldo saldo) {
//		this.saldo = saldo;
//	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getData_niver() {
		return data_niver;
	}

	public void setData_niver(Date data_niver) {
		this.data_niver = data_niver;
	}

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getNumeroEndereco() {
		return numeroEndereco;
	}

	public void setNumeroEndereco(String numeroEndereco) {
		this.numeroEndereco = numeroEndereco;
	}

}
