install.packages("twitteR")
install.packages("ROAuth")
install.packages("base64enc")
install.packages("httpuv")
#https://apps.twitter.com/

cred <- OAuthFactory$new(consumerKey='2NFD2caK5La9WAYR1FBb2Gdar',
                         consumerSecret='Z6h7aDzus8xzB68Gpp3I8WJEXKGMhX04kWznH0XrZ638PdM6Ix',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

save(cred, file="twitter authentication.Rdata")
load("twitter authentication.Rdata")

setup_twitter_oauth("2NFD2caK5La9WAYR1FBb2Gdar", 
                    "Z6h7aDzus8xzB68Gpp3I8WJEXKGMhX04kWznH0XrZ638PdM6Ix",
                    "your access token ", # Access token
                    "your access token key")  # Access token secret key
Tweets <- userTimeline('imVohli',n = 1000)
TweetsDF <- twListToDF(Tweets)
write.csv(TweetsDF, "Tweets_sarf.csv")
##Search with a key word
Virat_tweets<-searchTwitter('worldcup', n = 100, lang = "en", resultType = "recent")

TweetsDF<-twListToDF(Virat_tweets)