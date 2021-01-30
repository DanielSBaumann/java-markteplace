package control;

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

import model.MPayment;

@Entity
@Table(name = "payment")
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int id;
	@OneToOne(optional = true)
	@JoinColumn(name = "id_tr", nullable = true, foreignKey = @ForeignKey(name = "fk_id_tr"))
	protected Transacao tr;
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

	public boolean payment(Transacao tr, String titular, String num, String month, String year, String sec,
			String flag) {
		this.tr = tr;
		this.titular = titular;
		this.num = num;
		this.month = month;
		this.year = year;
		this.sec = sec;
		this.flag = flag;
		return new MPayment().payment(this);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Transacao getTr() {
		return tr;
	}

	public void setTr(Transacao tr) {
		this.tr = tr;
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
}
