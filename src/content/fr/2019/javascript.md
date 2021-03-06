---
part_number: I
chapter_number: 1
title: JavaScript
description: Chapitre JavaScript du Web Almanac 2019 couvrant la quantité de JavaScript que nous utilisons sur le web, la compression, les bibliothèques et les frameworks, le chargement et les cartographies de code source (source maps).
authors: [housseindjirdeh]
reviewers: [obto, paulcalvano, mathiasbynens]
translators: [borisschapira]
discuss: 1756
results: https://docs.google.com/spreadsheets/d/1kBTglETN_V9UjKqK_EFmFjRexJnQOmLLr-I2Tkotvic/
queries: 01_JavaScript
published: 2019-11-11T00:00:00.000Z
last_updated: 2020-08-25T00:00:00.000Z
---

## Introduction

JavaScript est un langage de script qui permet de construire des expériences interactives et complexes sur le web. Il permet notamment de répondre aux interactions des utilisateurs et utilisatrices, de mettre à jour le contenu dynamique d’une page, etc. Le JavaScript est utilisé partout où il est question de la façon dont une page web doit se comporter lorsqu’un événement se produit.

La spécification du langage elle-même, ainsi que les nombreuses bibliothèques et <span lang="en">frameworks</span> communautaires utilisés par les développeurs du monde entier, ont changé et évolué depuis la création du langage en 1995. Les implémentations et les interpréteurs JavaScript ont également continué à progresser, rendant le langage utilisable dans de nombreux environnements, et pas seulement dans les navigateurs web.

