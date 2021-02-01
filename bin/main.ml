open Opium

let pub_static =
  Middleware.static_unix
    ~local_path:"./public"
    ~uri_prefix:"/"
    ()
    
 (** Build the Opium app  *)
let app : Opium.App.t =
  App.empty
  |> App.cmd_name "webapp"
  |> App.get "/" (fun _request -> Views.Index.index |> Response.of_html |> Lwt.return)
  |> App.middleware pub_static

let log_level = Some Logs.Debug
 
 (** Configure the logger *)
let set_logger () =
  Logs.set_reporter (Logs_fmt.reporter ());
  Logs.set_level log_level
 
 (** Run the application *)
let () =
   set_logger ();
  (* run_command' generates a CLI that configures a deferred run of the app *)
   match App.run_command' app with
   (* The deferred unit signals the deferred execution of the app *)
   | `Ok (app : unit Lwt.t ) -> Lwt_main.run app
   | `Error                  -> exit 1
   | `Not_running            -> exit 0
