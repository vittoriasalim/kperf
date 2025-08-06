package request

import "sync"

// Cache is a thread-safe cache for storing resource names
type Cache struct {
	mu    sync.Mutex
	items []string
}

// InitCache creates a new empty cache
func InitCache() *Cache {
	return &Cache{
		items: make([]string, 0),
	}
}

// Pop removes and returns the first item from the cache.
// Returns empty string and false if cache is empty.
func (c *Cache) Pop() (string, bool) {
	c.mu.Lock()
	defer c.mu.Unlock()

	if len(c.items) == 0 {
		return "", false
	}

	name := c.items[0]
	c.items = c.items[1:]
	return name, true
}

// Push adds an item to the cache.
func (c *Cache) Push(name string) {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.items = append(c.items, name)
}

// Len returns the number of items in the cache.
func (c *Cache) Len() int {
	c.mu.Lock()
	defer c.mu.Unlock()
	return len(c.items)
}
