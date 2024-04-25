package main

import (
	"context"
	"github.com/Maksim-Gr/goBeyond/internal/data"
	"net/http"
)

type contextKey string

const userContextKey = contextKey("user")

// Returning a new context with provided user value
func (app *application) contextSetUser(r *http.Request, user *data.User) *http.Request {
	ctx := context.WithValue(r.Context(), userContextKey, user)
	return r.WithContext(ctx)
}

func (app *application) contextGetUser(r *http.Request) *data.User {
	user, ok := r.Context().Value(userContextKey).(*data.User)
	if !ok {
		panic("missing user value in request context")
	}
	return user
}
