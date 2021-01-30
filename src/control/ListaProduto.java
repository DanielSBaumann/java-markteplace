package control;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import model.MListaProduto;

@Entity
@Table(name = "lista_produto")
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class ListaProduto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int id;
	@ManyToOne
	@JoinColumn(name = "id_produto", nullable = true, foreignKey = @ForeignKey(name = "fk_id_produto"))
	protected Produto produto;
	@ManyToOne
	@JoinColumn(name = "id_transacao", nullable = true, foreignKey = @ForeignKey(name = "fk_id_transacao"))
	protected Transacao tr;
	@Column(name = "qtd", nullable = true)
	protected int qtd;

	public boolean save(Transacao tr, String json) {
		List<Item> list = new Item().listaCompras(json);
		for (Item item : list) {
			Produto produto = new Produto(Integer.parseInt(item.getId()));
			int qtd = Integer.parseInt(item.getQtd());
			boolean aux1 = save(produto, tr, qtd);
			boolean aux2 = new Produto().qtd(produto, qtd);
			boolean aux3 = new Saldo().saldoUser(produto.getUsuario(), (produto.getPrecoFinal() * qtd));
			if (!aux1 || !aux2 || !aux3) {
				return false;
			}
		}
		return true;
	}

	public boolean save(Produto produto, Transacao tr, int qtd) {
		this.produto = produto;
		this.tr = tr;
		this.qtd = qtd;
		return new MListaProduto().save(this);
	}

	public List<ListaProduto> selectByUserId(long id) {
		return new MListaProduto().selectByUserId(id);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Transacao getTr() {
		return tr;
	}

	public void setTr(Transacao tr) {
		this.tr = tr;
	}

	public int getQtd() {
		return qtd;
	}

	public void setQtd(int qtd) {
		this.qtd = qtd;
	}

}
