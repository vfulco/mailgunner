mailgun_api_key <- function() {
  get_option('mailgunner.api_key')
}

mailgun_domain_name <- function() {
  get_option('mailgunner.domain_name')
}

to_env_var <- function(x) {
  gsub("\\.", "_", toupper(x))
}

get_option <- function(opt) {
  opt_value <- getOption(opt, Sys.getenv(to_env_var(opt)))
  if (is.null(opt_value) || !nzchar(opt_value)) {
    stop("You must set option ", sQuote(opt), " in order to use mailgunner.")
  }
  opt_value
}

mailgun_url <- function() {
  paste0("https://api.mailgun.net/v3/", mailgun_domain_name(), "/messages")
}
