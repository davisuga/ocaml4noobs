type uuid = string[@@deriving yojson];;
type t = {
  id: uuid;
  name: string;
  email: string;
  username: string;

}[@@deriving yojson]