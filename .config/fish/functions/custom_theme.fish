function fish_prompt
    set_color purple
    echo -n "harsxv: "
    set_color normal
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' ❯ '
end
