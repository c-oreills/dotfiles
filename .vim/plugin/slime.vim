
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Send_to_Screen(text)
  if !exists("b:slime")
    call Screen_Vars()
  end

  let escaped_text = substitute(shellescape(a:text), "\\\\\n", "\n", "g")
  let command = "screen -S " . b:slime["sessionname"] . " -p " . b:slime["windowname"] . " -X stuff " . escaped_text
  echo command
endfunction

function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function Screen_Vars()
  if !exists("b:slime")
    let b:slime = {"sessionname": "", "windowname": "0"}
  end

  let b:slime["sessionname"] = input("session name: ", b:slime["sessionname"], "custom,Screen_Session_Names")
  let b:slime["windowname"]  = input("window name: ", b:slime["windowname"])
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <C-s><C-s> "ry :call Send_to_Screen(@r)<CR>
nmap <C-s><C-s> vip<C-s><C-s>

nmap <C-s>v :call Screen_Vars()<CR>


