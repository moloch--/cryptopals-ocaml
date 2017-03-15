(*
 *   Name: hex2b64 
 *  About: Converts hex -> base64 
 *)

let println = Printf.printf "%s\n";;
let print_help = Printf.printf "%s <hex>\n";;

(* Is the `number` odd *)
let is_odd number =
    number mod 2 != 0;;

(* Converts a char to string since there is no `string_of_char` *)
let mkstring c =
    String.make 1 c;;

(* Converts two nibbles (hex chars) into a list of "0 x F F" which
 * can be used with `String.concat` *)
let to_byte_string nibble1 nibble2 =
    let nibbles = '0' :: 'x' :: nibble1 :: nibble2 :: [] in
    List.map (fun c -> mkstring c) nibbles;;

(* Converts two hex chars into a string of "0xFF" that can be used with `int_of_string` *)
let to_byte data index =
    int_of_string (String.concat "" (to_byte_string data.[!index] data.[!index + 1])) 

(* Iterates over a string by indexes of 2 (one byte) and puts the corisponding integer value
 * into the `bytes` array *)
let data_to_bytes data =
    let bytes = Array.make (String.length data / 2) '\000' in
    let index = ref 0
    in while !index < String.length data do
        let number = to_byte data index in
        let chr = char_of_int number in 
        Array.set bytes (!index / 2) chr;
        index := !index + 2
    done ;;

(* Verify the cli arguments are in the format we exepct *)
let () = 
    if Array.length Sys.argv != 2 || is_odd (Array.length Sys.argv) then
        print_help Sys.argv.(0)
    else
        data_to_bytes Sys.argv.(1)