[HTTP Archive](https://httparchive.org/) parcourt [des millions de pages](https://httparchive.org/reports/state-of-the-web#numUrls) chaque mois et les soumet à une instance privée de [WebPageTest](https://webpagetest.org/) pour stocker les informations clés de chaque page (vous pouvez en savoir plus à ce sujet dans notre [méthodologie](./methodology)). Dans le contexte de JavaScript, HTTP Archive fournit des informations détaillées sur l’utilisation du langage pour l’ensemble du web. Ce chapitre regroupe et analyse un grand nombre de ces tendances.

## Combien de JavaScript utilisons-nous&nbsp;?

JavaScript est la ressource la plus consommatrice que nous envoyons aux navigateurs&nbsp;: il doit être téléchargé, analysé, compilé et enfin exécuté. Bien que les navigateurs aient considérablement réduit le temps nécessaire pour analyser et compiler les scripts, [le téléchargement et l’exécution sont devenus les étapes les plus coûteuses](https://v8.dev/blog/cost-of-javascript-2019) lorsque JavaScript est traité par une page web.

Envoyer de plus petits paquets de JavaScript au navigateur est le meilleur moyen de réduire les temps de téléchargement et d’améliorer ainsi les performances des pages. Mais quelle quantité de JavaScript utilisons-nous réellement&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig1.png">
      <img src="/static/images/2019/javascript/fig1.png" alt="Figure 1. Répartition des octets de JavaScript par page." aria-labelledby="fig1-caption" aria-describedby="fig1-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=1974602890&format=interactive">
   </a>
   <div id="fig1-description" class="visually-hidden">Diagramme à barres montrant que 70 octets de JavaScript sont utilisés au 10e percentile, 174 octets au 25e, 373 octets au 50e, 693 octets au 75e et 1093 octets au 90e</div>
   <figcaption id="fig1-caption">Figure 1. Répartition des octets de JavaScript par page.</figcaption>
</figure>

La Figure 1 ci-dessus montre que nous utilisons 373&nbsp;Ko de JavaScript au 50e percentile (aussi appelé médiane). En d’autres termes, 50&nbsp;% des sites envoient plus que cette quantité de JavaScript à leurs utilisateurs.

En regardant ces chiffres, il est naturel de se demander si ce n’est pas trop de JavaScript. Cependant, en termes de performances des pages, l’impact dépend entièrement des connexions réseau et des appareils utilisés. Ce qui nous amène à notre prochaine question&nbsp;: quelle quantité de JavaScript envoyons-nous lorsque nous comparons les tests sur mobiles et sur ordinateurs de bureau&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig2.png">
      <img src="/static/images/2019/javascript/fig2.png" alt="Figure 2. Distribution de JavaScript par page et par type d’appareil." aria-labelledby="fig2-caption" aria-describedby="fig2-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=1914565673&format=interactive">
   </a>
   <div id="fig2-description" class="visually-hidden">Un diagramme à barres montrant que 76 octets&#8239;/&#8239;65 octets de JavaScript sont utilisés au 10e percentile sur ordinateur de bureau et mobile respectivement, 186&#8239;/&#8239;164 octets au 25e, 391&#8239;/&#8239;359 octets au 50e, 721&#8239;/&#8239;668 octets au 75e, et 1&#8239;131&#8239;/&#8239;1&#8239;060 octets au 90e.</div>
   <figcaption id="fig2-caption">Figure 2. Distribution de JavaScript par page et par type d’appareil.</figcaption>
</figure>

À chaque centile, nous envoyons un peu plus de JavaScript aux ordinateurs de bureau qu’aux mobiles.

### Durée de traitement

Après avoir été analysé et compilé, le JavaScript récupéré par le navigateur doit être traité (ou exécuté) avant de pouvoir être utilisé. Les appareils varient, et leur puissance de calcul peut affecter de manière significative la vitesse à laquelle JavaScript peut être traité sur une page. Quels sont les temps de traitement actuels sur le web&nbsp;?

Nous pouvons nous faire une idée en analysant les temps de traitement du fil d’exécution principal pour V8 à différents percentiles&nbsp;:

<figure>
   <a href="/static/images/2019/javascript/fig3.png">
      <img src="/static/images/2019/javascript/fig3.png" alt="Figure 3. Temps de traitement du fil d’exécution principal V8 par appareil." aria-labelledby="fig3-caption" aria-describedby="fig3-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=924000517&format=interactive">
   </a>
   <div id="fig3-description" class="visually-hidden">Un diagramme à barres indiquant que 141&nbsp;ms&#8239;/&#8239;377&nbsp;ms de temps de traitement sont utilisés au 10e percentile sur le bureau et le mobile respectivement, 352&#8239;/&#8239;988&nbsp;ms au 25e, 849&#8239;/&#8239;2&#8239;437&nbsp;ms au 50e, 1&#8239;850&#8239;/&#8239;5&#8239;518&nbsp;ms au 75e, et 3&#8239;543&#8239;/&#8239;10&#8239;735&nbsp;ms au 90e.</div>
   <figcaption id="fig3-caption">Figure 3. Temps de traitement du fil d’exécution principal V8 par appareil.</figcaption>
</figure>

À chaque centile, les délais de traitement sont plus longs pour les pages web testées sur mobiles que pour les pages testées sur ordinateurs de bureau. Le temps total médian du fil d’exécution principal sur ordinateurs de bureau est de 849&nbsp;ms, tandis que sur mobiles, il est plus important&nbsp;: 2&#8239;437&nbsp;ms.

Bien que ces données montrent combien de temps il peut falloir à un appareil mobile pour traiter JavaScript par rapport à un ordinateur de bureau plus puissant, les appareils mobiles varient également en termes de puissance de calcul. Le tableau suivant montre comment les temps de traitement d’une seule page web peuvent varier considérablement selon la catégorie d’appareil mobile.

<figure>
   <a href="/static/images/2019/javascript/js-processing-reddit.png">
      <img src="/static/images/2019/javascript/js-processing-reddit.png" alt="Délais de traitement de JavaScript pour Reddit.com." aria-labelledby="fig4-caption" aria-describedby="fig4-description" width="600" height="363">
   </a>
   <div id="fig4-description" class="visually-hidden">Diagramme à barres montrant 3 appareils différents&nbsp;: en haut, un Pixel 3 présentant une petite portion à la fois sur le fil principal et le fil secondaire de moins de 400&nbsp;ms. Dans le cas du Moto G4, cela représente environ 900&nbsp;ms sur le fil principal et 300&nbsp;ms sur le fil secondaire. La dernière barre est celle d’un Alcatel 1X 5059D avec plus de 2&#8239;000&nbsp;ms sur le fil principal et plus de 500&nbsp;ms sur le fil secondaire.</div>
   <figcaption id="fig4-caption">Figure 4. Délais de traitement de JavaScript pour Reddit.com, issus de <a href="https://v8.dev/blog/cost-of-javascript-2019"><i lang="en">The cost of JavaScript in 2019</i> (en anglais)</a>.</figcaption>
</figure>

### Nombre de requêtes

Une piste à explorer pour analyser la quantité de JavaScript utilisée par les pages web est le nombre de requêtes envoyées. Avec [HTTP/2](./http2), l’envoi de plusieurs petits paquets peut améliorer le chargement des pages par rapport à l’envoi d’un paquet monolithique plus important. Si nous ventilons également par type de matériel, combien de ressources sont récupérées&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig5.png">
      <img src="/static/images/2019/javascript/fig5.png" alt="Figure 5. Répartition de l’ensemble des requêtes JavaScript." aria-labelledby="fig5-caption" aria-describedby="fig5-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=1632335480&format=interactive">
   </a>
   <div id="fig5-description" class="visually-hidden">Le diagramme à barres montrant 4&#8239;/&#8239;4 requêtes sur ordinateurs de bureau et mobiles respectivement sont utilisés au 10e percentile, 10&#8239;/&#8239;9 au 25e, 19&#8239;/&#8239;18 au 50e, 33&#8239;/&#8239;32 au 75e et 53&#8239;/&#8239;52 au 90e.</div>
   <figcaption id="fig5-caption">Figure 5. Répartition de l’ensemble des requêtes JavaScript.</figcaption>
</figure>

À la médiane, 19 requêtes sont envoyées pour les ordinateurs de bureau et 18 pour les mobiles.

### Domaine principal vs parties tierces

Parmi les résultats analysés jusqu’à présent, la totalité du poids des ressources JavaScript et des requêtes ont été considérés. Cependant, dans la majorité des sites web, une partie significative du code JavaScript récupéré et utilisé provient de [parties tierces](./third-parties).

Le JavaScript tiers peut provenir de n’importe quelle source externe, en tierce partie. Les publicités, les outils de télémétrie et les services de médias sociaux sont tous des cas d’utilisation courants dans lesquels des scripts tiers sont utilisés. Cela nous amène naturellement à la question suivante&nbsp;: parmi les requêtes envoyées, combien proviennent de tierces parties et non du domaine principal&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig6.png">
      <img src="/static/images/2019/javascript/fig6.png" alt="Figure 6. Distribution des scripts entre domaine principal et tiers, sur ordinateurs de bureau." aria-labelledby="fig6-caption" aria-describedby="fig6-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=1108490&format=interactive">
   </a>
   <div id="fig6-description" class="visually-hidden">Diagramme à barres montrant 0&#8239;/&#8239;1 requêtes sur ordinateurs de bureau pour le domaine principal et les domaines tiers respectivement au 10e percentile, 2&#8239;/&#8239;4 25e, 6&#8239;/&#8239;10 au 50e, 13&#8239;/&#8239;21 au 75e, et 24&#8239;/&#8239;38 au 90e.</div>
   <figcaption id="fig6-caption">Figure 6. Distribution des scripts entre domaine principal et tiers, sur ordinateurs de bureau.</figcaption>
</figure>

<figure>
   <a href="/static/images/2019/javascript/fig7.png">
      <img src="/static/images/2019/javascript/fig7.png" alt="Figure 7. Distribution des scripts entre domaine principal et tiers, sur mobiles." aria-labelledby="fig7-caption" aria-describedby="fig7-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=998640509&format=interactive">
   </a>
   <div id="fig7-description" class="visually-hidden">Diagramme à barres montrant 0&#8239;/&#8239;1 requêtes sur mobile pour le domaine principal et les domaines tiers respectivement au 10e percentile, 2&#8239;/&#8239;3 au 25e, 5&#8239;/&#8239;9 au 50e, 13&#8239;/&#8239;20 au 75e, et 23&#8239;/&#8239;36 au 90e.</div>
   <figcaption id="fig7-caption">Figure 7. Distribution des scripts entre domaine principal et tiers, sur mobile</figcaption>
</figure>

Tant sur les mobiles que sur les ordinateurs de bureau, les requêtes vers des tierces parties sont plus nombreuses que les requêtes sur le domaine principal, à chaque centile. Si cela vous semble surprenant, découvrons quelle quantité de code téléchargé provient de fournisseurs tiers.

<figure>
   <a href="/static/images/2019/javascript/fig8.png">
      <img src="/static/images/2019/javascript/fig8.png" alt="Figure 8. Répartition de l’ensemble du JavaScript téléchargé sur ordinateurs de bureau." aria-labelledby="fig8-caption" aria-describedby="fig8-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=633945705&format=interactive">
   </a>
   <div id="fig8-description" class="visually-hidden">Diagramme à barres montrant 0&#8239;/&#8239;17 octets de JavaScript téléchargés sur ordinateurs de bureau issus de requêtes vers le domaine principal et, respectivement, vers des domaines tiers, au 10 percentile, 11&#8239;/&#8239;62 au 25e, 89&#8239;/&#8239;232 au 50e, 200&#8239;/&#8239;525 au 75e, et 404&#8239;/&#8239;900 au 90e.</div>
   <figcaption id="fig8-caption">Figure 8. Répartition de l’ensemble du JavaScript téléchargé sur ordinateurs de bureau.</figcaption>
</figure>

<figure>
   <a href="/static/images/2019/javascript/fig9.png">
      <img src="/static/images/2019/javascript/fig9.png" alt="Figure 9. Répartition de l’ensemble du JavaScript téléchargé sur mobile." aria-labelledby="fig9-caption" aria-describedby="fig9-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=1611383649&format=interactive">
   </a>
   <div id="fig9-description" class="visually-hidden">Diagramme à barres montrant 0&#8239;/&#8239;17 octets de JavaScript téléchargés sur mobiles issus de requêtes vers le domaine principal et, respectivement, vers des domaines tiers, au 10e percentile, 6&#8239;/&#8239;54 au 25e, 83&#8239;/&#8239;217 au 50e, 189&#8239;/&#8239;477 au 75e, et 380&#8239;/&#8239;827 au 90e.</div>
   <figcaption id="fig9-caption">Figure 9. Répartition de l’ensemble du JavaScript téléchargé sur mobile.</figcaption>
</figure>

À la médiane, on utilise 89&nbsp;% plus de code tiers que de code du domaine principal rédigé par l’équipe de développement, tant sur mobiles que sur ordinateurs de bureau. Cela montre clairement que le code tiers peut être un des principaux facteurs de lourdeur d’une page web. Pour plus d’informations sur l’impact des tiers, consultez le chapitre [« Tierces Parties »](./third-parties).

## Compression des ressources

Dans le contexte des interactions entre navigateur et serveur, la compression des ressources fait référence au code qui a été transformé à l’aide d’un algorithme de compression des données. Les ressources peuvent être compressées statiquement à l’avance ou à la volée, au moment où le navigateur en fait la demande. Dans les deux cas, la taille de la ressource transférée est considérablement réduite, ce qui améliore les performances de la page.

Il existe de nombreux algorithmes de compression de texte, mais seuls deux sont principalement utilisés pour la compression (et la décompression) des requêtes sur le réseau HTTP&nbsp;:

- [Gzip](https://www.gzip.org/) (gzip)&nbsp;: le format de compression le plus utilisé pour les interactions entre serveurs et clients&nbsp;;
- [Brotli](https://github.com/google/brotli) (br)&nbsp;: un algorithme de compression plus récent visant à améliorer encore les taux de compression. [90&nbsp;% des navigateurs](https://caniuse.com/#feat=brotli) supportent la compression Brotli.

Les scripts compressés devront toujours être décompressés par le navigateur une fois transférés. Cela signifie que son contenu reste le même et que les temps d’exécution ne sont pas du tout optimisés. Cependant, la compression des ressources améliorera toujours leur temps de téléchargement, qui est également l’une des étapes les plus coûteuses du traitement JavaScript. S’assurer que les fichiers JavaScript sont correctement compressés peut constituer un des principaux facteurs d’amélioration des performances pour un site web.

Combien de sites compressent leurs ressources JavaScript&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig10.png">
      <img src="/static/images/2019/javascript/fig10.png" alt="Figure 10. Pourcentage de sites compressant des ressources JavaScript avec gzip ou brotli." aria-labelledby="fig10-caption" aria-describedby="fig10-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=241928028&format=interactive">
   </a>
   <div id="fig10-description" class="visually-hidden">Diagramme à barres montrant que 67&nbsp;%&#8239;/&#8239;65&nbsp;% des ressources JavaScript sont compressées avec gzip sur les ordinateurs de bureau et les mobiles respectivement, et 15&nbsp;%&#8239;/&#8239;14&nbsp;% sont compressées en utilisant Brotli.</div>
   <figcaption id="fig10-caption">Figure 10. Pourcentage de sites compressant des ressources JavaScript avec gzip ou brotli.</figcaption>
</figure>

La majorité des sites compressent leurs ressources JavaScript. L’encodage Gzip est utilisé sur ~64-67&nbsp;% des sites et Brotli sur ~14&nbsp;%. Les taux de compression sont similaires sur ordinateurs de bureau et mobiles.

Pour une analyse plus approfondie sur la compression, reportez-vous au chapitre [« Compression »](./compression).

## Bibliothèques et frameworks ouverts

Parlons ici du code source ouvert (<i lang="en">open source</i>), ou du code sous licence permissive, qui peut être consulté, visualisé et modifié par n’importe qui. Des minuscules bibliothèques aux navigateurs complets, tels que [Chromium](https://www.chromium.org/Home) et [Firefox](https://www.openhub.net/p/firefox), le code source <i lang="en">open source</i> joue un rôle crucial dans le monde du développement web. Dans le contexte de JavaScript, les équipes de développement s’appuient sur des outils <i lang="en">open source</i> pour inclure tous types de fonctionnalités dans leur page web. Qu’un développeur ou une développeuse décide d’utiliser une petite bibliothèque d’utilitaires ou un énorme <i lang="en">framework</i> qui dicte l’architecture de toute son application, le fait de s’appuyer sur du code <i lang="en">open source</i> peut rendre le développement de fonctionnalités plus facile et plus rapide. Quelles sont donc les bibliothèques JavaScript <i lang="en">open source</i> les plus utilisées&nbsp;?

<figure>
   <table>
      <thead>
        <tr>
          <th scope="col">Librairie</th>
          <th scope="col">Ordinateur de bureau</th>
          <th scope="col">Mobile</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>jQuery</td>
          <td class="numeric">85,03&nbsp;%</td>
          <td class="numeric">83,46&nbsp;%</td>
        </tr>
        <tr>
          <td>jQuery Migrate</td>
          <td class="numeric">31,26&nbsp;%</td>
          <td class="numeric">31,68&nbsp;%</td>
        </tr>
        <tr>
          <td>jQuery UI</td>
          <td class="numeric">23,60&nbsp;%</td>
          <td class="numeric">21,75&nbsp;%</td>
        </tr>
        <tr>
          <td>Modernizr</td>
          <td class="numeric">17,80&nbsp;%</td>
          <td class="numeric">16,76&nbsp;%</td>
        </tr>
        <tr>
          <td>FancyBox</td>
          <td class="numeric">7,04&nbsp;%</td>
          <td class="numeric">6,61&nbsp;%</td>
        </tr>
        <tr>
          <td>Lightbox</td>
          <td class="numeric">6,02&nbsp;%</td>
          <td class="numeric">5,93&nbsp;%</td>
        </tr>
        <tr>
          <td>Slick</td>
          <td class="numeric">5,53&nbsp;%</td>
          <td class="numeric">5,24&nbsp;%</td>
        </tr>
        <tr>
          <td>Moment.js</td>
          <td class="numeric">4,92&nbsp;%</td>
          <td class="numeric">4,29&nbsp;%</td>
        </tr>
        <tr>
          <td>Underscore.js</td>
          <td class="numeric">4,20&nbsp;%</td>
          <td class="numeric">3,82&nbsp;%</td>
        </tr>
        <tr>
          <td>prettyPhoto</td>
          <td class="numeric">2,89&nbsp;%</td>
          <td class="numeric">3,09&nbsp;%</td>
        </tr>
        <tr>
          <td>Select2</td>
          <td class="numeric">2,78&nbsp;%</td>
          <td class="numeric">2,48&nbsp;%</td>
        </tr>
        <tr>
          <td>Lodash</td>
          <td class="numeric">2,65&nbsp;%</td>
          <td class="numeric">2,68&nbsp;%</td>
        </tr>
        <tr>
          <td>Hammer.js</td>
          <td class="numeric">2,28&nbsp;%</td>
          <td class="numeric">2,70&nbsp;%</td>
        </tr>
        <tr>
          <td>YUI</td>
          <td class="numeric">1,84&nbsp;%</td>
          <td class="numeric">1,50&nbsp;%</td>
        </tr>
        <tr>
          <td>Lazy.js</td>
          <td class="numeric">1,26&nbsp;%</td>
          <td class="numeric">1,56&nbsp;%</td>
        </tr>
        <tr>
          <td>Fingerprintjs</td>
          <td class="numeric">1,21&nbsp;%</td>
          <td class="numeric">1,32&nbsp;%</td>
        </tr>
        <tr>
          <td>script.aculo.us</td>
          <td class="numeric">0,98&nbsp;%</td>
          <td class="numeric">0,85&nbsp;%</td>
        </tr>
        <tr>
          <td>Polyfill</td>
          <td class="numeric">0,97&nbsp;%</td>
          <td class="numeric">1,00&nbsp;%</td>
        </tr>
        <tr>
          <td>Flickity</td>
          <td class="numeric">0,83&nbsp;%</td>
          <td class="numeric">0,92&nbsp;%</td>
        </tr>
        <tr>
          <td>Zepto</td>
          <td class="numeric">0,78&nbsp;%</td>
          <td class="numeric">1,17&nbsp;%</td>
        </tr>
        <tr>
          <td>Dojo</td>
          <td class="numeric">0,70&nbsp;%</td>
          <td class="numeric">0,62&nbsp;%</td>
        </tr>
      </tbody>
    </table>
   <figcaption>Figure 11. Principales bibliothèques JavaScript sur ordinateurs de bureau et mobiles.</figcaption>
</figure>

[jQuery](https://jquery.com/), la bibliothèque JavaScript la plus populaire jamais créée, est utilisée dans 85,03&nbsp;% des pages sur ordinateurs de bureau et 83,46&nbsp;% des pages mobiles. L’avènement de nombreuses API et fonctionnalités de navigateurs, comme [Fetch](https://developer.mozilla.org/fr/docs/Web/API/Fetch_API) et [querySelector](https://developer.mozilla.org/fr/docs/Web/API/Document/querySelector), a standardisé une grande partie des fonctionnalités fournies par la bibliothèque dans une forme native. Bien que la popularité de jQuery semble en déclin, pourquoi est-il encore utilisé dans la grande majorité du web&nbsp;?

Il y a plusieurs raisons possibles&nbsp;:

- [WordPress](https://wordpress.org/), qui est utilisé par plus de 30&nbsp;% des sites, inclut jQuery par défaut.
- Passer de jQuery à une bibliothèque plus récente côté client peut prendre du temps en fonction de la taille de l’application, et de nombreux sites peuvent utiliser jQuery en plus de bibliothèques plus récentes côté client.

Les autres bibliothèques JavaScript les plus utilisées comprennent les variantes de jQuery (jQuery migrate, jQuery UI), [Modernizr](https://modernizr.com/), [Moment.js](https://momentjs.com/), [Underscore.js](https://underscorejs.org/) et ainsi de suite.

### Frameworks et bibliothèques d'interface

<p class="note">Comme mentionné dans notre <a href="./methodology#wappalyzer">méthodologie</a>, la bibliothèque de détection tierce utilisée dans HTTP Archive (Wappalyzer) a un certain nombre de limitations en ce qui concerne la manière dont elle détecte certains outils. Un ticket est ouvert concernant <a href="https://github.com/AliasIO/wappalyzer/issues/2450">l’amélioration de la détection des bibliothèques et <span lang="en">frameworks</span> JavaScript</a>, ce qui aura eu un impact sur les résultats présentés ici.</p>

Au cours des dernières années, l’écosystème JavaScript a connu une augmentation du nombre de bibliothèques et <span lang="en">frameworks</span> open-source pour faciliter la création d’applications monopages (SPA). Une application monopage se caractérise par une page web qui charge une seule page HTML et utilise JavaScript pour modifier la page lors de l’interaction avec l’utilisateur au lieu de télécharger de nouvelles pages depuis le serveur. Bien que cela reste la principale prémisse des applications monopages, différentes approches de rendu du serveur peuvent encore être utilisées pour améliorer l’expérience de ces sites. Combien de sites utilisent ces types de <span lang="en">frameworks</span>&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig12.png">
      <img src="/static/images/2019/javascript/fig12.png" alt="Figure 12. Frameworks les plus fréquemment utilisés sur ordinateurs de bureau." aria-labelledby="fig12-caption" aria-describedby="fig12-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=1699359221&format=interactive">
   </a>
   <div id="fig12-description" class="visually-hidden">Diagramme à barres montrant que 4,6&nbsp;% des sites utilisent React, 2,0&nbsp;% AngularJS, 1,8&nbsp;% Backbone.js, 0,8&nbsp;% Vue.js, 0,4&nbsp;% Knockout.js, 0,3&nbsp;% Zone.js, 0,3&nbsp;% Angular, 0,1&nbsp;% AMP, 0,1&nbsp;% Ember.js.</div>
   <figcaption id="fig12-caption">Figure 12. <span lang="en">Frameworks</span> les plus fréquemment utilisés sur ordinateurs de bureau.</figcaption>
</figure>

Seul un sous-ensemble de <span lang="en">frameworks</span> populaires est analysé ici, mais il est important de noter que tous suivent l’une ou l’autre de ces deux approches&nbsp;:

- Une architecture [modèle-vue-contrôleur](https://developer.chrome.com/apps/app_frameworks) (ou modèle-vue-vue/modèle)
- Une architecture orientée composants

Bien qu’il y ait eu une évolution vers un modèle basé sur les composants, de nombreux <span lang="en">frameworks</span> plus anciens suivent le paradigme MVC. ([AngularJS](https://angularjs.org/), [Backbone.js](https://backbonejs.org/), [Ember](https://emberjs.com/)) sont toujours utilisées dans des milliers de pages. Cependant, [React](https://reactjs.org/), [Vue](https://vuejs.org/) et [Angular](https://angular.io/) sont les <span lang="en">frameworks</span> à base de composants les plus populaires. ([Zone.js](https://github.com/angular/zone.js) est un module qui fait maintenant partie du noyau Angular).

## Chargement différentiel

[Les modules JavaScript](https://v8.dev/features/modules), ou modules ES, sont supportés par [tous les navigateurs principaux](https://caniuse.com/#feat=es6-module). Les modules offrent la possibilité de créer des scripts qui peuvent être importés et exportés à partir d’autres modules. Cela permet à quiconque de construire ses applications architecturées de manière modulaire, en les important et en les exportant partout où cela est nécessaire, sans avoir recours à des chargeurs de modules en tierce partie.

Pour déclarer un script comme module, la balise script doit avoir l’attribut `type="module"`&nbsp;:

```html
<script type="module" src="main.mjs"></script>
```

Combien de site utilisent `type="module"` sur des scripts dans leurs pages&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig13.png">
      <img src="/static/images/2019/javascript/fig13.png" alt="Figure 13. Pourcentage de sites utilisant type=module." aria-labelledby="fig13-caption" aria-describedby="fig13-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=1409239029&format=interactive">
   </a>
   <div id="fig13-description" class="visually-hidden">Diagramme à barres montrant que 0,6&nbsp;% des sites sur ordinateurs de bureau utilisent <code>type=module</code>, et 0,8&nbsp;% des sites sur mobiles.</div>
   <figcaption id="fig13-caption">Figure 13. Pourcentage de sites utilisant <code>type=module</code>.</figcaption>
</figure>

La prise en charge des modules au niveau du navigateur est encore relativement récente, et les chiffres montrent que très peu de sites utilisent actuellement le `type="module"` pour leurs scripts. De nombreux sites s’appuient encore sur des chargeurs de modules (2,37&nbsp;% de tous les sites sur ordinateurs de bureau utilisent [RequireJS](https://github.com/requirejs/requirejs) par exemple) et des <i lang="en">bundlers</i> ([webpack](https://webpack.js.org/) par exemple) pour définir des modules au sein de leur base de code.

Si des modules natifs sont utilisés, il est important de s’assurer qu’un script de recours approprié est utilisé pour les navigateurs qui ne supportent pas encore les modules. Cela peut être fait en incluant un script supplémentaire avec un attribut `nomodule`.

```html
<script nomodule src="fallback.js"></script>
```

Lorsqu’ils sont utilisés ensemble, les navigateurs qui prennent en charge les modules ignorent complètement tout script contenant l’attribut `nomodule`. En revanche, les navigateurs qui ne supportent pas encore les modules ne téléchargeront aucun script avec l’attribut `type="module"`. Comme ils ne reconnaissent pas non plus `nomodule`, ils téléchargeront normalement les scripts ayant cet attribut. L’utilisation de cette approche peut permettre aux développeurs [d’envoyer du code moderne à des navigateurs modernes pour un chargement plus rapide des pages](https://web.dev/serve-modern-code-to-modern-browsers/). Alors, combien de sites utilisent `nomodule` pour des scripts sur leur page&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig14.png">
      <img src="/static/images/2019/javascript/fig14.png" alt="Figure 14. Pourcentage de sites utilisant nomodule." aria-labelledby="fig14-caption" aria-describedby="fig14-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=781034243&format=interactive">
   </a>
   <div id="fig14-description" class="visually-hidden">Diagramme à barres montrant que 0,8&nbsp;% des sites sur ordinateurs de bureau utilisent "nomodule", et 0,5&nbsp;% des sites sur mobile.</div>
   <figcaption id="fig14-caption">Figure 14. Pourcentage de sites utilisant nomodule.</figcaption>
</figure>

De même, très peu de sites (0,50&nbsp;%-0,80&nbsp;%) utilisent l’attribut `nomodule` pour leurs scripts.

## Preload et prefetch

[Preload](https://developer.mozilla.org/fr/docs/Web/HTML/Pr%C3%A9charger_du_contenu) et [prefetch](https://developer.mozilla.org/fr/docs/Web/HTTP/FAQ_sur_le_pr%C3%A9chargement_des_liens) sont des [Indices de Ressources](./resource-hints) qui permettent d’aider le navigateur à déterminer quelles ressources doivent être téléchargées.

- Le préchargement d’une ressource avec `<link rel="preload">` indique au navigateur de télécharger cette ressource dès que possible. C’est particulièrement utile pour les ressources critiques qui sont découvertes tard dans le processus de chargement de la page (par exemple, du JavaScript situé au bas de votre HTML) et qui seraient, sinon, téléchargées en dernier.
- L’utilisation de `<link rel="prefetch">` indique au navigateur de profiter de tout le temps d’inactivité dont il dispose pour aller chercher ces ressources nécessaires aux navigations futures.

Alors, combien de sites utilisent les directives `preload` et `prefetch`&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig15.png">
      <img src="/static/images/2019/javascript/fig15.png" alt="Figure 15. Pourcentage de sites utilisant rel=preload pour les scripts." aria-labelledby="fig15-caption" aria-describedby="fig15-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=2007534370&format=interactive">
   </a>
   <div id="fig15-description" class="visually-hidden">Diagramme à barres montrant que 14&nbsp;% des sites sur ordinateurs de bureau utilisent <code>rel=preload</code> pour les scripts, et 15&nbsp;% des sites sur mobiles.</div>
   <figcaption id="fig15-caption">Figure 15. Pourcentage de sites utilisant <code>rel=preload</code> pour les scripts.</figcaption>
</figure>

Sur tous les sites mesurés par HTTP Archive, 14,33&nbsp;% des sites sur ordinateurs de bureau et 14,84&nbsp;% des sites sur mobiles utilisent `<link rel="preload">` pour des scripts de leur page.

Pour `prefetch`, les chiffres sont les suivants&nbsp;:

<figure>
   <a href="/static/images/2019/javascript/fig16.png">
      <img src="/static/images/2019/javascript/fig16.png" alt="Figure 16. Pourcentage de sites utilisant rel=prefetch pour les scripts." aria-labelledby="fig16-caption" aria-describedby="fig16-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=547807937&format=interactive">
   </a>
   <div id="fig16-description" class="visually-hidden">Diagramme à barres montrant que 0,08&nbsp;% des sites sur ordinateurs de bureau utilisent <code>rel=prefetch</code>, et 0,08&nbsp;% des sites sur mobiles.</div>
   <figcaption id="fig16-caption">Figure 16. Pourcentage de sites utilisant <code>rel=prefetch</code> pour les scripts.</figcaption>
</figure>

Sur mobiles comme sur ordinateurs de bureau, 0,08&nbsp;% des pages utilisent la directive `prefetch` pour au moins un de leurs scripts.

## API plus récentes

JavaScript continue d’évoluer en tant que langage. Une nouvelle version de la norme de langage elle-même, connue sous le nom d’ECMAScript, est publiée chaque année avec de nouvelles API et comprend des fonctionnalités qui franchissent les étapes de proposition pour devenir une partie du langage lui-même.

Grâce à HTTP Archive, nous pouvons examiner toute nouvelle API prise en charge (ou sur le point de l’être) et voir à quel point son utilisation est répandue. Ces API peuvent déjà être utilisées dans les navigateurs qui les prennent en charge _ou_ avec un <i lang="en">polyfill</i> d’accompagnement pour s’assurer qu’elles fonctionnent quel que soit le navigateur.

Combien de sites utilisent les API suivantes&nbsp;?

- [Atomics](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Objets_globaux/Atomics)
- [Intl](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Objets_globaux/Intl)
- [Proxy](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Objets_globaux/Proxy)
- [SharedArrayBuffer](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Objets_globaux/SharedArrayBuffer)
- [WeakMap](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Objets_globaux/WeakMap)
- [WeakSet](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference/Objets_globaux/WeakSet)

<figure>
   <a href="/static/images/2019/javascript/fig17.png">
      <img src="/static/images/2019/javascript/fig17.png" alt="Figure 17. Utilisation de nouvelles API JavaScript." aria-labelledby="fig17-caption" aria-describedby="fig17-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=594315296&format=interactive">
   </a>
   <div id="fig17-description" class="visually-hidden">Diagramme à barres montrant que 25,5&nbsp;%&#8239;/&#8239;36,2&nbsp;% des sites sur ordinateurs de bureau et, respectivement, sur mobile, utilisent WeakMap, 6,1&nbsp;%&#8239;/&#8239;17,2&nbsp;% utilisent WeakSet, 3,9&nbsp;%&#8239;/&#8239;14,0&nbsp;% utilisent Intl, 3,9&nbsp;%&#8239;/&#8239;4,4&nbsp;% utilisent Proxy, 0,4&nbsp;%&#8239;/&#8239;0,4&nbsp;% utilisent Atomics, et 0,2&nbsp;%&#8239;/&#8239;0,2&nbsp;% utilisent SharedArrayBuffer.</div>
   <figcaption id="fig17-caption">Figure 17. Utilisation de nouvelles API JavaScript.</figcaption>
</figure>

Atomics (0,38&nbsp;%) et SharedArrayBuffer (0,20&nbsp;%) sont à peine visibles sur ce graphique dans la mesure où ils sont utilisés sur un très petit nombre de pages.

Il est important de noter que les chiffres indiqués ici sont des approximations et qu’ils ne s’appuient pas sur [UseCounter](https://chromium.googlesource.com/chromium/src.git/+/master/docs/use_counter_wiki.md) pour mesurer l’utilisation des fonctionnalités.

## Cartographies de code source (source maps)

Dans de nombreux moteurs de compilation, les fichiers JavaScript subissent une minification afin de minimiser leur taille et une transpilation pour les nouvelles fonctionnalités du langage qui ne sont pas encore prises en charge par de nombreux navigateurs. Par ailleurs, les surensembles de langage comme [TypeScript](https://www.typescriptlang.org/) se compilent en un résultat qui peut être sensiblement différent du code source original. Pour toutes ces raisons, le code final servi au navigateur peut être illisible et difficile à déchiffrer.

Une cartographie de code source, ou **sourcemap** est un fichier supplémentaire accompagnant un fichier JavaScript qui permet à un navigateur de faire correspondre la version finale à sa source d’origine. Cela peut rendre le débogage et l’analyse des <i lang="en">bundles</i> de production beaucoup plus simples.

Bien qu’utile, il existe un certain nombre de raisons pour lesquelles de nombreux sites peuvent ne pas vouloir inclure de cartographie des sources dans leur site de production final, par exemple en choisissant de ne pas exposer le code source complet au public. Combien de sites incluent donc réellement des sourcemaps&nbsp;?

<figure>
   <a href="/static/images/2019/javascript/fig18.png">
      <img src="/static/images/2019/javascript/fig18.png" alt="Figure 18. Pourcentage de sites utilisant des source maps." aria-labelledby="fig18-caption" aria-describedby="fig18-description" width="600" height="371" data-width="600" data-height="371" data-seamless data-frameborder="0" data-scrolling="no" data-iframe="https://docs.google.com/spreadsheets/d/e/2PACX-1vTpzDb9HGbdVvin6YPTOmw11qBVGGysltxmH545fUfnqIThAq878F_b-KxUo65IuXaeFVSnlmJ5K1Dm/pubchart?oid=906754154&format=interactive">
   </a>
   <div id="fig18-description" class="visually-hidden">Diagramme à barres montrant que 18&nbsp;% des sites sur ordinateurs de bureau et 17&nbsp;% des sites sur mobiles utilisent des <i lang="en">source maps</i>.</div>
   <figcaption id="fig18-caption">Figure 18. Pourcentage de sites utilisant des <i lang="en">source maps</i>.</figcaption>
</figure>

Les résultats sont à peu près les mêmes pour les pages sur ordinateurs de bureau et les pages sur mobiles. 17-18&nbsp;% incluent un sourcemap pour au moins un script sur la page (détecté comme un script du domaine principal avec `sourceMappingURL`).

## Conclusion

L’écosystème JavaScript continue de changer et d’évoluer chaque année. Nous verront toujours apparaitre des API plus récentes, des moteurs de navigation améliorés, de nouvelles bibliothèques ou <span lang="en">frameworks</span>. HTTP Archive nous fournit des informations précieuses sur la façon dont les sites utilisent le langage sur le terrain.

Sans JavaScript, le web ne serait pas là où il est aujourd’hui, et toutes les données recueillies pour cet article ne font que le prouver.
