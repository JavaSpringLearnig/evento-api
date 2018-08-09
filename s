[1mdiff --git a/src/main/java/com/welitonmartins/controller/EventoController.java b/src/main/java/com/welitonmartins/controller/EventoController.java[m
[1mindex 5ad1de4..3cc8911 100644[m
[1m--- a/src/main/java/com/welitonmartins/controller/EventoController.java[m
[1m+++ b/src/main/java/com/welitonmartins/controller/EventoController.java[m
[36m@@ -63,6 +63,14 @@[m [mpublic class EventoController {[m
 		[m
 		[m
 	}[m
[32m+[m	[32m@RequestMapping("/deletarEvento")[m
[32m+[m	[32mpublic String deletarEvento(long codigo) {[m
[32m+[m		[32mEvento evento = eventoRepository.findByCodigo(codigo);[m
[32m+[m		[32meventoRepository.delete(evento);[m
[32m+[m		[32mreturn "redirect:/eventos";[m
[32m+[m[41m		[m
[32m+[m	[32m}[m
[32m+[m[41m	[m
 	@RequestMapping(value="/{codigo}", method=RequestMethod.POST)[m
 	public String detalhesEventoPost(@PathVariable("codigo") long codigo, @Valid Convidado convidado, BindingResult result, RedirectAttributes attributes) {[m
 		if(result.hasErrors()) {[m
[36m@@ -78,4 +86,14 @@[m [mpublic class EventoController {[m
 		[m
 [m
 	}[m
[32m+[m	[32m@RequestMapping("deletarConvidado")[m
[32m+[m	[32mpublic String deletarConvidado(String rg) {[m
[32m+[m		[32mConvidado convidado = convidadoRepository.findByRg(rg);[m
[32m+[m		[32mconvidadoRepository.delete(convidado);[m
[32m+[m[41m		[m
[32m+[m		[32mEvento evento = convidado.getEvento();[m
[32m+[m		[32mlong codigoLong = evento.getCodigo();[m
[32m+[m		[32mString codigo = "" + codigoLong;[m
[32m+[m		[32mreturn "redirect:/" + codigo;[m
[32m+[m	[32m}[m
 }[m
[1mdiff --git a/src/main/java/com/welitonmartins/repository/ConvidadoRepository.java b/src/main/java/com/welitonmartins/repository/ConvidadoRepository.java[m
[1mindex 0f847b1..aab369c 100644[m
[1m--- a/src/main/java/com/welitonmartins/repository/ConvidadoRepository.java[m
[1m+++ b/src/main/java/com/welitonmartins/repository/ConvidadoRepository.java[m
[36m@@ -7,5 +7,5 @@[m [mimport com.welitonmartins.models.Evento;[m
 [m
 public interface ConvidadoRepository extends CrudRepository<Convidado, String>{[m
 	Iterable<Convidado> findByEvento(Evento evento);[m
[31m-[m
[32m+[m	[32mConvidado findByRg(String rg);[m
 }[m
[1mdiff --git a/src/main/java/com/welitonmartins/repository/EventoRepository.java b/src/main/java/com/welitonmartins/repository/EventoRepository.java[m
[1mindex eba1693..5d28520 100644[m
[1m--- a/src/main/java/com/welitonmartins/repository/EventoRepository.java[m
[1m+++ b/src/main/java/com/welitonmartins/repository/EventoRepository.java[m
[36m@@ -2,9 +2,10 @@[m [mpackage com.welitonmartins.repository;[m
 [m
 import org.springframework.data.repository.CrudRepository;[m
 [m
[32m+[m
 import com.welitonmartins.models.Evento;[m
 [m
 public interface EventoRepository extends CrudRepository<Evento, String>{[m
 	Evento findByCodigo(Long codigo);[m
[31m-[m
[32m+[m[41m	[m
 }[m
[1mdiff --git a/src/main/resources/templates/evento/detalhesEvento.html b/src/main/resources/templates/evento/detalhesEvento.html[m
[1mindex 46d43f3..cf5605e 100644[m
[1m--- a/src/main/resources/templates/evento/detalhesEvento.html[m
[1m+++ b/src/main/resources/templates/evento/detalhesEvento.html[m
[36m@@ -10,31 +10,41 @@[m
 [m
       <!--Let browser know website is optimized for mobile-->[m
       <meta name="viewport" content="width=device-width, initial-scale=1.0"/>[m
[32m+[m[41m      [m
[32m+[m[32m      <link rel="stylesheet" href="css/style.css"/>[m
 	</head>[m
 	[m
 	<body>[m
[31m-		<h1>Evento</h1>[m
[31m-		<h3><a href="/eventos" class="waves-effect waves-light btn-large"><i class="material-icons left">add_circle</i>[m
[31m-		Lista de evento</a></h3>[m
[32m+[m	[32m<header>[m
[32m+[m			[32m<nav>[m
[32m+[m				[32m<div class="nav-wrapper nav">[m
[32m+[m					[32m<a href="#" class="brand-logo">Evento</a>[m
[32m+[m					[32m<ul id="nav-mobile" class="right hide-on-med-and-down">[m
[32m+[m						[32m<li><a href="/eventos" class="waves-effect waves-light 