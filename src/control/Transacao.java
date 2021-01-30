package control;

import java.util.Date;
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

import model.MTransacao;

@Entity
@Table(name = "transacoes")
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class Transacao {

	public Transacao() {

	}

	public Transacao(int id) {
		this.id = id;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int id;
	@ManyToOne
	@JoinColumn(name = "id_comprador", nullable = true, foreignKey = @ForeignKey(name = "fk_id_comprador"))
	protected Usuario usuario;
	@Column(name = "subtotal", nullable = true)
	protected double subtotal;
	@Column(name = "data_transacao", nullable = true, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	protected Date data;
	@Column(name = "qtd", nullable = true)
	protected int qtd;

	public boolean transaction(Date data, Usuario usuario, double subtotal, int qtd) {
		this.data = data;
		this.usuario = usuario;
		this.subtotal = subtotal;
		this.qtd = qtd;
		return new MTransacao().transaction(this);
	}

	public int transactionId(Date data, Usuario usuario, double subtotal, int qtd) {
		this.data = data;
		this.usuario = usuario;
		this.subtotal = subtotal;
		this.qtd = qtd;
		if (new MTransacao().transaction(this)) {
			return new MTransacao().lastId();
		} else {
			return -1;
		}
	}

	public List<Transacao> list(long id) {
		return new MTransacao().list(id);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public int getQtd() {
		return qtd;
	}

	public void setQtd(int qtd) {
		this.qtd = qtd;
	}

}
