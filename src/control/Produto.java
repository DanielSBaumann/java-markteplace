package control;

import java.io.File;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.ForeignKey;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import model.MProduto;

@Entity
@Table(name = "produtos")
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class Produto {

	public Produto() {

	}

	public Produto(int id) {
		Produto p = new Produto().meuProduto(id);
		this.usuario = p.getUsuario();
		this.id = id;
		this.nome = p.getNome();
		this.marca = p.getMarca();
		this.descricao = p.getDescricao();
		this.categoria = p.getCategoria();
		this.preco = p.getPreco();
		this.precoFinal = p.getPrecoFinal();
		this.desconto = p.getDesconto();
		this.qtd = p.getQtd();
		this.qtdVendida = p.getQtdVendida();
		this.ativo = p.getAtivo();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int id;
	@Column(name = "nome", nullable = false, length = 200)
	protected String nome;
	@Column(name = "marca", nullable = false, length = 200)
	protected String marca;
	@Column(name = "descricao", nullable = false, length = 200)
	protected String descricao;
	@Column(name = "categoria", nullable = false, length = 50)
	protected String categoria;
	@Column(name = "preco", nullable = false)
	protected double preco;
	@Column(name = "preco_final", nullable = false, columnDefinition = "float default 0")
	protected double precoFinal;
	@Column(name = "desconto", nullable = false, columnDefinition = "integer default 0")
	protected int desconto;
	@Column(name = "qtd", nullable = false, columnDefinition = "integer default 0")
	protected int qtd;
	@Column(name = "qtd_vendida", nullable = false, columnDefinition = "integer default 0")
	protected int qtdVendida;
	@Column(name = "ativo", nullable = true, columnDefinition = "BOOLEAN default TRUE ")
	protected Boolean ativo;

	// IMAGENS!
	@Column(name = "img1", nullable = true)
	protected File img1;
	@Column(name = "img2", nullable = true)
	protected File img2;
	@Column(name = "img3", nullable = true)
	protected File img3;
	@Column(name = "img4", nullable = true)
	protected File img4;

	@Column(name = "imagem1", nullable = true)
	protected String imagem1;
	@Column(name = "imagem2", nullable = true)
	protected String imagem2;
	@Column(name = "imagem3", nullable = true)
	protected String imagem3;
	@Column(name = "imagem4", nullable = true)
	protected String imagem4;
	// IMAGENS!

	@ManyToOne(optional = true)
	@JoinColumn(name = "id_user", nullable = true, foreignKey = @ForeignKey(name = "fk_id_user"))
	protected Usuario usuario;

	public boolean cadastrar2(Usuario usuario, String nome, String descricao, String marca, String categoria,
			File imagem1, File imagem2, File imagem3, File imagem4, double preco, int qtd) {

		// ACRESCENTAR VERIFICACOES SEGURANCA

		this.usuario = usuario;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.categoria = categoria;
		this.preco = preco;
		this.precoFinal = preco;
		this.qtd = qtd;
		this.img1 = imagem1;
//		if (!imagem2.isEmpty()) {
		this.img2 = imagem2;
//		}
//		if (!imagem3.isEmpty()) {
		this.img3 = imagem3;
//		}
//		if (!imagem4.isEmpty()) {
		this.img4 = imagem4;
//		}
		return new MProduto().cadastrar(this);

	}

	public boolean cadastrar(Usuario usuario, String nome, String descricao, String marca, String categoria,
			String imagem1, String imagem2, String imagem3, String imagem4, double preco, int qtd) {

		// ACRESCENTAR VERIFICACOES SEGURANCA

		this.usuario = usuario;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.categoria = categoria;
		this.preco = preco;
		this.qtd = qtd;
		this.imagem1 = imagem1;
		if (!imagem2.isEmpty()) {
			this.imagem2 = imagem2;
		}
		if (!imagem3.isEmpty()) {
			this.imagem3 = imagem3;
		}
		if (!imagem4.isEmpty()) {
			this.imagem4 = imagem4;
		}
		return new MProduto().cadastrar(this);
	}

	// lista dos ids para usar com JSON
	public List<Integer> idList(long id) {
		List<Integer> idList = new ArrayList<Integer>();
		List<Produto> list = new MProduto().list(id);
		for (Produto p : list) {
			idList.add(p.getId());
		}
		return idList;
	}

	public List<Produto> list(long id) {
		return new MProduto().list(id);
	}

	public Produto meuProduto(long id) {
		return new MProduto().meuProduto(id);
	}

	public boolean updateProduto(long id, int qtd, int desconto, boolean ativo) {
		Produto produto = new Produto().meuProduto(id);
		produto.setQtd(qtd);
		produto.setDesconto(desconto);
		produto.setAtivo(ativo);
		NumberFormat formatFloat = new DecimalFormat("0.00");
		double preco = (produto.getPreco() / 100) * (100 - desconto);
		preco = Double.parseDouble(formatFloat.format(preco).replace(",", "."));
		produto.setPrecoFinal(preco);
		return new MProduto().update(produto);
	}

	// ###############################################################################
	// ############################PRODUTOS###########################################
	// ###############################################################################

	public boolean qtd(Produto produto, int qtd) {
		int p1 = new MProduto().updateQTD(produto, qtd);
		int p2 = new MProduto().updateQTDVendida(produto, qtd);
		return p1 == 1 && p2 == 1 ? true : false;
	}

	// update qtd
	public int updateQTD(Produto produto, int qtd) {
		return new MProduto().updateQTD(produto, qtd);
	}

	// update qtd vendida
	public int updateQTDVendida(Produto produto, int qtd) {
		return new MProduto().updateQTDVendida(produto, qtd);
	}

	public List<Produto> main(long id) {
		return new MProduto().main(id);
	}

	public List<Produto> eletronicos(long id) {
		return new MProduto().eletronicos(id);
	}

	public List<Produto> acessorios(long id) {
		return new MProduto().acessorios(id);
	}

	public List<Produto> infantil(long id) {
		return new MProduto().infantil(id);
	}

	public List<Produto> fashion(long id) {
		return new MProduto().fashion(id);
	}

	public List<Produto> esportes(long id) {
		return new MProduto().esportes(id);
	}

	public List<Produto> livros(long id) {
		return new MProduto().livros(id);
	}

	public Produto display(long id) {
		return new MProduto().display(id);
	}

	public List<Produto> displayUser(long id, long idUser) {
		return new MProduto().displayUser(id, idUser);
	}

	public boolean vendor(long idUser, long idProd) {
		return new MProduto().vendor(idUser, idProd);
	}

	public List<Produto> vendor(long id) {
		return new MProduto().vendor(id);
	}

	// ###############################################################################
	// ############################PRODUTOS###########################################
	// ###############################################################################

	// ###############################################################################
	// ####################PESQUISAS##################################################
	// ###############################################################################

	public List<Produto> searchNome(long id, String search) {
		return new MProduto().searchNome(id, search);
	}

	public List<Produto> searchMarca(long id, String search) {
		return new MProduto().searchMarca(id, search);
	}

	public List<Produto> searchCategoria(long id, String search) {
		return new MProduto().searchCategoria(id, search);
	}

	// REMOVER ITENS REPETIDOS
	public List<Produto> listaFinal(List<Produto> lista1, List<Produto> lista2, List<Produto> lista3) {
		List<Produto> listaFinal = new ArrayList<Produto>();
		for (Produto p : lista1) {
			if (!listaFinal.contains(p)) {
				listaFinal.add(p);
			}
		}
		for (Produto p : lista2) {
			if (!listaFinal.contains(p)) {
				listaFinal.add(p);
			}
		}
		for (Produto p : lista3) {
			if (!listaFinal.contains(p)) {
				listaFinal.add(p);
			}
		}
		return listaFinal;
	}

	@Override
	public boolean equals(Object obj) {
		Produto other = (Produto) obj;
		return this.id == other.id ? true : false;
	}

	public Produto empty() {
		usuario = null;
		nome = "";
		descricao = "";
		marca = "";
		categoria = "";
		preco = 0;
		precoFinal = 0;
		qtd = 0;
		imagem1 = "";
		imagem2 = "";
		imagem3 = "";
		imagem4 = "";
		return this;
	}

	// ###############################################################################
	// ####################PESQUISAS##################################################
	// ###############################################################################

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public int getQtd() {
		return qtd;
	}

	public void setQtd(int qtd) {
		this.qtd = qtd;
	}

	public File getImg1() {
		return img1;
	}

	public void setImg1(File img1) {
		this.img1 = img1;
	}

	public File getImg2() {
		return img2;
	}

	public void setImg2(File img2) {
		this.img2 = img2;
	}

	public File getImg3() {
		return img3;
	}

	public void setImg3(File img3) {
		this.img3 = img3;
	}

	public File getImg4() {
		return img4;
	}

	public void setImg4(File img4) {
		this.img4 = img4;
	}

	public String getImagem1() {
		return imagem1;
	}

	public void setImagem1(String imagem1) {
		this.imagem1 = imagem1;
	}

	public String getImagem2() {
		return imagem2;
	}

	public void setImagem2(String imagem2) {
		this.imagem2 = imagem2;
	}

	public String getImagem3() {
		return imagem3;
	}

	public void setImagem3(String imagem3) {
		this.imagem3 = imagem3;
	}

	public String getImagem4() {
		return imagem4;
	}

	public void setImagem4(String imagem4) {
		this.imagem4 = imagem4;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public int getDesconto() {
		return desconto;
	}

	public void setDesconto(int desconto) {
		this.desconto = desconto;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public double getPrecoFinal() {
		return precoFinal;
	}

	public void setPrecoFinal(double precoFinal) {
		this.precoFinal = precoFinal;
	}

	public int getQtdVendida() {
		return qtdVendida;
	}

	public void setQtdVendida(int qtdVendida) {
		this.qtdVendida = qtdVendida;
	}

}
