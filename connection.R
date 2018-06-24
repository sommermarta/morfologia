library("rsconnect")

rsconnect::setAccountInfo(name='xxx',
                          token='xxx',
                          secret='xxx')

rsconnect::deployApp('.')
