oGame.play_soundtrack(stkEnding);
font = fMono;
next_sentence = 0;
text_bottom = 450;
text_top = 150;
text_speed = .25;
font_scale = 1;
scale_speed = .1;
font_height = font_get_size(font);
has_reached_end = false;
is_holding_transition = true;

final_text = {
	text: "FIM",
	alpha: 0
};

ending_texts = [
	{
		text: "Neste solo correu BUNECO CARRERINHA",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Autuado em flagrante por porte ilegal de ARMA",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "E por CORRER em local PROIBIDO",
		scale: 0,
		y: text_bottom,
	},
	{
		text: " ",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Grades poderao inibir seu direito de ir e vir",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Mas jamais o impedirao de CORRER",
		scale: 0,
		y: text_bottom,
	},
	{
		text: " ",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Ele agora pensa no futuro",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Sera sua vida na prisao semelhante a que tivera outrora?",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Correndo em circulos",
		scale: 0,
		y: text_bottom,
	},
];