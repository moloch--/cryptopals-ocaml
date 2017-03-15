(*
 *   Name: hex2b64 
 *  About: Converts hex -> base64 
 *)


let println = Printf.printf "%s\n";;
let print_help = Printf.printf "%s <hex>\n";;

let is_odd number =
    number mod 2 != 0;;

let mkstring c =
    String.make 1 c;;

let to_byte_string nibble1 nibble2 =
    let nibbles = '0' :: 'x' :: nibble1 :: nibble2 :: [] in
    List.map (fun c -> mkstring c) nibbles;;

let to_byte data index =
    int_of_string (String.concat "" (to_byte_string data.[!index] data.[!index + 1])) 

let data_to_bytes data =
    let bytes = Array.make (String.length data / 2) '\000' in
    let index = ref 0
    in while !index < String.length data do
    let number = to_byte data index in
        let chr = char_of_int number in Array.set bytes (!index / 2) chr;
    index := !index + 2
    done ;;


let () = 
    if Array.length Sys.argv != 2 || is_odd (Array.length Sys.argv) then
        print_help Sys.argv.(0)
    else
        data_to_bytes Sys.argv.(1)

