package control;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;

public class Item {

	private String id;
	private String nome;
	private String preco;
	private String precoFinal;
	private String desconto;
	private String qtd;
	private String qtdEstoque;
	private String imagem;
	private String anunciante;

	@Override
	public boolean equals(Object obj) {
		Item other = (Item) obj;
		return this.id.equals(other.id) ? true : false;
	}

	public String jsonRoutine(String json, List<Integer> idList) {
		List<Item> lc = listaCompras(json);
		List<Item> lv = listaVerificada(lc, idList);
		return listaParaJson(lv);
	}

	public String finalList(String lc1, String lc2) {
		List<Item> lista1 = listaCompras(lc1);
		List<Item> lista2 = listaCompras(lc2);
		List<Item> listaFinal = verify(lista1, lista2);
		return listaParaJson(listaFinal);
	}

	public List<Item> verify(List<Item> lista1, List<Item> lista2) {
		List<Item> lc = lista1;
		for (Item item : lista2) {
			if (!lc.contains(item)) {
				lc.add(item);
			}
		}
		return lc;
	}

	public List<Item> listaCompras(String json) {
		String lc = json.substring(1, json.length() - 1);
		lc = lc.replace("{", "");
		String[] array = lc.split("}");
		List<Item> listaCompras = new ArrayList<Item>();
		for (int i = 0; i < array.length; i++) {
			if (i > 0) {
				array[i] = array[i].substring(1);
			}
			listaCompras.add(new Gson().fromJson("{" + array[i] + "}", Item.class));
		}
		return listaCompras.isEmpty() ? null : listaCompras;
	}

	public List<Item> listaVerificada(List<Item> listaCompras, List<Integer> idList) {
		List<Item> listaVerificada = new ArrayList<Item>();
		boolean aux = true;
		for (Item lc : listaCompras) {
			for (int id : idList) {
				if (Integer.parseInt(lc.getId()) == id) {
					aux = false;
				}
			}
			if (aux) {
				listaVerificada.add(lc);
			}
			aux = true;
		}
		return listaVerificada;
	}

	public String listaParaJson(List<Item> listaCompras) {
		if (!listaCompras.isEmpty()) {
			String json = "";
			for (Item lc : listaCompras) {
				json += new Gson().toJson(lc) + ",";
			}
			return "[" + json.substring(0, json.length() - 1) + "]";
		} else {
			return "[]";
		}
	}

	// metodo para retornar qtd
	public int qtd(String json) {
		int qtd = 0;
		List<Item> list = listaCompras(json);
		for (Item lc : list) {
			qtd += Integer.parseInt(lc.getQtd());
		}
		return qtd;
	}

	// metodo para retornar subtotal
	public double total(String json) {
		double total = 0;
		List<Item> list = listaCompras(json);
		for (Item lc : list) {
			total += (Double.parseDouble(lc.getPrecoFinal()) * Double.parseDouble(lc.getQtd()));
		}
		NumberFormat form = new DecimalFormat("0.00");
		return Double.parseDouble(form.format(total).replace(",", "."));
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPreco() {
		return preco;
	}

	public void setPreco(String preco) {
		this.preco = preco;
	}

	public String getPrecoFinal() {
		return precoFinal;
	}

	public void setPrecoFinal(String precoFinal) {
		this.precoFinal = precoFinal;
	}

	public String getDesconto() {
		return desconto;
	}

	public void setDesconto(String desconto) {
		this.desconto = desconto;
	}

	public String getQtd() {
		return qtd;
	}

	public void setQtd(String qtd) {
		this.qtd = qtd;
	}

	public String getQtdEstoque() {
		return qtdEstoque;
	}

	public void setQtdEstoque(String qtdEstoque) {
		this.qtdEstoque = qtdEstoque;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getAnunciante() {
		return anunciante;
	}

	public void setAnunciante(String anunciante) {
		this.anunciante = anunciante;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
