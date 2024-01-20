package main

import "github.com/julienschmidt/httprouter"

func (app *application) routes() *httprouter.Router {
	//Initialize a new router instance
	router := httprouter.New()

	return router
}
