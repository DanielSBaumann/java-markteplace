package servlet;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {

	public static void main(String[] args) {

		Scanner read = new Scanner(System.in);
		System.out.println("Digite a tag completa para ver a noticia");
		String news = read.nextLine();
		System.out.println(link(news));
		read.close();

//		String tag = "<a href=\"https://g1.globo.com/economia/concursos-e-emprego/noticia/2021/04/03/fechamento-de-vagas-formais-em-2020-atingiu-mais-quem-ganhou-de-meio-a-1-salario-minimo.ghtml\" class=\"feed-post-link gui-color-primary gui-color-hover\">Fechamento de vagas formais em 2020 atingiu mais quem ganhou de meio a 1 salário mínimo</a>";
//		
//		String mydata = "some string with 'the data i want' inside";
//		Pattern pattern = Pattern.compile(">(.*?)<");
//		Matcher matcher = pattern.matcher(tag);
//		if (matcher.find()) {
//			System.out.println(matcher.group(1));
//		}

	}

	public static String noticia(String tag) {
		Pattern pattern = Pattern.compile(">(.*?)<");
		Matcher matcher = pattern.matcher(tag);
		if (matcher.find()) {
			return matcher.group(1);
		} else {
			return "ERRO";
		}
	}

	public static String link(String tag) {
		Pattern pattern = Pattern.compile("href=\"(.*?)\"");
		Matcher matcher = pattern.matcher(tag);
		if (matcher.find()) {
			return matcher.group(1);
		} else {
			return "ERRO";
		}
	}

}
