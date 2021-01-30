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
import model.MCartaoUsuario;

@Entity
@Table(name = "cartao_usuario")
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class CartaoUsuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int id;
	@ManyToOne(optional = true)
	@JoinColumn(name = "id_user", nullable = true, foreignKey = @ForeignKey(name = "fk_id_user"))
	protected Usuario usuario;
	@Column(name = "titular", nullable = false, length = 200)
	protected String titular;
	@Column(name = "num", nullable = false, length = 16)
	protected String num;
	@Column(name = "month", nullable = false, length = 2)
	protected String month;
	@Column(name = "year", nullable = false, length = 4)
	protected String year;
	@Column(name = "sec", nullable = false, length = 4)
	protected String sec;
	@Column(name = "flag", nullable = false, length = 20)
	protected String flag;
	@Column(name = "type", nullable = true, columnDefinition = "varchar(7) default 'credito'")
	protected String type;
	@Column(name = "validate", nullable = true, columnDefinition = "BOOLEAN default TRUE ")
	protected Boolean validate;

	public Boolean save(Usuario usuario, String titular, String num, String month, String year, String sec,
			String flag) {
		this.usuario = usuario;
		this.titular = titular;
		this.num = num;
		this.month = month;
		this.year = year;
		this.sec = sec;
		this.flag = flag;
		return new MCartaoUsuario().save(this);
	}

	public List<CartaoUsuario> list(long id) {
		return new MCartaoUsuario().list(id);
	}

	public CartaoUsuario card(int id) {
		return new MCartaoUsuario().card(id);
	}

	public boolean removeCard(int id) {
		CartaoUsuario card = new CartaoUsuario().card(id);
		card.setValidate(false);
		return new MCartaoUsuario().removeCard(card);
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

	public String getTitular() {
		return titular;
	}

	public void setTitular(String titular) {
		this.titular = titular;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSec() {
		return sec;
	}

	public void setSec(String sec) {
		this.sec = sec;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getValidate() {
		return validate;
	}

	public void setValidate(Boolean validate) {
		this.validate = validate;
	}

}
