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
import model.MListaCompra;

@Entity
@Table(name = "lista_compras")
@DynamicUpdate(value = true)
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
public class ListaCompra {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int id;
	@OneToOne(optional = true)
	@JoinColumn(name = "id_user", nullable = true, foreignKey = @ForeignKey(name = "fk_id_user"))
	protected Usuario usuario;
	@Column(name = "lista", nullable = true, length = 1000)
	protected String lista;

	public ListaCompra() {

	}

	public ListaCompra(int id, String lista) {
		Usuario u = new Usuario(id);
		this.usuario = u;
		this.lista = lista;
	}

	public boolean saveList(Usuario usuario, String lista) {
		this.usuario = usuario;
		this.lista = lista;
		return new MListaCompra().saveList(this);
	}

	public boolean resetList(Usuario usuario) {
		// pegar lista antiga
		ListaCompra lc = new ListaCompra().lista((int) usuario.getId());
		lc.setLista("[]");
		return new MListaCompra().updateList(lc);
	}

	public ListaCompra lista(int id) {
		return new MListaCompra().lista(id);
	}

	public boolean updateList(int id, String lista) {
		ListaCompra lc = new ListaCompra().lista(id);
		if (lc == null) {
			ListaCompra lcNew = new ListaCompra(id, lista);
			return new MListaCompra().updateList(lcNew);
		} else {
			lc.setLista(lista);
			return new MListaCompra().updateList(lc);
		}
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

	public String getLista() {
		return lista;
	}

	public void setLista(String lista) {
		this.lista = lista;
	}

}
