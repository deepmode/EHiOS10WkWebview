//
//  ViewController.swift
//  iOS10WkWebview
//
//  Created by Eric Ho on 19/8/2016.
//  Copyright © 2016 Eric Ho. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    
    var webContentCell:UITableViewCell?
    @IBOutlet var tableView:UITableView!
    
    var webView:WKWebView!
    
    private var topPaddingConstraint:NSLayoutConstraint!
    private var bottomPaddingConstraint:NSLayoutConstraint!
    private var leadingPaddingConstraint:NSLayoutConstraint!
    private var trailingPaddingConstraint:NSLayoutConstraint!
    
    let fallBackLink = "https://hypebeast.com/2017/1/yeezy-boost-350-v2-black-red-official-store-list-384"
    
    let begin = "<!DOCTYPE html><html><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0\"><link rel=\"stylesheet\" href=\"https://d2gkwoflhw8cr8.cloudfront.net/bundles/hypebeasteditorial/app/main.css?1486090146\"></head><body class=\"is-app\">"
    let end = "</body></html>"
    let content = "<p>For those who missed out on the first time Kanye West&#8217;s shoe donned a Black and Red colorway during <a href=\"https://hypebeast.com/2016/11/yeezy-boost-350-v2-copper-green-red\">Black Friday</a>, adidas Originals has just released the official store list for the second &#8220;Black/Red&#8221; V2 to hit shelves. <a href=\"https://hypebeast.com/2017/1/adidas-yeezy-boost-350-v2-black-red-official-release-date-833\">As you&#8217;re aware</a>, this iteration has the red striped deleted to only showcase the &#8220;SPLY-350&#8243; lettering on the lateral sides, and the interesting return of the rear heel loop as seen previously on the V1 set of YEEZY BOOST 350s. Infant sizes also will release alongside the adult editions, so the whole family can enjoy the hype that the Three Stripes and Ye has created for the community. What&#8217;s also returning from the V1 apparently is the stock numbers, so be prepared to camp out for these if you want your size.</p>\n<p>See the official store list below courtesy of <a href=\"http://www.adidas.com/yeezy\">adidas.com/yeezy</a>. The shoe is now live for sign up on the adidas Confirmed app with reservations opening February 8, while physical retailers and adidas.com will begin selling the shoe on February 11.</p>\n<h2>Argentina</h2>\n<p><strong>adidas Originals Store Malabia</strong><br />\nMalabia 1720 endclo<br />\nBuenos Aires</p>\n<h2>Australia</h2>\n<p><strong>USG</strong><br />\nMyer Centre Promenade<br />\nAdelaide</p>\n<p><strong>Foot Locker</strong><br />\n190 Albert Street<br />\nBrisbane</p>\n<p><strong>adidas Originals Store Emporium Melbourne</strong><br />\n287 Lonsdale Street<br />\nMelbourne</p>\n<p><strong>adidas Originals Store Melbourne Chadstone</strong><br />\n1341 Dandenong Rd<br />\nMelbourne</p>\n<p><strong>Foot Locker</strong><br />\n1341 Dandenong Rd<br />\nMelbourne</p>\n<p><strong>Incu Mens</strong><br />\n274 Flinders Lane<br />\nMelbourne</p>\n<p><strong>Sneakerboy</strong><br />\n265 Little Bourke Street<br />\nMelbourne</p>\n<p><strong>Up There</strong><br />\nLevel 1/15 McKillop Street<br />\nMelbourne</p>\n<p><strong>Highs &#038; Lows</strong><br />\n1/672 Beaufort Street<br />\nMt Lawley</p>\n<p><strong>Cabinet Noir</strong><br />\n14/872-884 Hay Street<br />\nPerth</p>\n<p><strong>Highs &#038; Lows</strong><br />\n74-76 King Street<br />\nPerth</p>\n<p><strong>adidas Originals</strong><br />\n1 Anderson St<br />\nSydney</p>\n<p><strong>adidas Originals Store Westfield Sydney City</strong><br />\nWestfield Sydney, 188 Pitt Street<br />\nSydney</p>\n<p><strong>Espionage</strong><br />\n22-26 Goulburn Street<br />\nSydney</p>\n<p><strong>Foot Locker</strong><br />\n580 George St<br />\nSydney</p>\n<p><strong>Incu</strong><br />\n19-20/500 George St<br />\nSydney</p>\n<p><strong>Sneakerboy</strong><br />\n3 Tempernace Lane<br />\nSydney</p>\n<h2>Austria</h2>\n<p><strong>Foot Locker</strong><br />\nMariahilferstrasse 104<br />\nVienna</p>\n<p><strong>The 6th Floor</strong><br />\nKaerntner Strasse 19<br />\nVienna</p>\n<h2>Belgium</h2>\n<p><strong>adidas Originals Store Antwerp</strong><br />\nKammenstraat 45<br />\nAntwerp</p>\n<p><strong>Avenue</strong><br />\nIjzerenwaag 1<br />\nAntwerp</p>\n<p><strong>Monar &#038; Clothes</strong><br />\nEverdijstraat 35<br />\nAntwerp</p>\n<p><strong>Renaissance</strong><br />\nNationalestraat 32<br />\nAntwerp</p>\n<p><strong>Panthers Brussel</strong><br />\nRue Adolphe Max 3<br />\nBrussels</p>\n<p><strong>Hunting and Collecting</strong><br />\nRue des Chartreux 17<br />\nBrussels</p>\n<p><strong>La Créme</strong><br />\nRue Lesbroussart 43a<br />\nBrussels</p>\n<p><strong>Smets Concept Store</strong><br />\nRue de Namur 68<br />\nBrussels</p>\n<h2>Brazil</h2>\n<p><strong>adidas Originals Store Ipanema</strong><br />\nR. Garcia D´ávila, 66B<br />\nRio de Janeiro</p>\n<p><strong>adidas Originals Store Oscar Freire</strong><br />\nRua Oscar Freire, 678<br />\nSao Paulo</p>\n<p><strong>Cartel 011</strong><br />\nAv. Pres. Juscelino Kubitschek, 2041<br />\nSao Paulo</p>\n<h2>Canada</h2>\n<p><strong>Foot Locker</strong><br />\n4700 Kingsway Unit 115<br />\nBurnaby</p>\n<p><strong>Foot Locker</strong><br />\n8882 &#8211; 170th Street<br />\nEdmonton</p>\n<p><strong>Rchmnd</strong><br />\n1876 Hollis St.<br />\nHalifax</p>\n<p><strong>SAM TABAK</strong><br />\n915 Rue Notre Dame<br />\nLachine</p>\n<p><strong>Solestop</strong><br />\n179 Enterprise BLVD<br />\nMarkham</p>\n<p><strong>Foot Locker</strong><br />\n100 City Centre Dr.10<br />\nMississauga</p>\n<p><strong>adidas Originals Store Montreal</strong><br />\n1238 Ste-Catherine Ouest<br />\nMontreal</p>\n<p><strong>Exclucity</strong><br />\n1326 Rue Notre-Dame O<br />\nMontreal</p>\n<p><strong>Foot Locker</strong><br />\n900 STE CATHERINES ST<br />\nMontreal</p>\n<p><strong>Influence U</strong><br />\n1476 Saint Catherine St W<br />\nMontreal</p>\n<p><strong>Off The Hook Boutique</strong><br />\n421 rue Saint-Vincent<br />\nMontreal</p>\n<p><strong>Off The Hook Boutique</strong><br />\n1021 Ste Catherine Ouest<br />\nMontreal</p>\n<p><strong>NRML</strong><br />\n184 Rideau Street<br />\nOttawa</p>\n<p><strong>NRML Select</strong><br />\n318 Richmond Road<br />\nOttawa</p>\n<p><strong>adidas Originals Store Toronto</strong><br />\n389 Queen Street West<br />\nToronto</p>\n<p><strong>Capsule</strong><br />\n69 YORKVILLE AVENUE<br />\nToronto</p>\n<p><strong>Champs Sports</strong><br />\n3401 Dufferin Street<br />\nToronto</p>\n<p><strong>Champs Sports</strong><br />\n220 Yonge Street<br />\nToronto</p>\n<p><strong>Champs Sports</strong><br />\n340 YONGE STREET SOUTH<br />\nToronto</p>\n<p><strong>Exclucity</strong><br />\n552 Queen St W<br />\nToronto</p>\n<p><strong>Foot Locker</strong><br />\n220 Yonge St.<br />\nToronto</p>\n<p><strong>Foot Locker</strong><br />\n3401 Dufferin Street<br />\nToronto</p>\n<p><strong>Foot Locker</strong><br />\n247 Yonge Street<br />\nToronto</p>\n<p><strong>Haven</strong><br />\n145 Berkeley Street<br />\nToronto</p>\n<p><strong>Livestock</strong><br />\n406 Roncesvailles Avenue<br />\nToronto</p>\n<p><strong>Livestock</strong><br />\n116 Spadina Avenue<br />\nToronto</p>\n<p><strong>Nomad</strong><br />\n819 Queen St W<br />\nToronto</p>\n<p><strong>adidas Originals Store Vancouver</strong><br />\n848 Granville Street<br />\nVancouver</p>\n<p><strong>Foot Locker</strong><br />\n919 ROBSON STREET UNIT #919A &#038; 919B<br />\nVancouver</p>\n<p><strong>Haven</strong><br />\n52 East Cordova Street<br />\nVancouver</p>\n<p><strong>Livestock</strong><br />\n141 East Pender St.<br />\nVancouver</p>\n<h2>Chile</h2>\n<p><strong>adidas Originals Arauco Maipu</strong><br />\nAv. Americo Vespucio 399<br />\nSantiago</p>\n<p><strong>adidas Originals Costanera</strong><br />\nAvenida Andres Bello 2447<br />\nSantiago</p>\n<p><strong>adidas Originals Plaza Vespucio</strong><br />\nVicuña Mackenna 7110<br />\nSantiago</p>\n<p><strong>Bold</strong><br />\nAv. Pdte. Kennedy, No. 5413<br />\nSantiago</p>\n<h2>China</h2>\n<p><strong>adidas Beijing Brand Center SLT</strong><br />\n19 Sanlitun Road<br />\nBeijing</p>\n<p><strong>adidas Originals Store Beijing Guomao</strong><br />\n119A+B Jianguomenwai Ave<br />\nBeijing</p>\n<p><strong>adidas Originals Store Beijing Oriental Plaza</strong><br />\n1 Chang´an East Street<br />\nBeijing</p>\n<p><strong>adidas Originals Store Beijing The Place</strong><br />\n9 Guanghua Rd<br />\nBeijing</p>\n<p><strong>Beijing Solana (SWC)</strong><br />\nF1/F2,Building15,No.6, Chaoyang Road, Chaoyang District, Beijing<br />\nBeijing</p>\n<p><strong>Deal</strong><br />\n39 Dongda Street<br />\nBeijing</p>\n<p><strong>EXI.T</strong><br />\n1F, Parkview Green Fangcaodi<br />\nBeijing</p>\n<p><strong>Foss Gallery</strong><br />\nLG1-26Parkview Green Fangcaodi<br />\nBeijing</p>\n<p><strong>Juice Beijing</strong><br />\nUnit S8-15, Tower 8, No.19 Sanlitum Road<br />\nBeijing</p>\n<p><strong>Soulgoods</strong><br />\n1-12,Tongying Centre, Sunlitun<br />\nBeijing</p>\n<p><strong>adidas Store Changchun Hongqi St. Wanda</strong><br />\n1st floor, Hongqi Street No.616 Wanda Plaza,Chaoyang District, Changchun<br />\nChangchun</p>\n<p><strong>adidas Originals Store Chengdu Raffles</strong><br />\nB102&#038;B103, No 3, Raffles Square, 4th section of South Renmin road, Chengdu<br />\nChengdu</p>\n<p><strong>adidas Store Chengdu Global Center SWC</strong><br />\n1FC02，2FC06/08/10,Chengdu Global Center,No.1700 Tianfu Avenue,Chengdu<br />\nChengdu</p>\n<p><strong>Chengdu Swire Mega Store</strong><br />\nNo.8, Zhong Shamao Street<br />\nChengdu</p>\n<p><strong>Juice Chengdu</strong><br />\nUnit2222, L2, Taikoo Li, #8 Shamao Street, Jinjiang District<br />\nChengdu</p>\n<p><strong>Lane Crawford</strong><br />\n4th Floor IFS Hong Xin Road<br />\nChengdu</p>\n<p><strong>adidas Originals Store</strong><br />\nNo.6-8, Yanghe Road<br />\nChongqing</p>\n<p><strong>adidas Store Chongqing</strong><br />\nNo250 bayi rd<br />\nChongqing</p>\n<p><strong>Unik</strong><br />\n495 Gaoerji Road<br />\nDalian</p>\n<p><strong>adidas Originals</strong><br />\nNO.B114 ground floor Parc central plaza.Tianhe Road<br />\nGuangzhou</p>\n<p><strong>adidas Store Kunming Carnival Walk Mall</strong><br />\nKunming guandu area caiyunbei road 3567<br />\nKunming</p>\n<p><strong>adidas Originals Store Nanjing Deji Plaza</strong><br />\n18 Zhongshan Rd<br />\nNanjing</p>\n<p><strong>adidas Store Nanjing Kingfeng Plaza (SWC)</strong><br />\nF228-229 NO#1698, Shuanglong Avenue ,Jiangning District, Nanjing<br />\nNanjing</p>\n<p><strong>adidas Brand Center Shanghai HHL</strong><br />\nNo.691 Huai Hai Rd (M)<br />\nShanghai</p>\n<p><strong>adidas Originals Jia Hotel</strong><br />\nNo.939 West Nanjing Rd<br />\nShanghai</p>\n<p><strong>adidas Originals Store Shanghai Super Brand Mall</strong><br />\n168 West Lujiazui Rd<br />\nShanghai</p>\n<p><strong>adidas Store Shanghai Crystal Galleria</strong><br />\nNo.68,Yuyuan Road<br />\nShanghai</p>\n<p><strong>adidas Store Shanghai Global Harbour</strong><br />\nL2001-2003, Global Harbor, No 3300, North Zhongshan Road<br />\nShanghai</p>\n<p><strong>adidas Store Shanghai Hongqiao the Hub</strong><br />\nGF11-12, No 688 Hongqiao the hub, Shenchang Road, Minhang District, Shanghai<br />\nShanghai</p>\n<p><strong>DOE</strong><br />\n88 Tongren Road<br />\nShanghai</p>\n<p><strong>Foss Gallery</strong><br />\n845 Julu Road<br />\nShanghai</p>\n<p><strong>Glossy</strong><br />\n1F, Xintiandi, #123, Xingye Rd<br />\nShanghai</p>\n<p><strong>I.T</strong><br />\nL1 101, 118, 120/ L2 201 155-160, Citic Square,#1168 West Nanjing Road<br />\nShanghai</p>\n<p><strong>J01</strong><br />\n#158-2, Xinle Rd<br />\nShanghai</p>\n<p><strong>Juice</strong><br />\n832 Julu Road<br />\nShanghai</p>\n<p><strong>Lane Crawford</strong><br />\n#99 Middle Huai Hai Road<br />\nShanghai</p>\n<p><strong>WZK</strong><br />\n#2-110/115/116, #99 Jiangbin Rd<br />\nShanghai</p>\n<p><strong>Unik</strong><br />\n1F, #6 Chaoyang Rd<br />\nShenyang</p>\n<p><strong>adidas Originals Store Shenzhen CoCo Park</strong><br />\nFuhua San Rd<br />\nShenzhen</p>\n<p><strong>adidas Store Wuhan Han street</strong><br />\nHanstreet wandaplaza district2  J3-6-22,WuchangDistrict, Wuhan, Hubei<br />\nWuhan</p>\n<p><strong>WH101</strong><br />\n#77 Dongting Road<br />\nWuhan</p>\n<h2>Colombia</h2>\n<p><strong>adidas Originals Store Calle 82</strong><br />\nCalle 82 # 13-26<br />\nBogota</p>\n<p><strong>adidas Store Calle 122</strong><br />\nCalle 122 # 15a-55<br />\nBogota</p>\n<p><strong>adidas Originals Store El Tesoro</strong><br />\nCarrera 25 a, 1a- Sur 45<br />\nMedellín</p>\n<h2>Cyprus</h2>\n<p><strong>First Boutique</strong><br />\nIakovou Tompazi 1<br />\nLimassol</p>\n<h2>Czech Republic</h2>\n<p><strong>Footshop</strong><br />\nBubenská 1<br />\nPraha 7</p>\n<h2>Denmark</h2>\n<p><strong>Stoy Munkholm</strong><br />\nStore Torv 4<br />\nAarhus</p>\n<p><strong>Wood Wood Aarhus</strong><br />\nGuldsmedgade 22B<br />\nAarhus</p>\n<p><strong>Naked</strong><br />\nPilestræde 46<br />\nCopenhagen</p>\n<p><strong>Norse Project</strong><br />\nPilestræde 41<br />\nCopenhagen</p>\n<p><strong>Rezet</strong><br />\nRådhusstræde 7<br />\nCopenhagen</p>\n<p><strong>size?</strong><br />\nKøbmagergade 47<br />\nCopenhagen</p>\n<p><strong>Storm</strong><br />\nStore Regnegade 1<br />\nCopenhagen</p>\n<p><strong>Wood Wood</strong><br />\nGrønnegade 1<br />\nCopenhagen</p>\n<h2>Finland</h2>\n<p><strong>Beamhill</strong><br />\nYliopistonkatu 5<br />\nHelsinki</p>\n<h2>France</h2>\n<p><strong>Acte 2</strong><br />\n9 Place Crillon<br />\nAvignon</p>\n<p><strong>Le Rayon Frais</strong><br />\n11-15 Rue Saint-James<br />\nBordeaux</p>\n<p><strong>Le Buzz Lab</strong><br />\n18 Rue De La Clef<br />\nLille</p>\n<p><strong>Shoes Gallery &#8211; Dope</strong><br />\n15 B Rue d´Algérie<br />\nLyon</p>\n<p><strong>Summer</strong><br />\n1, Place Gailleton<br />\nLyon</p>\n<p><strong>Corner Street</strong><br />\n30 Rue de Rome<br />\nMarseille</p>\n<p><strong>Impact</strong><br />\n18 Rue des Boulangers<br />\nMulhouse</p>\n<p><strong>Impact</strong><br />\n15 Rue de Lépante<br />\nNice</p>\n<p><strong>adidas Originals Store Paris</strong><br />\n3 Rue des Rosiers<br />\nParis</p>\n<p><strong>adidas CONFIRMED0600110024</strong><br />\nCitadium<br />\n56 rue de Caumartin<br />\nParis</p>\n<p><strong>colette</strong><br />\n213 Rue Saint-Honoré<br />\nParis</p>\n<p><strong>Foot Locker</strong><br />\n4-6 Rue Pierre Lescot<br />\nParis</p>\n<p><strong>Le HUB Bastille</strong><br />\n2 rue du Faubourg Saint Antoine<br />\nParis</p>\n<p><strong>Les Galeries Lafayette</strong><br />\n40, Boulevard Hausmann<br />\nParis</p>\n<p><strong>N°42</strong><br />\n42 Rue de Sévigné<br />\nParis</p>\n<p><strong>Shinzo</strong><br />\n39 rue Etienne Marcel<br />\nParis</p>\n<p><strong>size?</strong><br />\n18 rue Berger<br />\nParis</p>\n<p><strong>SNEAKERSNSTUFF</strong><br />\n95 Rue Réaumur,<br />\nParis</p>\n<p><strong>Starcow</strong><br />\n62 Rue Saint Honoré<br />\nParis</p>\n<h2>Germany</h2>\n<p><strong>adidas Originals Store Berlin, Muenzstrasse</strong><br />\nMuenzstrasse 13-15<br />\nBerlin</p>\n<p><strong>Foot Locker</strong><br />\nTauentzienstrasse 18A<br />\nBerlin</p>\n<p><strong>JD Sports</strong><br />\nTauentzienstrasse 16<br />\nBerlin</p>\n<p><strong>No74</strong><br />\nTorstrasse 74<br />\nBerlin</p>\n<p><strong>Overkill GmbH</strong><br />\nKoepenicker Strasse 195 A<br />\nBerlin</p>\n<p><strong>Solebox</strong><br />\nNuernbergerstrasse 16<br />\nBerlin</p>\n<p><strong>SOTO Berlin</strong><br />\nTorstraße 72<br />\nBerlin</p>\n<p><strong>Voo Store</strong><br />\nOranienstraße 24<br />\nBerlin</p>\n<p><strong>Wood Wood</strong><br />\nRochstr. 4<br />\nBerlin</p>\n<p><strong>size?</strong><br />\nHohestrasse 160 &#8211; 168<br />\nCologne</p>\n<p><strong>Asphaltgold</strong><br />\nFriedenspl. 4<br />\nDarmstadt</p>\n<p><strong>Afew-Store</strong><br />\nOststrasse 36<br />\nDuesseldorf</p>\n<p><strong>Uebervart</strong><br />\nKleiner Hirschgraben 14<br />\nFrankfurt</p>\n<p><strong>Foot Locker</strong><br />\nZeil 83<br />\nFrankfurt/Zeil</p>\n<p><strong>43einhalb</strong><br />\nPeterstor 7<br />\nFulda</p>\n<p><strong>Allike</strong><br />\nVirchowstraße 2<br />\nHamburg</p>\n<p><strong>Glory Hole</strong><br />\nMarktstrasse 145<br />\nHamburg</p>\n<p><strong>Snipes</strong><br />\nMönckebergstr. 25<br />\nHamburg</p>\n<p><strong>Snipes</strong><br />\nHohe Str. 100 &#8211; 102<br />\nKöln</p>\n<p><strong>The Good Will Out</strong><br />\nHändelstraße 41<br />\nKöln</p>\n<p><strong>Solebox</strong><br />\nAltheimer Eck 6<br />\nMuenchen</p>\n<p><strong><br />\nPool Fashion</strong><br />\nMaximilianstraße 11<br />\nMunchen</p>\n<p><strong>Beastin GmbH &#038; Stolte GbR</strong><br />\nAmalienstr. 44<br />\nMünchen</p>\n<p><strong>Foot Locker</strong><br />\nNeuhauserstrasse 41<br />\nMünchen</p>\n<p><strong>Snipes</strong><br />\nNeuhauser Straße 3a<br />\nMünchen</p>\n<p><strong>Newseum by Crämer and Co.</strong><br />\nBreite G. 18<br />\nNuremberg</p>\n<p><strong>Suppa</strong><br />\nPaulinenstr. 44<br />\nStuttgart</p>\n<h2>Greece</h2>\n<p><strong>Phat Soles</strong><br />\n27 &#8211; 29 Dimarchou Angelou Metaxa<br />\nAthens</p>\n<p><strong>Simple Caractere</strong><br />\n23 Kiriazi Str<br />\nAthens</p>\n<p><strong>Device1</strong><br />\nP. Mela 38<br />\nThessaloniki</p>\n<h2>Hong Kong</h2>\n<p><strong>adidas Brand Center</strong><br />\nNo. 36 Queen´s Road, Central<br />\nHong Kong</p>\n<p><strong>adidas Originals Store Hong Kong Causeway Bay</strong><br />\n6 Kingston Street<br />\nHong Kong</p>\n<p><strong>adidas Store Hong Kong Tsim Sha Tsui Ocean Terminal</strong><br />\n27 Canton Road<br />\nHong Kong</p>\n<p><strong>D-MOP/ J-01</strong><br />\nNo.56-58 Wellington Street<br />\nHong Kong</p>\n<p><strong>EXI.T Hysan One</strong><br />\n1 Hysan Avenue<br />\nHong Kong</p>\n<p><strong>EXI.T Silevercord</strong><br />\nShop LG31, Silvercord<br />\nHong Kong</p>\n<p><strong>Juice</strong><br />\n9-11 Cleveland Street<br />\nHong Kong</p>\n<p><strong>SWC</strong><br />\nShop 4102, Level 4, Gateway Arcade, Harbour City, Tsimshatsui, Hong Kong<br />\nHong Kong</p>\n<h2>Hungary</h2>\n<p><strong>Icons by Bizanc</strong><br />\nPetofi Sandor Utca 20<br />\nBudapest</p>\n<h2>Iceland</h2>\n<p><strong>Húrra</strong><br />\nHverfisgata 50<br />\nReykjavik</p>\n<h2>Indonesia</h2>\n<p><strong>adidas Store Neo Soho</strong><br />\nJalan Letjen. S. Parman Kav. 28<br />\nJakarta</p>\n<p><strong>Goods Dept</strong><br />\nJl. MH. Thamrin No. 28 &#8211; 30<br />\nJakarta</p>\n<h2>Ireland</h2>\n<p><strong>Brown Thomas</strong><br />\n88 &#8211; 95 Grafton Street<br />\nDublin</p>\n<p><strong>JD</strong><br />\n43-44 Mary Street<br />\nDublin</p>\n<p><strong>size?</strong><br />\n26 Wiklow Street<br />\nDublin</p>\n<h2>Italy</h2>\n<p><strong>Sugar</strong><br />\nCorso Italia 19,<br />\nArezzo</p>\n<p><strong>Backdoor</strong><br />\nPiazza Galileo Galilei 3A<br />\nBologna</p>\n<p><strong>Rail</strong><br />\nVia S. Martino della Battaglia, 5a<br />\nBrescia</p>\n<p><strong>Papini</strong><br />\nCorso Italia, 78<br />\nCatania</p>\n<p><strong>Eraldo</strong><br />\nVia Roma 87<br />\nCeggia</p>\n<p><strong>SlamJam Ferrara<br />\n</strong>Via Canonica, 12 int. 3/5<br />\nFerrara</p>\n<p><strong>Luisa via Roma<br />\n</strong>Via Roma 19/21r<br />\nFlorence</p>\n<p><strong>Sotf</strong><br />\nvia de´ tornabuoni 17/r<br />\nFlorence</p>\n<p><strong>Susi Store<br />\n</strong>via Viale Umberto I<br />\nLatina</p>\n<p><strong>Vinicio</strong><br />\nVia Felice Musazzi, 2, Legnano MI<br />\nLegnano</p>\n<p><strong>Bernardelli</strong><br />\nPiazza Guglielmo Marconi 27<br />\nMantova</p>\n<p><strong>adidas Originals Store Milan</strong><br />\nVia Tocqueville 11<br />\nMilan</p>\n<p><strong>AW Lab</strong><br />\nVIA TORINO, 22<br />\nMilan</p>\n<p><strong>Julian Fashion</strong><br />\nViale G. Matteotti, 31<br />\nMilan</p>\n<p><strong>Par5</strong><br />\nVia Pio IV 1<br />\nMilan</p>\n<p><strong>size?</strong><br />\nVia Torino 49<br />\nMilan</p>\n<p><strong>Antonia</strong><br />\nVIA CUSANI 5<br />\nMilano</p>\n<p><strong>Antonioli</strong><br />\nVia Pasquale Paoli 1<br />\nMilano</p>\n<p><strong>Excelsior</strong><br />\nGalleria del Corso, 4<br />\nMilano</p>\n<p><strong>Foot Locker</strong><br />\nCorso Vittorio Emanuele II, 24/28<br />\nMilano</p>\n<p><strong>One Block Down</strong><br />\nCorso 22 Marzo, 12<br />\nMilano</p>\n<p><strong>SlamJam Milan</strong><br />\nVia Pasquale Paoli, 3<br />\nMilano</p>\n<p><strong>Space23</strong><br />\nCorso Garibaldi, 104<br />\nMilano</p>\n<p><strong>Special Milano</strong><br />\nVia Tucidide, 56<br />\nMilano</p>\n<p><strong>Spectrum</strong><br />\nVia Felice Casati, 29<br />\nMilano</p>\n<p><strong>Cotton Club</strong><br />\nVia Lambro, 1<br />\nMonza</p>\n<p><strong>Deliberti</strong><br />\nVia Chiatamone, 6<br />\nNapoli</p>\n<p><strong>Space23</strong><br />\nCorso Vittorio Emanuele II, 156<br />\nRoma</p>\n<p><strong>Urban Jungle</strong><br />\nVia Tuscolana, 1246<br />\nRoma</p>\n<p><strong>Degli Effetti</strong><br />\nPiazza Capranica, 93<br />\nRome</p>\n<p><strong>Holypop</strong><br />\nVia del Vantaggio, 46<br />\nRome</p>\n<p><strong>Suede</strong><br />\nVia Dei Serpenti 96<br />\nRome<br />\n<strong><br />\nUrban Star</strong><br />\nVia Enrico Fermi, 91/93<br />\nRome</p>\n<p><strong>Di Vincenzo Boutique</strong><br />\nVia Giovanni Primicerio, 45<br />\nSant´Anastasia</p>\n<p><strong>Sneakers 76</strong><br />\nVia Vincenzo Pupino, 43<br />\nTaranto</p>\n<p><strong>Antonioli</strong><br />\n19, Piazza Carlo Emanuele II, 19<br />\nTorino</p>\n<p><strong>Hannibal</strong><br />\nvia accademia delle scienze, 1<br />\nTurin</p>\n<h2>Japan</h2>\n<p><strong>adidas Originals Fukuoka</strong><br />\n1F Irie Bldg., 1-14-23 Daimyo<br />\nFUKUOKA</p>\n<p><strong>Cherry</strong><br />\n1-1-9 1F, Daimyou, Chuo,Fukuoka-shi,<br />\nFUKUOKA</p>\n<p><strong>Dice &#038; Dice</strong><br />\nDXD bldg 2F 2-1-43 Imaizumi, Chuo-ku<br />\nFukuoka</p>\n<p><strong>adidas Originals Hiroshima</strong><br />\n4-3 Hon-dori, Naka-ku<br />\nHIROSHIMA</p>\n<p><strong>adidas Originals Sapporo, Stellar Place</strong><br />\n4F Center, Sapporo Stellar Place, 2 Kita-gojo-nishi,<br />\nHOKKAIDO</p>\n<p><strong>Undefeated Kanagawa</strong><br />\n2F VIVRE. 2-15-13 MINAMISAIWAI.NISHI-KU.YOKOHAMA<br />\nKANAGAWA</p>\n<p><strong>adidas Sendai</strong><br />\n2-4-5 Chuo, Aoba-ku, Sendai-shi<br />\nMIYAGI</p>\n<p><strong>SWG NAGOYA</strong><br />\n3-1-72 Osu, Naka-ku, Nagoya-shi<br />\nNAGOYA</p>\n<p><strong>Undefeated Okinawa</strong><br />\n1F. RYUBI GALLERIA 1F 2-1-13 MATSUO NAHA-SHI<br />\nOKINAWA</p>\n<p><strong>adidas Originals Shop HEP FIVE</strong><br />\n5F Hep Five, 5-15 Kakuda-cho<br />\nOSAKA</p>\n<p><strong>Hankyu</strong><br />\n8-7,kakudacho,kita-ku,osaka-shi<br />\nOSAKA</p>\n<p><strong>Undefeated Osaka</strong><br />\n1-15-13 Minami-Horie<br />\nOsaka</p>\n<p><strong>adidas Originals Shop Shinsaibashi</strong><br />\n1-15-14 Nishishinsaibashi<br />\nOsaka-shi</p>\n<p><strong>Undefeated Shizuoka</strong><br />\nShizuoka-shi Aoi-ku Konyamachi 6-7<br />\nShizuoka</p>\n<p><strong>adidas Originals Flagship Store Tokyo</strong><br />\nJingumae TAURUS, 5-17-4 Jingumae, Shibuya-ku<br />\nTOKYO</p>\n<p><strong>adidas Originals Tokyo Roppongi</strong><br />\n1F Roppongi Hills Metro Hat/Hollywood Plaza, 6-4-1 Roppongi<br />\nTOKYO</p>\n<p><strong>adidas Tokyo, Shibuya</strong><br />\n23-5 Udagawa-cho, Shibuya-ku<br />\nTOKYO</p>\n<p><strong>adidas Tokyo, Shinjuku</strong><br />\n1-3F, 3-27-4 Shinjuku, Shinjuku-ku<br />\nTOKYO</p>\n<p><strong>BEAMS HAYAJUKU STORE</strong><br />\n3-24-7 Jingumae<br />\nTokyo</p>\n<p><strong>BILLIONAIRE BOYS CLUB</strong><br />\n1F-C 4-25-1 Jingumae<br />\nTokyo</p>\n<p><strong>Billys ENT</strong><br />\n6-23-7 Jingumae<br />\nTokyo</p>\n<p><strong>Dice &#038; Dice Tokyo</strong><br />\nTODD SNYDER TOWNHOUSE B1, 6-18-14 Jingumae, Shibuya-ku<br />\nTokyo</p>\n<p><strong>EDIFICE Shinjuku Store</strong><br />\n3-31-9 Shinjuku<br />\nTokyo</p>\n<p><strong>GR8</strong><br />\n1-11-6 Jingumae<br />\nTokyo</p>\n<p><strong>Hankyu</strong><br />\n4F 2-5-1 Yurakucho<br />\nTOKYO</p>\n<p><strong>Isetan Shinjuku</strong><br />\n3-14-1 Shinjuku<br />\nTokyo</p>\n<p><strong>Mita Sneakers</strong><br />\nAmeyoko Center bldg 2F 4-7-8 ueno , Taito-ku<br />\nTokyo</p>\n<p><strong>Seibu Shibuya</strong><br />\n4F Building B, 21-1, Udagawacho<br />\nTokyo</p>\n<p><strong>Styles Daikanyama</strong><br />\n1F Maison Daikanyama, 11-8 Sarugakucho<br />\nTokyo</p>\n<p><strong>Undefeated Tokyo</strong><br />\n1F P-2 BLDG.4-32-8 Jingumae Shibuya-ku<br />\nTokyo</p>\n<p><strong>United Arrows &#038; Sons</strong><br />\nB1-1F, United Arrows Harajuku For Men 3-28-1 Jingumae<br />\nTokyo</p>\n<p><strong>VA an Omnibus Shoe Store</strong><br />\nB1F, 4-25-29 Jingumae<br />\nTokyo</p>\n<h2>Korea, Republic of</h2>\n<p><strong>adidas Originals Store Busan Seomyun</strong><br />\n694, Joongangdae-ro<br />\nBusan</p>\n<p><strong>adidas Originals Store Daegu Dongsungno</strong><br />\n50, Donsungno 2gil<br />\nDaegu</p>\n<p><strong>adidas Originals Store Gwangju Chungjangno</strong><br />\n91, Chungjangno 2(i)-ga<br />\nGwangju</p>\n<p><strong>adidas Originals Flagship Store Seoul</strong><br />\n13, Apgujeongno 50gil<br />\nSeoul</p>\n<p><strong>adidas Originals Store Seoul Daehakro</strong><br />\n25, Daemyeong-gil<br />\nSeoul</p>\n<p><strong>adidas Originals Store Seoul Itaewon</strong><br />\n144-1, Itaewon-ro<br />\nSeoul</p>\n<p><strong>adidas Originals Store Seoul Myungdong</strong><br />\n20, Myeongdong 8na-gil<br />\nSeoul</p>\n<p><strong>DAS107 by Kasina</strong><br />\n74, Wausan-ro<br />\nSeoul</p>\n<h2>Luxembourg</h2>\n<p><strong>SMETS CONCEPT STORE</strong><br />\n262 Route d&#8217;Arlon<br />\nStrassen</p>\n<h2>Malaysia</h2>\n<p><strong>Sole What</strong><br />\nLingkaran Syed Putra<br />\nKuala Lampur</p>\n<p><strong>adidas Originals Store Pavilion</strong><br />\n168, Jalan Bukit Bintang<br />\nKuala Lumpur</p>\n<p><strong>Crossover</strong><br />\nJalan PJS 11/15<br />\nKUALA LUMPUR</p>\n<h2>Mexico</h2>\n<p><strong>adidas Originals Store Perisur</strong><br />\nPeriférico Sur 4690<br />\nMexico City</p>\n<p><strong>Lust Polanco</strong><br />\nAv. Presidente Masaryk, 311<br />\nMiguel Hidalgo</p>\n<p><strong>adidas Originals Store Toreo</strong><br />\nBlvd. Manuel Avila Camacho 5<br />\nNaucalpan de Juarez</p>\n<h2>Netherlands</h2>\n<p><strong>adidas Originals Store Amsterdam</strong><br />\nLeidsestraat 7<br />\nAmsterdam</p>\n<p><strong>Baskets</strong><br />\nGerard Doustraat 96<br />\nAmsterdam</p>\n<p><strong>Foot Locker</strong><br />\nKalverstraat 103<br />\nAmsterdam</p>\n<p><strong>FOUR by Azzurro</strong><br />\nPieter Cornelisz Hooftstraat 127<br />\nAmsterdam</p>\n<p><strong>Hombre</strong><br />\nOude Leliestraat 10<br />\nAmsterdam</p>\n<p><strong>JD Sports</strong><br />\nNieuwendjyk 196<br />\nAmsterdam</p>\n<p><strong>Patta</strong><br />\nZeedijk 67<br />\nAmsterdam</p>\n<p><strong>size?</strong><br />\nKalverstraat 128<br />\nAmsterdam</p>\n<p><strong>Concrete</strong><br />\nPapestraat 17<br />\nDen Haag</p>\n<p><strong>Ansh46</strong><br />\nVan Oldenbarneveltstraat 99<br />\nRotterdam</p>\n<p><strong>Woei</strong><br />\nHoogstraat 65-A<br />\nRotterdam</p>\n<p><strong>Labels</strong><br />\nPutstraat 12<br />\nSittard</p>\n<h2>New Zealand</h2>\n<p><strong>Area 51</strong><br />\n34 Osborne Street<br />\nAuckland</p>\n<p><strong>Footlocker</strong><br />\n191 Queen St<br />\nAuckland</p>\n<p><strong>Loaded Newmarket</strong><br />\n206 Broadway<br />\nAuckland</p>\n<h2>Norway</h2>\n<p><strong>YME Studios</strong><br />\nKarl Johans Gate 39<br />\nOslo</p>\n<h2>Panama</h2>\n<p><strong>adidas Originals Store Multiplaza</strong><br />\nVía Israel<br />\nPanama</p>\n<h2>Peru</h2>\n<p><strong>adidas Originals Jockey Plaza</strong><br />\nAv. Javier Prado Este 4200, Surco<br />\nLima</p>\n<h2>Philippines</h2>\n<p><strong>adidas Glorietta 2</strong><br />\nAyala Avenue cor. Pasay Road, Ayala Center, Makati<br />\nManila</p>\n<p><strong>Commonwealth</strong><br />\nSM Aura Premier, Fort Bonifacio<br />\nManila</p>\n<p><strong>Sole Academy</strong><br />\nBonifacio High Street<br />\nManila</p>\n<h2>Poland</h2>\n<p><strong>Lab chmielna 20</strong><br />\nChmielna 20<br />\nWarsaw</p>\n<h2>Portugal</h2>\n<p><strong>Wrong weather</strong><br />\nAv. da Boavista 754<br />\nPorto</p>\n<h2>Singapore</h2>\n<p><strong>adidas Originals Store Singapore</strong><br />\n9 Scotts Road<br />\nSingapore</p>\n<p><strong>Limited Edt Chamber</strong><br />\n10 Bayfront Ave<br />\nSingapore</p>\n<h2>Spain</h2>\n<p><strong>24 KILATES</strong><br />\nComercio, 29 Local<br />\nBarcelona</p>\n<p><strong>Foot Locker</strong><br />\nAvenida Portal de l´Angel 6<br />\nBarcelona</p>\n<p><strong>Limited Editions</strong><br />\nCarrer del Duc, 13<br />\nBarcelona</p>\n<p><strong>Limited Editions</strong><br />\nC/ Rera Palau 7<br />\nBarcelona</p>\n<p><strong>LIMITEDEDITIONS</strong><br />\nFRANCESC PUJOLS, 3-5<br />\nBarcelona</p>\n<p><strong>Sivasdescalzo</strong><br />\nDe la Marina, 229<br />\nBarcelona</p>\n<p><strong>Foot Locker</strong><br />\nC/ Preciados 6<br />\nMadrid</p>\n<p><strong>Mini</strong><br />\nCalle del Limón, 24<br />\nMadrid</p>\n<p><strong>Nigra Mercato</strong><br />\nC/ Lope de Vega, 2<br />\nMadrid</p>\n<p><strong>Sivasdescalzo</strong><br />\nCalle Churruca 5<br />\nMadrid</p>\n<p><strong>size?</strong><br />\nCalle de Fuencarrel 12<br />\nMadrid</p>\n<p><strong>ELITE</strong><br />\nConjunto Benabolá, 8<br />\nMálaga</p>\n<h2>Sweden</h2>\n<p><strong>Shelta</strong><br />\nAndra Långgatan 21<br />\nGoteborg</p>\n<p><strong>Sneakersnstuff</strong><br />\nDavidshallsgatan 19<br />\nMalmö</p>\n<p><strong>Très Bien Shop</strong><br />\nFersens Väg 20<br />\nMalmö</p>\n<p><strong>Aplace</strong><br />\nNorrlandsgatan 11<br />\nStockholm</p>\n<p><strong>C-Store</strong><br />\nBrunnsgatan 9<br />\nStockholm</p>\n<p><strong>C-Store</strong><br />\nRegeringsgatan 77<br />\nStockholm</p>\n<p><strong>Paul &#038; Friends</strong><br />\nRegeringsg. 55<br />\nStockholm</p>\n<p><strong>Sneakersnstuff</strong><br />\nÅsögatan 124<br />\nStockholm</p>\n<p><strong>Footish</strong><br />\nÖstra Ågatan 9<br />\nUppsala</p>\n<h2>Switzerland</h2>\n<p><strong>Boutique Roma</strong><br />\nPelikanstrasse 6<br />\nZürich</p>\n<p><strong>Snipes</strong><br />\nNiederdorfstraße 21<br />\nZürich</p>\n<p><strong>titolo sport</strong><br />\nNiederdorfstr. 10<br />\nZürich</p>\n<h2>Taiwan</h2>\n<p><strong>adidas Originals Store Kaohsiung</strong><br />\nNo. 158, Wenheng 2nd Rd<br />\nKaohsiung</p>\n<p><strong>Invincible South</strong><br />\nNo.291, Renyi St.<br />\nKaohsiung</p>\n<p><strong>adidas Originals Store Taichung</strong><br />\nNo. 166, 168, 170, Sec. 2, Gongyi Rd<br />\nTaichung</p>\n<p><strong>Invincible Central</strong><br />\n1, Meicun Rd.<br />\nTaichung</p>\n<p><strong>adidas Originals Store Dun Nan Taipei</strong><br />\nDunhua S. Rd.<br />\nTaipei</p>\n<p><strong>adidas Originals Store Nanxi</strong><br />\nZhongshan N. Rd<br />\nTaipei</p>\n<p><strong>adidas Originals Store Zhong Xiao Taipei</strong><br />\nNo. 183, Section 4, Zhongxiao E Rd<br />\nTaipei</p>\n<p><strong>Invincible East</strong><br />\n4, Zhongxiao E. Rd.<br />\nTaipei</p>\n<p><strong>Juice Taipei</strong><br />\nDunhua S Rd<br />\nTaipei</p>\n<h2>Thailand</h2>\n<p><strong>adidas Originals Store Bangkok Siam Center</strong><br />\nSiam Center,979 Rama 1 Rd, Pathum Wan<br />\nBangkok</p>\n<p><strong>Carnival</strong><br />\n1 Pathum Wan<br />\nBangkok</p>\n<h2>United Kingdom</h2>\n<p><strong>Hanon</strong><br />\n51 The Green, City Centre<br />\nAbderdeen</p>\n<p><strong>Harvey Nichols</strong><br />\n31-32 Wharfside Street<br />\nBirmingham</p>\n<p><strong>Size?</strong><br />\n1-2 Lower Temple Street<br />\nBirmingham</p>\n<p><strong>Consortium</strong><br />\n14 Albert Road<br />\nBournemouth</p>\n<p><strong>Endclothing</strong><br />\n196 Ingram Street<br />\nGlasgow</p>\n<p><strong>HIP</strong><br />\n84-86 Vicar Ln<br />\nLeeds</p>\n<p><strong>wellgosh</strong><br />\n34 High Street<br />\nLeicester</p>\n<p><strong>Size?</strong><br />\n59 Bold Street<br />\nLiverpool</p>\n<p><strong>adidas Originals Store London, Fouberts Place</strong><br />\n15 Fouberts Place<br />\nLondon</p>\n<p><strong>Browns</strong><br />\n24-27 SOUTH MOLTON STREET<br />\nLONDON</p>\n<p><strong>Foot Locker</strong><br />\n283 Oxford Street<br />\nLondon</p>\n<p><strong>Footpatrol Ltd</strong><br />\n80 Berwick Street<br />\nLondon</p>\n<p><strong>Harvey Nichols (London)</strong><br />\n109-125 Knightsbridge<br />\nLondon</p>\n<p><strong>JD Sports</strong><br />\n201-203 Oxford Street<br />\nLondon</p>\n<p><strong>Matches</strong><br />\n87 Marylebone High St<br />\nLONDON</p>\n<p><strong>Size?</strong><br />\n37A Neal Street Covent Garden<br />\nLondon</p>\n<p><strong>Sneakersnstuff</strong><br />\n107-108 Shoreditch High Street<br />\nLondon</p>\n<p><strong>Harvey Nichols</strong><br />\n21 New Cathedral St<br />\nManchester</p>\n<p><strong>Hervia</strong><br />\n40 Spring Gardens<br />\nManchester</p>\n<p><strong>Size?</strong><br />\n37 Market Street<br />\nManchester</p>\n<p><strong>Triads Ltd</strong><br />\n54-56 Albert Road<br />\nMiddlesbrough</p>\n<p><strong>Endclothing</strong><br />\n133 &#8211; 137 Grainger Street,<br />\nNewcastle</p>\n<p><strong>Philip Browne</strong><br />\n3 Guildhall Hill<br />\nNorwich</p>\n<p><strong>18 montrose</strong><br />\n58 Bridlesmith Gate<br />\nNottingham</p>\n<h2>United States</h2>\n<p><strong>adidas Originals Store Aventura</strong><br />\n19575 Biscayne Boulevard<br />\nAventura</p>\n<p><strong>adidas Store Brooklyn</strong><br />\n5100 Kings Plaza<br />\nBrooklyn</p>\n<p><strong>adidas Store Cherry Hill</strong><br />\n2000 Route 38, Suite 1640<br />\nCherry Hill</p>\n<p><strong>adidas CONFIRMED6552</strong><br />\nadidas store Water tower Plaza<br />\n845 N. Michigan Ave., Suite 409<br />\nChicago</p>\n<p><strong>adidas CONFIRMEDLEFT(BL370,4)</strong><br />\nadidas Store Elmhurst<br />\n90-15 Queens Boulevard<br />\nElmhurst</p>\n<p><strong>adidas Store Garden City</strong><br />\n630 Old Country Road<br />\nGarden City</p>\n<p><strong>adidas Originals Store Los Angeles, Melrose Avenue</strong><br />\n8009 Melrose Avenue<br />\nLos Angeles</p>\n<p><strong>adidas Originals Store Miami Beach</strong><br />\n226 8th Street<br />\nMiami Beach</p>\n<p><strong>adidas Originals Store New York, Spring Street</strong><br />\n115 Spring Street<br />\nNew York</p>\n<p><strong>adidas Store New York</strong><br />\n454 Fulton Street<br />\nNew York</p>\n<p><strong>adidas Store Paramus</strong><br />\n1 Garden State Plaza<br />\nParamus</p>\n<p><strong>adidas Store San Francisco</strong><br />\n845 Market Street<br />\nSan Francisco</p>\n<p><strong>adidas store Santa Monica</strong><br />\n1231 Third St. Promenade<br />\nSanta Monica</p>\n"
    
    var finalHTML:String {
        return "\(begin)\(content)\(end)"
    }
    
    let topPadding:CGFloat = 10.0
    let bottomPadding:CGFloat = 10.0
    let leadingPadding:CGFloat = 10.0
    let trailingPadding:CGFloat = 10.0
    
    var isAddedWKWebview = false
    
    internal var webContentHeight:CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.view.backgroundColor = UIColor.green
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.webContentHeight + self.topPadding + self.bottomPadding
        }
        
        return 200.0
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell_default")
            cell.backgroundColor = UIColor.red
            return cell
        }
        
        if indexPath.row == 0 {
            if self.webContentCell == nil {
                print("----- setup wkwebview ------")
                self.webContentCell = tableView.dequeueReusableCell(withIdentifier: "Cell_Web", for: indexPath)
                
                
                
                if isAddedWKWebview == false {
                    isAddedWKWebview = true

                    self.webView = WKWebView()
                    self.webView.scrollView.isScrollEnabled = false
                    self.webView.navigationDelegate = self
                    
                    
                    self.webContentCell?.contentView.addSubview(self.webView)
                    self.webView.translatesAutoresizingMaskIntoConstraints = false
                    
                    let myView = self.webContentCell?.contentView
                    
                    let topPaddingConstraint = NSLayoutConstraint(item: self.webView, attribute: .top, relatedBy: .equal, toItem: myView, attribute: .top, multiplier: 1.0, constant: topPadding)
                    let bottomPaddingConstraint = NSLayoutConstraint(item: self.webView, attribute: .bottom, relatedBy: .equal, toItem: myView, attribute: .bottom, multiplier: 1.0, constant: -bottomPadding)
                    let leadingPaddingConstraint = NSLayoutConstraint(item: self.webView, attribute: .leading, relatedBy: .equal, toItem: myView, attribute: .leading, multiplier: 1.0, constant: leadingPadding)
                    let trailingPaddingConstraint = NSLayoutConstraint(item: self.webView, attribute: .trailing, relatedBy: .equal, toItem: myView, attribute: .trailing, multiplier: 1.0, constant: -trailingPadding)
                    
                    //trailingPaddingConstraint .priority = 950
                    NSLayoutConstraint.activate([topPaddingConstraint, bottomPaddingConstraint,leadingPaddingConstraint,trailingPaddingConstraint])
                    self.loadHTML()
                }
                
            }
            
            return self.webContentCell!
        }
        return UITableViewCell()
    }
    
    private func loadHTML() {
        self.webView.loadHTMLString(self.finalHTML, baseURL: URL(string:"http://www.hypebeast.com"))
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (context) in
            
            
        }) { (context) in
            
            self.webContentHeight = 300
            var newSize = self.webView.frame.size
            newSize.height = self.webContentHeight
            
            self.webView.frame.size = newSize
            self.loadHTML()
        }
        
