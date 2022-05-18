#=======================================================================================
function fzfrg() {
	# ===============================
	#		KEYS
	# -------------------------------
	#    ctrl-e: Edit with $EDITOR
	#    ctrl-v: View with $CAT
	#    ctrl-p: View with $PAGER
	# -------------------------------
	# ===============================
	#🖧
	#🦠
	STRING_PROMPT="🖳  﫦"
	STRING_POINTER="🦠"
	STRING_HEADER="    "
	# ===============================
	#    	     Color Config
	# ===============================
	COLOR_BG='#090909'
	COLOR_BGP='#202020'
	COLOR_FG='#D9D9D9'
	COLOR_FGP='#00FFFF' #FFFFFF'
	COLOR_INFO='#00FFFF'
	COLOR_HL='#EE004F'  #AA00FF
	COLOR_HLP='#FF00FF' #1AFF7F
	COLOR_HEADER='#0077FF'
	COLOR_POINTER='#53FFAD'
	COLOR_MARKER='#00FF00'
	COLOR_PROMPT='#AA00FF'
	# ===============================
	# 	     Test Variables
	# ===============================
	[[ -z "$EDITOR" ]] &&
		local EDITOR="nvim"
	[[ -z "$CAT" ]] &&
		local CAT="bat"
	[[ -z "$PAGER" ]] &&
		local PAGER="less"
	# ===============================
	# 	         Commands
	# ===============================
	CATCMD="$CAT"
	PAGERCMD=""
	# ===============================
	#		  Localize Variableles
	# ===============================
	local CATCMD PAGERCMD RG_PREFIX FZF_DEFAULT_COMMAND INITIAL_QUERY
	INITIAL_QUERY=""
	RG_PREFIX="rg --column --hidden --colors 'match:style:underline' --colors 'match:style:bold' --colors 'match:style:intense' --colors 'line:fg:blue' --colors 'column:fg:blue' --line-number --no-heading --color=always --smart-case "
	#RG_PREFIX="rg --column --hidden --colors 'match:style:underline' --colors 'match:style:bold' --colors 'match:style:intense' --colors 'line:fg:blue' --colors 'column:fg:blue' --line-number --no-heading --color=always --smart-case "
	FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'"
	# ===============================
	#		          Run FZF
	# ===============================
	fzf \
		--multi \
		--ansi \
		--color=bg:${COLOR_BG},bg+:${COLOR_BGP},info:${COLOR_INFO} \
		--color=hl:${COLOR_HL},fg:${COLOR_FG},header:${COLOR_HEADER},fg+:${COLOR_FGP} \
		--color=pointer:${COLOR_POINTER},marker:${COLOR_MARKER} \
		--color=prompt:${COLOR_PROMPT},hl+:${COLOR_HLP} \
		--bind "change:reload:${RG_PREFIX} {q} || true" \
		--bind "ctrl-p:execute(${PAGER} {})" \
		--bind "ctrl-v:toggle:preview:${CAT} {}" \
		--bind "ctrl-e:execute(${EDITOR} {})" \
		--preview-window hidden \
		--prompt "${STRING_PROMPT}" \
		--header "${STRING_HEADER}" \
		--pointer "${STRING_POINTER}" \
		--query "${INITIAL_QUERY}"
}
#=======================================================================================
#

#
#
#	fzf \
#		--multi \
#		--ansi \
#		--color='bg:#090909,bg+:#202020,info:#BDBB72' \
#		--color='hl:#EE004F,fg:#D9D9D9,header:#012345,fg+:#FFFFFF' \
#		--color='pointer:#53FFAD,marker:#00FF00' \
#		--color='prompt:#98BEDE,hl+:#1AFF7F' \
#		--bind "change:reload:${RG_PREFIX} {q} || true" \
#		--bind "ctrl-p:execute(${PAGER} {})" \
#		--bind "ctrl-v:toggle:preview:${CAT} {}" \
#		--bind "ctrl-e:execute(${EDITOR} {})" \
#		--preview-window hidden \
#		--query "${INITIAL_QUERY}"
#}
