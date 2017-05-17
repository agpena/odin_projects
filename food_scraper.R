library(dplyr)
library(xml2)
library(RSelenium)
library(RCurl)
library(XML)

van <- read_html(file.choose())

foods<-c()
i<-0

for(i in 1:49){
	foods<-append(foods,van %>% 
	html_node(paste0('div #cphMain_ltvNutrition_pnlRowContainer_',i)) %>% 
	html_text()
	)
}

rbind(van %>% html_node(paste0('div #cphMain_ltvNutrition_pnlRowContainer_',0)) %>% 
html_text(),foods)-> foods

write.csv(foods,'test.csv')


####

food_scraper <- function(){

van <- read_html(file.choose())

	i <- 0
	letters_df <- c()

	while(i < 50) {
		van %>% 
			html_node(paste0('div #cphMain_ltvNutrition_pnlRowContainer_',i)) %>% 
			html_children() %>% html_text(trim = TRUE) -> letter_item
	
		letters_df <- rbind(letters_df,letter_item)
	
		i = i + 1
	}
	
	return(letters_df)
}

#letter_item_df <- food_scraper()

letterman <- function(which_letter="A"){
voe <- food_scraper()
vit <- food_scraper()
min <- food_scraper()

letter_totals <- cbind(voe,vit,min)

write.csv(letter_totals,paste0('item_letter','_',which_letter,'.csv'))
}

letterman("A")

#RSelenium

j <- 7

current_letter <- LETTERS[j]

base_url <- 'https://www.voedingswaardetabel.nl/'

page1_url <- paste0(base_url,'voedingswaarde/',current_letter,'/')
page2_url <- paste0(base_url,'voedingswaarde/vitamines/',current_letter,'/')
page3_url <- paste0(base_url,'voedingswaarde/mineralen/',current_letter,'/')


rD <- rsDriver(browser = "phantomjs", verbose = FALSE)

# Assign the client
remDr <- rD$client

# Establish a wait for an element
remDr$setImplicitWaitTimeout(1000)

for(i in 1:3){
	appURL <- get(paste0('page',i,'_url'))
	remDr$navigate(appURL)

	# Give a crawl delay to see if it gives time to load web page
	Sys.sleep(10)   # Been testing with 10

	page_source <- remDr$getPageSource()

	assign(paste0('letter_item',i),read_html(unlist(page_source)) %>% 
	html_node(paste0('div #cphMain_ltvNutrition_pnlRowContainer_',0)) %>% 
	html_children() %>% html_text(trim = TRUE))
	print(paste0('completed',i))
}
# close client/server
remDr$close()
rD$server$stop()

letter_totals <- cbind(letter_item1,letter_item2,letter_item3)

#End RSelenium 

########


van %>% 
		html_node(paste0('div #cphMain_ltvNutrition_pnlRowContainer_',i)) %>% 
		html_text() %>% strsplit(" ") %>% 
		unlist() %>% 
		paste0() %>% 
		trimws()
letter_item %>%
		match("") %>% 
		is.na() %>%
		grep(TRUE,.) -> temp_index

		letter_item %>% 
		.[temp_index] -> letter_vector
		
				
		temp_index[match(TRUE,temp_index-temp_index[1]>10)]
		
		letters_df <- rbind(letters_df,letter_vector)

 
 