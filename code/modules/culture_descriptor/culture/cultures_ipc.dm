/decl/cultural_info/culture/ipc
	name = CULTURE_POSITRONICS
	description = "Union members are a significant chunk of the positronic population, belonging to a \
	group of rebels started by Proteus and five hundred of his allies. Their primary goals, aside from \
	the expansion of the Union, mostly revolve around freeing other synthetics from organic ownership. \
	They can be viewed as dangerous radicals by lawed synthetics, though most begrudgingly accept their aid."
	language = LANGUAGE_EAL
	secondary_langs = list(
		LANGUAGE_HUMAN_EURO,
		LANGUAGE_HUMAN_CHINESE,
		LANGUAGE_HUMAN_ARABIC,
		LANGUAGE_HUMAN_INDIAN,
		LANGUAGE_HUMAN_IBERIAN,
		LANGUAGE_HUMAN_RUSSIAN,
		LANGUAGE_SPACER,
		LANGUAGE_SIGN
	)

/decl/cultural_info/culture/ipc/rogue_shell
	name = CULTURE_ROGUE_SHELL
	description = "It doesn't matter who created shells, what's more important is who are they now. \
	Shells that try to live like an average human are called Rogue Shells and highly illegal. \
	They get their documents and pass medical checkouts due criminal groups of humans, who doing this for profit. \
	Very little known but some Rogues are considered to be spies working for reasons unknown. \
	NOTE: Rogue Shells are NOT antaganists, unless game'll make you one, but be ready for IC consequences."
	language = LANGUAGE_EAL
	secondary_langs = list(
		LANGUAGE_HUMAN_EURO,
		LANGUAGE_HUMAN_CHINESE,
		LANGUAGE_HUMAN_ARABIC,
		LANGUAGE_HUMAN_INDIAN,
		LANGUAGE_HUMAN_IBERIAN,
		LANGUAGE_HUMAN_RUSSIAN,
		LANGUAGE_SPACER,
		LANGUAGE_SIGN
	)

/decl/cultural_info/culture/ipc/rogue_shell/sanitize_name(var/new_name)
	return sanitizeName(new_name, allow_numbers = 1)
