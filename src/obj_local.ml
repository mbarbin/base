open! Import

type t = Stdlib.Obj.t
type raw_data = Stdlib.Obj.raw_data

external magic : (_[@local_opt]) -> (_[@local_opt]) = "%identity"
external repr : (_[@local_opt]) -> (t[@local_opt]) = "%identity"
external obj : (t[@local_opt]) -> (_[@local_opt]) = "%identity"
external size : (t[@local_opt]) -> int = "%obj_size"

(* The result doesn't need to be marked local because the data is copied into a fresh
   nativeint block regardless. *)
external raw_field : (t[@local_opt]) -> int -> raw_data = "caml_obj_raw_field"

external set_raw_field
  :  (t[@local_opt])
  -> int
  -> raw_data
  -> unit
  = "caml_obj_set_raw_field"

external tag : (t[@local_opt]) -> int = "caml_obj_tag" [@@noalloc]
