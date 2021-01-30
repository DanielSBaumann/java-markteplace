package control;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

import model.MSaldo;

@Entity
@Table(name = "saldo")
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class Saldo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int id;
	@Column(name = "total", nullable = true, columnDefinition = "double precision default 0")
	protected double total;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_user", nullable = true, foreignKey = @ForeignKey(name = "fk_id_user"))
	protected Usuario usuario;

	public Saldo saldo(long id) {
		return new MSaldo().saldo(id);
	}

	public boolean saldoUser(Usuario usuario, double total) {
		NumberFormat formatFloat = new DecimalFormat("0.00");
		Saldo saldo = new Saldo().saldo(usuario);
		if (saldo == null) {
			this.usuario = usuario;
			this.total = Double.parseDouble(formatFloat.format((total * 0.95)).replace(",", "."));
			boolean aux = new MSaldo().update(this);
			return aux;
		} else {
			saldo.setTotal(Double.parseDouble(formatFloat.format(saldo.getTotal() + (total * 0.95)).replace(",", ".")));
			return new MSaldo().update(saldo);
		}
	}

	public boolean saldoAdmin(double total) {
		NumberFormat formatFloat = new DecimalFormat("0.00");
		Usuario usuario = new Usuario().user(5);
		Saldo saldo = new Saldo().saldo(usuario);
		if (saldo == null) {
			this.usuario = usuario;
			this.total = Double.parseDouble(formatFloat.format((total * 0.05)).replace(",", "."));
			return new MSaldo().update(this);
		} else {
			saldo.setTotal(Double.parseDouble(formatFloat.format(saldo.getTotal() + (total * 0.05)).replace(",", ".")));
			return new MSaldo().update(saldo);
		}
	}

	public Saldo saldo(Usuario usuario) {
		return new MSaldo().saldo(usuario.getId());
	}

	public boolean update(Saldo saldo) {
		return new MSaldo().update(saldo);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
