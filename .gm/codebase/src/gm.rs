#[macro_use]
extern crate lazy_static;
extern crate hyper;
extern crate tokio;

use ansi_term::Color::{Cyan, Green, Red};
use home::home_dir;
use hyper::{Client, Uri};
use serde_derive::{Deserialize, Serialize};
use spinners_rs::{Spinner, Spinners};
use std::error::Error;
use std::path::PathBuf;
use std::str;
use std::{fs, process};

lazy_static! {
    static ref CONFIG_PATH: PathBuf =
        PathBuf::from(format!("{}/.gm/config.json", home_dir().unwrap().display()));
}

const GM: &str = r#"
                                 ___
                              .'/   \
              __  __   ___   / /     \
      .--./) |  |/  `.'   `. | |     |
     /.''\\  |   .-.  .-.   '| |     |
    | |  | | |  |  |  |  |  ||/`.   .'
     \`-' /  |  |  |  |  |  | `.|   |
     /("'`   |  |  |  |  |  |  ||___|
     \ '---. |  |  |  |  |  |  |/___/
      /'""'.\|__|  |__|  |__|  .'.--.
     ||     ||                | |    |
     \'. __//                 \_\    /
      `'---'                   `''--'
"#;

#[derive(Deserialize, Serialize)]
struct Config {
    pub commands: Vec<Command>,
}

#[derive(Deserialize, Serialize)]
struct Command {
    loading_text: String,
    command: String,
    args: Vec<String>,
}

#[derive(Deserialize, Serialize)]
struct QuoteApiResponse<'a> {
    pub author: &'a str,
    pub content: &'a str,
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error + Send + Sync>> {
    // Load our config
    let config_content =
        fs::read_to_string(CONFIG_PATH.as_path()).expect("Missing config at \"~/.gm/config.json\"");
    let config: Config = serde_json::from_str(&config_content)?;

    // Get a quote to display
    let client = Client::new();
    let res = client
        .get(Uri::from_static("http://api.quotable.io/random"))
        .await?;
    let res = hyper::body::to_bytes(res).await?;
    let quote: QuoteApiResponse<'_> = serde_json::from_str(str::from_utf8(&res).unwrap())?;

    // Print GM Prompt
    println!("{}", Green.paint(GM));
    // Print Quote
    println!(
        "\n 👉 \"{}\" - {}\n",
        quote.content,
        Cyan.bold().paint(quote.author)
    );

    // Run commands
    for command in config.commands {
        run_command(command.loading_text, command.command, command.args);
    }

    // Exit
    println!("\n{} Have a good day!", Cyan.bold().paint("🎉 Done!"));
    Ok(())
}

/// Run a command and display a spinner while it is running
fn run_command(message: String, command: String, args: Vec<String>) {
    let mut sp = Spinner::new(Spinners::Aesthetic, Green.paint(message));
    sp.start();
    if let Err(err) = process::Command::new(command).args(args).output() {
        print_error_message(err);
        process::exit(1);
    };
    sp.stop();
}

/// Print an error message
fn print_error_message<T: Error>(err: T) {
    println!("\n\n{}", Red.paint("Uh oh! An error occurred:"));
    eprintln!("{}", err);
}
