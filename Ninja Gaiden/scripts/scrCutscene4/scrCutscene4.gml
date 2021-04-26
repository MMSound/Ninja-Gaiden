//this script contains cutscene 4's script
function script_cutscene_4()
{
	myText[0][ENG] = "{Who is it?{";
	myText[1][ENG] = "{You must be\n Walter Smith.\n The name's Ryu.\n Ryu Hayabusa.{";
	myText[2][ENG] = "{Who? That sword...\n Of course. You must be\n Ken Hayabusa's son.{";
	myText[3][ENG] = "{In his last letter,\n my father told me\n I should see you.{";
	myText[4][ENG] = "{Last letter? I see ...\n So it is already begun.{";
	myText[5][ENG] = "{...{";
	myText[6][ENG] = "{Ken and I were on an\n expedition to some old\n Amazon ruins.{";
	myText[7][ENG] = "{We found a strange \n statue and stone tablet.\n On the tablet, it said..{";
	myText[8][ENG] = "{Wait a minute. You mean\n to tell me that\n statue ...{";
	myText[9][ENG] = "{Yes, precisely.\n I thought it had been\n stolen."; //statue
	myText[10][ENG] = "{That demon statue\n possesses enough evil\n power to destroy an\n entire nation.";
	myText[11][ENG] = "{The demon came to this\n earth and caused many\n deaths.";
	myText[12][ENG] = "{But then SHINOBI\n appeared to stop the\n demon.";
	myText[13][ENG] = "{SHINOBI borrowed the\n strength of the dragon"; //sword
	myText[14][ENG] = "{and countered each of\n the demon's spells and\n thus was able to\n overcome it.";
	myText[15][ENG] = "{Yet, though it was\n defeated, the demon was\n not dead."; //walter
	myText[16][ENG] = "{So SHINOBI confined the\n evil power of the demon\n in two statues\n of {LIGHT{ and {SHADOW{.";
	myText[17][ENG] = "{...And the body of the\n demon was confined in a\n temple."; //statues
	myText[18][ENG] = "{This one must be the\n {SHADOW{ statue.\n Therefore....{";
	myText[19][ENG] = "{And now I've got it.\n Bye, friend!{";
	myText[20][ENG] = "{What the ... ?{";
	myText[21][ENG] = "{After him, Ryu!{";
	
	myText[0][JPN] = "「たれた!」";
	myText[1][JPN] = "「ウォルター。スミスさんてすね。わたしはリュウ、\n リュウ。ハヤフサてす。」";
	myText[2][JPN] = "「ん? その剣は… そうか、おまえかあの\n ショウ.ハャフサのせかれか。」";
	myText[3][JPN] = "「父のゆいこんて、あなたに あいにきました。」";
	myText[4][JPN] = "「ゆいこん? そうか… とうとうやっらの手か…。」";
	myText[5][JPN] = "「… 」";
	myText[6][JPN] = "「…わしとショウは なんへいアマンてみっかった\n いせきのちょうさを行なっていた。";
	myText[7][JPN] = "「そのいせきてきみょうな像と、それにまつれるてきこと\n をかいたせきはんをみつけたのた。\n「それには…」";
	myText[8][JPN] = "「待ってくたさい。もしやその像というのは…」";
	myText[9][JPN] = "「おお、まさしく。 うはわれたものとおもったか…。"; //statue
	myText[10][JPN] = "「この邪神像には-日てー大国をほろほすほとの\n おそるへき邪神の決力か針しられておる。」";
	myText[11][JPN] = "「邪神は地にいてて その決力て死をもたらした。";
	myText[12][JPN] = "しかし、その邪神をうっへく「シノヒ」かあらわれた。";
	myText[13][JPN] = "「シノヒは神の力をかりて邪神の呪力を"; //sword
	myText[14][JPN] = "ことことくうちゃふり、邪神をたおしたのた。";
	myText[15][JPN] = "「しかし、たおしたとはいえ邪神は死ぬことはない。"; //walter
	myText[16][JPN] = "そこてかれらは邪神を針しることにした。";
	myText[17][JPN] = "「きょう大な力を針しるため、その呪力を光と影の像に\n わけ、そのからたは神てんに針したという…。"; //statues
	myText[18][JPN] = "「この像はその光と影のうちの、影の邪神像と\n いうらしい。そして… 」";
	myText[19][JPN] = "「邪神像はいたたいた。さらは!」";
	myText[20][JPN] = "「しまった!」";
	myText[21][JPN] = "「おうんた、リュウ!」";
	
	myText[0][ESP] = "{¿Quién eres?{";
	myText[1][ESP] = "{Tú debes ser\n Walter Smith.\n Mi nombre es Ryu.\n Ryu Hayabusa.{";
	myText[2][ESP] = "{¿Quién? Espera... Esa espada...\n ¡Por supuesto! Eres\n el hijo de Ken Hayabusa.{";
	myText[3][ESP] = "{En su última carta,\n mi padre me dijo que\n te buscara.{";
	myText[4][ESP] = "{Última carta? Ya veo ...\n Parece que ya\n ha comenzado.{";
	myText[5][ESP] = "{...{";
	myText[6][ESP] = "{Ken y yo estuvimos\n en una expedición\n unas ruinas en\n el Amazonas.{";
	myText[7][ESP] = "{Encontramos una estatua\n extraña y una tableta de\n piedra, la cual decía...{";
	myText[8][ESP] = "{Un minuto. Me estás\n diciendo que esa\n estatua ...{";
	myText[9][ESP] = "{Sí, precisamente.\n Pensé que había\n sido robada.";
	myText[10][ESP] = "{Esa estatua demoniaca\n tiene suficiente poder\n maligno para destruir\n una nación entera.";
	myText[11][ESP] = "{El demonio vino a este\n mundo hace mucho tiempo\n y causó muchas muertes.";
	myText[12][ESP] = "{Pero fue entonces que\n los SHINOBI aparecieron\n para detener al demonio.";
	myText[13][ESP] = "{SHINOBI utilizó la\n fuerza del dragón";
	myText[14][ESP] = "{y venció cada uno de\n los hechizos del demonio,\n y así logro vencerlo.";
	myText[15][ESP] = "{Pero, aunque fue\n derrotado, el demonio\n seguía vivo.";
	myText[16][ESP] = "{Así que SHINOBI contuvo\n el poder del demonio\n en dos estatuas,\n de {LUZ{ y {OSCURIDAD{.";
	myText[17][ESP] = "{... Y el cuerpo del\n demonio fue encerrado en\n un templo.";
	myText[18][ESP] = "{Esta debe ser la\n estatua de la \n {OSCURIDAD{.\n Por lo cual....{";
	myText[19][ESP] = "{Y ahora es mía.\n ¡Adiós, camarada!{";
	myText[20][ESP] = "{¿Qué rayos ... ?{";
	myText[21][ESP] = "{¡Ryu, detrás de él!{";
	
	myText[0][ITA] = "{Chi va la?{";
	myText[1][ITA] = "{Tu devi essere\n Walter Smith.\n Il mio nome è Ryu.\n Ryu Hayabusa.{";
	myText[2][ITA] = "{E chi saresti?\n Quella spada...\n Ma certo. Devi essere il\n figlio di Ken Hayabusa.{";
	myText[3][ITA] = "{Nella sua ultima lettera,\n mio padre mi\n chiese di incontrarla.{";
	myText[4][ITA] = "{Ultima lettera? Capisco ...\n Quindi è già iniziata.{";
	myText[5][ITA] = "{...{";
	myText[6][ITA] = "{Ken e io stavamo\n svolgendo una\n spedizione presso alcune\n rovine amazzoniche.{";
	myText[7][ITA] = "{Trovammo una strana\n statua e una lapide.\n Sulla lapide\n c'era scritto..{";
	myText[8][ITA] = "{Aspetta un momento. Mi\n sta dicendo che quella\n statua ...{";
	myText[9][ITA] = "{Sì, esattamente.\n Pensavo fosse stata\n rubata.";
	myText[10][ITA] = "{Quella statua demoniaca\n possiede abbastanza\n potere oscuro da distruggere\n un'intera nazione.";
	myText[11][ITA] = "{Il demone arrivò su\n questa terra e causò\n molte morti.";
	myText[12][ITA] = "{Ma poi lo SHINOBI\n arrivò per fermare il\n demone.";
	myText[13][ITA] = "{Lo SHINOBI stava usando la\n forza del drago";
	myText[14][ITA] = "{e respinse ogni singolo\n incantesimo del demone,\n e fu quindi in grado\n di sconfiggerlo.";
	myText[15][ITA] = "{Eppure, nonostante sia\n stato sconfitto, il\n demone non era morto.";
	myText[16][ITA] = "{Quindi lo SHINOBI rinchiuse\n il malvagio potere del\n demone in due statue\n di {LUCE{ e {OMBRA{.";
	myText[17][ITA] = "{...E il corpo del demone\n fu bandito in un\n tempio.";
	myText[18][ITA] = "{Questa deve essere\n la statua d'{OMBRA{.\n Di conseguenza....{";
	myText[19][ITA] = "{E ora ce l'ho io.\n Addio, amico!{";
	myText[20][ITA] = "{Ma cosa ... ?{";
	myText[21][ITA] = "{Inseguilo, Ryu!{";
	
	myText[0][ROM] = "{Cine este?{";
	myText[1][ROM] = "{Tu trebuie să\n fi Walter Smith.\n Numele este Ryu.\n Ryu Hayabusa.{";
	myText[2][ROM] = "{Cine? Sabia aceea...\n Bine înțeles. Tu ești\n fiul lui Ken Hayabusa.{";
	myText[3][ROM] = "{În ultima lui scrisoare,\n tatăl meu mi-a spus\n să te întâlnesc.{";
	myText[4][ROM] = "{Ultima scrisoare?\n Înțeleg...\n Deci a și început.{";
	myText[5][ROM] = "{...{";
	myText[6][ROM] = "{Ken și eu am fost\n în expediție spre niște\n vechi ruine din Amazon.{";
	myText[7][ROM] = "{Am găsit o statuie ciudată\n și o tabletă de piatră.\n Pe tabletă, scria...{";
	myText[8][ROM] = "{Așteaptă. Vrei să\n îmi spui ca acea\n statuie...{";
	myText[9][ROM] = "{Da, exact.\n Am crezut că a fost\n furată.";
	myText[10][ROM] = "{Statuia aceea demon\n posedă destulă\n energie malefică\n încât să distrugă o\n întreagă națiune.";
	myText[11][ROM] = "{Acea statuie demon\n a venit pe pământ și\n a cauzat multe decese.";
	myText[12][ROM] = "{Dar după aceea,\n SHINOBI a apărut să\n oprească demonul.";
	myText[13][ROM] = "{SHINOBI a folosit\n puterea dragonului";
	myText[14][ROM] = "{și a rezistat vrăjilor\n demonului și astfel\n a fost capabil\n să îl învingă.";
	myText[15][ROM] = "{Însă, deși era\n învins, demonul nu\n a fost mort.";
	myText[16][ROM] = "{Așa că SHINOBI a\n păstrat puterea demonului\n în două statui\n a {LUMINII{ și a {UMBREI{.";
	myText[17][ROM] = "{...Și corpul\n demonului a fost\n păstrat într-un templu.";
	myText[18][ROM] = "{Acesta ar trebui să\n fie statuia {UMBREI{.\n Ceea ce înseamnă...{";
	myText[19][ROM] = "{Și acum am luat-o.\n Pa, partenere!{";
	myText[20][ROM] = "{Ce naiba...?{";
	myText[21][ROM] = "{După el, Ryu!{";
	
	myText[0][FRE] = "{Qui est là?{";
	myText[1][FRE] = "{Vous devez être\n Walter Smith.\n Je suis Ryu.\n Ryu Hayabusa.{";
	myText[2][FRE] = "{Qui? Cette épée...\n Bien sûr. Vous devez être\n le fils de Ken Hayabusa.{";
	myText[3][FRE] = "{Dans sa dernière lettre,\n mon père m'a dit que je\n devrais venir vous voir.";
	myText[4][FRE] = "{Dernière lettre?\n Je vois... Donc tout cela\n a déjà commencé.{";
	myText[5][FRE] = "{...{";
	myText[6][FRE] = "{Ken et moi partions\n en expédition pour\n d'anciennes ruines\n Amazoniennes.{";
	myText[7][FRE] = "{Nous y trouvions une\n étrange statue et une\n tablette de pierre. Sur\n celle-ci, il y avait..{";
	myText[8][FRE] = "{Attendez une minute.\n Vous voulez dire que\n cette statue ...{";
	myText[9][FRE] = "{Oui, précisément.\n Je pensais qu'elle avait\n été volée.{";
	myText[10][FRE] = "{Cette statue démoniaque\n possède assez de pouvoir\n maléfique pour détruire\n une nation entière.";
	myText[11][FRE] = "{Le démon vint sur\n cette terre et causa\n de nombreux morts.";
	myText[12][FRE] = "{Mais c'est alors que\n SHINOBI apparut pour\n arrêter le démon.";
	myText[13][FRE] = "{SHINOBI emprunta la\n force du dragon";
	myText[14][FRE] = "{et contra chacun des sorts\n du démon et en vint ainsi\n à bout.";
	myText[15][FRE] = "{Cependant, bel et bien\n battu, le démon n'était\n pas mort.";
	myText[16][FRE] = "{C'est ainsi que SHINOBI\n scella le pouvoir\n maléfique du démon dans\n deux statues...";
	myText[17][FRE] = "{de {LUMIÈRE{ et {OMBRE{.\n ...Et le corps du démon\n fut enfermé dans un temple.";
	myText[18][FRE] = "{Celle-ci doit être\n la statue de l'{OMBRE{.\n Et donc....{";
	myText[19][FRE] = "{Et maintenant elle est\n à moi.\n À plus, mon pote!{";
	myText[20][FRE] = "{Qu'est ce que ... ?{";
	myText[21][FRE] = "{Après lui, Ryu!{";
	
	myText[0][420] = " { {";
	myText[1][420] = "           {           \n       { {";
	myText[2][420] = "                 {  \n {    {   {";
	myText[3][420] = "     { {";
	myText[4][420] = "   {                 {";
	myText[5][420] = "";
	myText[6][420] = "     {      {   { {";
	myText[7][420] = "      {               { { \n       {       {";
	myText[8][420] = "     {";
	myText[9][420] = "           {          {";
	myText[10][420] = "         {      {  { \n    {      { {";
	myText[11][420] = "       {      {        ";
	myText[12][420] = "           {    { {";
	myText[13][420] = "   {              ";
	myText[14][420] = "  {    {          {";
	myText[15][420] = "";
	myText[16][420] = "  {        {";
	myText[17][420] = "         {               \n        {  {   {";
	myText[18][420] = "";
	myText[19][420] = "       {     {";
	myText[20][420] = "";
	myText[21][420] = "    {";

}