//        let delayTime = DispatchTime.now() + Double(Int64(0.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: delayTime) {
//            self.webContentHeight = 200.0
//            var newSize = self.webView.frame.size
//            newSize.height = self.webContentHeight
//            self.webView.frame.size = newSize
//            self.loadHTML()
//        }
    }
    
    
    //This will fix the issue of WKWebview inside Tableview cell with content not rendering / showing up.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print("--> \(NSStringFromClass(self.classForCoder)).\(#function)")
        //TODO: Remove this fix when WKWebView will fixed
        self.webView?.setNeedsLayout()
    }
    
    func openURLinkInSFViewController(_ url:URL, fromViewController:UIViewController?) {
        if let fromVC = fromViewController {
            if #available(iOS 9.0, *) {
                if UIApplication.shared.canOpenURL(url) {
                    //Important note: make sure to check the url using canOpenURL as SFSafariViewController might crash if it can't open the provide url.
                    let svc = SFSafariViewController(url:url,  entersReaderIfAvailable: false)
                    fromVC.present(svc, animated: true, completion: nil)
                    return
                }
            } else {
                // Fallback on earlier versions
                //UIApplication.sharedApplication().openURL(url)
            }
        } else {
            // Fallback if fromViewController is nil
            //UIApplication.sharedApplication().openURL(url)
        }
        // Fallback for all other case
        // Fallback if fromViewController is nil or canOpenURL is false or iOS 9.0 below
        UIApplication.shared.openURL(url)
    }
}

extension ViewController: WKNavigationDelegate {
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("--> \(NSStringFromClass(self.classForCoder)).\(#function)")
        
        if let url = URL(string: self.fallBackLink) {
            self.openURLinkInSFViewController(url, fromViewController: self)
        }
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("--> \(NSStringFromClass(self.classForCoder)).\(#function)")

        self.webView.evaluateJavaScript("document.body.scrollHeight;", completionHandler: { (result, error) -> Void in
            if error == nil {
                if let h = result as? CGFloat {
                    print("actual height: \(h)")
                    print("webView.frame.size.height: \(self.webView.frame.size.height)")
                    if self.webView.frame.size.height != h {
                        self.webContentHeight = h
                        DispatchQueue.main.async { () -> Void in
                            self.tableView.reloadData()
                            
                            //below code won't work if using WKWebview
//                            let tableViewCellIndexPath = IndexPath(row: 0, section: 0)
//                            self.tableView.reloadRows(at: [tableViewCellIndexPath], with: UITableViewRowAnimation.none)
                        }
                    }
                }
            }
        })
    }

}

